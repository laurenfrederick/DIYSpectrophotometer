   M S B A M L   `   `   `  ���� N  JWpfMvvmApplication1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullO,clr-namespace:WpfMvvmApplication1.ViewModelsWpfMvvmApplication1.ViewModels  O,clr-namespace:WpfMvvmApplication1.ConvertersWpfMvvmApplication1.Converters  *    $WpfMvvmApplication1.Views.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     C
viewModels,clr-namespace:WpfMvvmApplication1.ViewModels     C
converters,clr-namespace:WpfMvvmApplication1.Converters       � Title$  Scatter Cell�� � WindowStartupLocation$ CenterScreen=�$	��400��$	��450�� � 	Resources <   6WpfMvvmApplication1.Converters.BoolToOppositeConverter   BoolToOppositeConverter  
labelStyle �� 
TargetType �� Property �� Value  textBoxStyle  buttonStyle �� Triggers P� Property P� Value��%`  &	        &	      &	 H     &	 k     '��       �� " ��.���  � ��$ Italic$���  � ��$ SemiBold"��� " ��.���  � ��$ 25���� " ��.���  � ��$ 25����  � �� �#605D8C��  � ��
 ����� P�  �@J�IsMouseOver . . ���  � �� �#403C76�� " ��.���  � �� �#403C76.��� ���#DCDBE2 	 �� BasedOn��%W   '��       7  '��      7  '��      7  �� 8	   " ���� 8	   " ���� 8	   " ��.+��� 
 �� Orientation$
 Vertical=�$��10q�$��Center=�$	��Top=�.+�� $��10q� � RowDefinitions �� $
��Auto ��� $��30 ��� $
��Auto � � ColumnDefinitions �� $
��Auto ��� $	��140 ��� $
��Auto �.+��� $��0��$��0��$��Select a Serial Port: ��$��Right=��� $��0��$��1��$	��120������ *SerialPorts+ �� SelectedItem �� *SelectedPort+�� $��1��$��0��$��
File Path:��$��Right=� �� Target ��  �� ElementName$ textBoxFilePath���� -   $��textBoxFilePath��$��1��$��1��$	��120������ *	CsvPath+{��� *	IsRunning+ �� 	Converter# [  �� -   $��1��$��2��$��Browse��$��50��{��� *	IsRunning+# [  �� $��2��$��0��$��
File Name:��$��Right=� �� $ textBoxFilePrefix���� -   $��textBoxFilePrefix��$��2��$��1��$	��120������ *	CsvPrefix+{��� *	IsRunning+# [  � $��10q� �� $
��Auto ��� $
��Auto � �� $
��Auto ��� $
��Auto ��� $��50 ��� $
��Auto �.+��� $��1��$��0��$��5q� d� 	IsChecked �� *UseAutoStop+�� $��1��$��1��$��Auto Stop (minutes):�� �� $ textBoxAutoStop���� -   $��textBoxAutoStop��$��1��$��2��$��30������ *
AutoStop+{��� *CanSetAutoStop+�� $��1��$��3��$��+10 Minutes��$	��100������ *AddTenMinutesCommand+{��� *UseAutoStop+�� $��20q�$	��100������ *	RunText+���� *
RunCommand+� $��10q�$	��350�� �� $
��Auto � �� $
��Auto �.+��� $��0��$��0��$	��350�� ��%    ���� " ��.���  � �� �#AEADC1��  � y�$ Hidden=� ��  �� Binding �� *	IsRunning+ �� Value True.a���  � y�$ Visible=�.+��� $��STATUS���� ���� *RunningTimeString+�� $
 
Horizontal=�.+��� $#��Average of Last 10 Readings: �� �� $ lastReadTextBox���� -   $��lastReadTextBox��$��5q����� *
LastRead+�� $
 
Horizontal=�.+��� $��Writing to File: �� �� $ textBlockFile���� -   $��textBlockFile��$��5q���  �� Command �� *OpenCsvFolderCommand+.�.��� ���� *CsvFileName+�� $��0��$��0��$	��350�� ��%    ���� " ��.���  � �� �#AEADC1��  � y�$ Hidden=� ��  �� *RunComplete+ True.a���  � y�$ Visible=�.+��� $��	RUN STATS���� ���� *RunFinishedTimeString+�� $
 
Horizontal=�.+��� $#��Average of Last 10 Readings: �� �� $ lastReadTextBoxFinish���� -   $��lastReadTextBoxFinish��$��5q����� *
LastRead+�� $
 
Horizontal=�.+��� $��Results in File: �� �� $ textBlockFileComplete���� -   $��textBlockFileComplete��$��5q���  �� *OpenCsvFolderCommand+.�.��� ���� *CsvFileName+