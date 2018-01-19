using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Timers;
using System.Windows;
using System.Windows.Input;
using System.Windows.Interop;
using WpfMvvmApplication1.Helpers;
using WpfMvvmApplication1.Models;

/*
Remove interval second config
Option to turn auto stop off
Remove Stable Signal 
Display last reading
*/

namespace WpfMvvmApplication1.ViewModels
{
    public class MainWindowViewModel : BaseViewModel
    {
        #region Fields 

        private int _runningTimeSeconds = 0;

        private bool _isRunning = false;

        private Timer _timer;

        private SerialPort _serialPort;

        private object _mutex = new object();

        private bool _debugMode = false;

        private List<int> _lastReads = new List<int>();

        private bool _useAutoStop = true;

        private bool _runComplete = false;

        #endregion

        #region Properties

        public bool UseAutoStop
        {
            get { return _useAutoStop; }
            set
            {
                _useAutoStop = value;
                RaisePropertyChanged(() => UseAutoStop);
                RaisePropertyChanged(() => CanSetAutoStop);
            }
        }

        public bool CanSetAutoStop
        {
            get { return IsRunning == false && UseAutoStop; }
        }

        public string CsvPath { get; set; }
        public string CsvPrefix { get; set; }

        public string CsvFileName { get; set; }
        public int AutoStopMinutes { get; set; }
        public int RunningTimeMinutes
        {
            get { return (int)(_runningTimeSeconds / 60); }
        }

        public bool IsRunning
        {
            get { return _isRunning; }
            set
            {
                _isRunning = value;
                RaisePropertyChanged(() => IsRunning);
                RaisePropertyChanged(() => CanSetAutoStop);
                RaisePropertyChanged(() => RunText);
            }
        }

        public string RunningTimeString
        {
            get { return String.Format("Running {0} minutes...", RunningTimeMinutes); }
        }

        public string RunFinishedTimeString
        {
            get { return String.Format("Ran for {0} minutes.", RunningTimeMinutes); }
        }

        public string AutoStop { get; set; }

        public string RunText
        {
            get { return IsRunning ? "Stop Run" : "Start Run"; }
        }

        public int LastRead { get; set; }

        public List<string> SerialPorts
        {
            get { return SerialPort.GetPortNames().ToList<string>(); }
        }

        public string SelectedPort { get; set; }

        public bool RunComplete
        {
            get { return _runComplete; }
            set
            {
                _runComplete = value;
                RaisePropertyChanged(() => RunComplete);
            }
        }

        public int RunningTimeSeconds
        {
            get { return _runningTimeSeconds; }
            set
            {
                _runningTimeSeconds = value;
                RaisePropertyChanged(() => RunningTimeSeconds);
                RaisePropertyChanged(() => RunningTimeString);
                RaisePropertyChanged(() => RunningTimeMinutes);
                RaisePropertyChanged(() => RunFinishedTimeString);
            }
        }

        #endregion


        #region Commands

        public ICommand RunCommand { get { return new DelegateCommand(ToggleRun); } }
        public ICommand AddTenMinutesCommand { get { return new DelegateCommand(AddMinutes); } }

        public ICommand OpenCsvFolderCommand { get { return new DelegateCommand(OpenCsvFolder); } }

        #endregion

        #region Ctor
        public MainWindowViewModel()
        {
            AutoStop = "10";
            LastRead = 0;

            CsvPath = @"C:\temp";
            CsvPrefix = "results";

            SelectedPort = "COM3";


        }
        #endregion

        public void SetCsvPath(string path)
        {
            CsvPath = path;
            RaisePropertyChanged(() => CsvPath);
        }

        private void ToggleRun()
        {
            if (IsRunning)
            {
                StopRun();
            }
            else
            {
                StartRun();
            }
        }

        private bool CanStartRun()
        {
            return IsRunning == false;
        }

        private void StartRun()
        {
            RunningTimeSeconds = 0;

            RunComplete = false;

            try
            {
                if (UseAutoStop)
                {
                    AutoStopMinutes = Int32.Parse(AutoStop);
                }
            }
            catch
            {
                UseAutoStop = false;
            }

            try
            {
                _serialPort = new SerialPort();
                _serialPort.BaudRate = 9600;
                _serialPort.PortName = SelectedPort;
                _serialPort.Open();
            }
            catch (Exception e)
            {
                MessageBox.Show("Error opening serial port: " + e.Message, "ERROR");

#if DEBUG
                _debugMode = true;
#endif
            }

            CsvFileName = String.Format(@"{0}\{1}_{2}.csv", CsvPath, CsvPrefix, DateTime.Now.ToString("MMddyyyy_HHmmss"));
            RaisePropertyChanged(() => CsvFileName);

            _lastReads = new List<int>();

            _timer = new Timer();
            _timer.Interval = 1000;

            _timer.Elapsed += _timer_Elapsed;
            _timer.Start();

            IsRunning = true;
        }

        void _timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            RunningTimeSeconds++;

            string readExisting = String.Empty;

            if (_debugMode)
            {
                readExisting = "241  1234 bits";
            }
            else
            {
                readExisting = _serialPort.ReadExisting();
            }

            string[] split = readExisting.Split(new string[] { "  ", "\n", "bits", "bit" }, StringSplitOptions.RemoveEmptyEntries);

            string reading = "0";
            if (split.Length > 0)
            {
                reading = split[split.Length - 1];
            }

            WriteEntryToCsv(reading);

            try
            {
                int lastRead = int.Parse(reading);

                if (_lastReads.Count > 10)
                {
                    _lastReads.RemoveAt(0);
                }

                _lastReads.Add(lastRead);

                LastRead = (int)_lastReads.Average<int>(a => a);
                RaisePropertyChanged(() => LastRead);
            }
            catch { }

            if (UseAutoStop && (int)(_runningTimeSeconds / 60) >= AutoStopMinutes)
            {
                StopRun();
            }
        }


        private void StopRun()
        {
            _timer.Stop();
            IsRunning = false;

            RunComplete = true;

            if (_debugMode == false)
            {
                _serialPort.Close();
            }
        }

        private void AddMinutes()
        {
            AutoStopMinutes += 10;
            AutoStop = AutoStopMinutes.ToString();
            RaisePropertyChanged(() => AutoStop);
        }

        private void WriteEntryToCsv(string reading)
        {
            lock (_mutex)
            {
                if (File.Exists(CsvFileName) == false)
                {
                    FileStream createStream = File.Create(CsvFileName);
                    createStream.Close();
                }

                using (StreamWriter writer = File.AppendText(CsvFileName))
                {
                    writer.Write(String.Format("{0}, {1}", _runningTimeSeconds, reading));
                    writer.Write(writer.NewLine);

                    writer.Close();
                }
            }

        }

        private void OpenCsvFolder()
        {
            try
            {
                Process.Start(CsvPath);
            }
            catch (Exception e)
            {
                MessageBox.Show(String.Format("Error opening folder {0}: {1}", CsvPath, e.Message), "ERROR");
            }
        }
    }
}