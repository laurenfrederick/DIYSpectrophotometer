   M S B A M L   `   `   `  ����N  JWpfMvvmApplication1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullO,clr-namespace:WpfMvvmApplication1.ViewModelsWpfMvvmApplication1.ViewModels  5      O,clr-namespace:WpfMvvmApplication1.ConvertersWpfMvvmApplication1.Converters  5   	   *    $WpfMvvmApplication1.Views.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   C
viewModels,clr-namespace:WpfMvvmApplication1.ViewModels     5      C
converters,clr-namespace:WpfMvvmApplication1.Converters     5   	     � Title$  Scatter Cell��5	   	    � WindowStartupLocation$ CenterScreen=�5
   	   $	��400��5   	   $	��450��5   	    � 	Resources 5      <   6WpfMvvmApplication1.Converters.BoolToOppositeConverter   BoolToOppositeConverter  
labelStyle �� 
TargetType �� Property �� Value  textBoxStyle  buttonStyle �� Triggers P� Property P� Value��%U  &	        &	      &	 �     &	 �     '�� �      5   
   6-   �� 5   
   " ��6#   .�5      ��  � ��$ Italic$�6*   �� 5       � ��$ SemiBold"�6+   5      �� 5   
   " ��6%   .�5      ��  � ��$ 25��6'   5      �� 5   
   " ��6$   .�5      ��  � ��$ 25��6'   �� 5       � �� �#605D8C6+   �� 5       � ��
 �����6+    5      P� 5       �@J�IsMouseOver . . �5      ��  � �� �#403C7663   5      5      �� 5    
   " ��6   .�5!      ��  � �� �#403C766+   5"      5#      .��5$      � ���#DCDBE2 5%   
   	 �� BasedOn��%�   '��       7  '��      7  '�� :     7  �� 5&      8	   " ��6:   �� 5'      8	   " ��6<   �� 5(      8	   " ��6;   5)      .+�5*   
   �� 
 �� Orientation$
 Vertical=�6   $��10q�5+      $��Center=�5,      $	��Top=�5-      .+�5/      � $��10q�6    � RowDefinitions 50      �� 51      $
��Auto �6$   �� 52      $��30 �6$   �� 53      $
��Auto �6$    � ColumnDefinitions 55      �� 56      $
��Auto �6'   �� 57      $	��140 �6'   �� 58      $
��Auto �6'   .+�5;      �� $��0��6   $��0��6%   $��Select a Serial Port: ��65   $��Right=�6V   �� 5<      $��0��6   $��1��6(   $	��120��6�   ��69   �� *SerialPorts+ �� SelectedItem 6]   �� *SelectedPort+6�   �� 5>      $��1��6   $��0��6%   $��
File Path:��65   $��Right=�6y    �� Target 6J   ��  �� ElementName$ textBoxFilePath��6y   �� 5?      -   5        $��textBoxFilePath��5?   8   $��1��6   $��1��6(   $	��120��6�   ��6O   �� *	CsvPath+{�6h   �� *	IsRunning+ �� 	Converter# [  6�   �� 5@      -   5        $��1��5@      $��2��6&   $��Browse��6K   $��50��6�   {�6\   �� *	IsRunning+# [  6�   �� 5C      $��2��6   $��0��6%   $��
File Name:��65   $��Right=�6{    6J   �� $ textBoxFilePrefix��6{   �� 5D      -   5        $��textBoxFilePrefix��5D   8   $��2��6   $��1��6(   $	��120��6�   ��6Q   �� *	CsvPrefix+{�6l   �� *	IsRunning+# [  6�   5F      � 5H      $��10q�6    5I      �� 5J      $
��Auto �6$   �� 5K      $
��Auto �6$    5M      �� 5N      $
��Auto �6'   �� 5O      $
��Auto �6'   �� 5P      $��50 �6'   �� 5Q      $
��Auto �6'   .+�5T      �� $��1��6   $��0��6(   $��5q�6Z    d� 	IsChecked 68   �� *UseAutoStop+6Z   �� 5U      $��1��6   $��1��6%   $��Auto Stop (minutes):��65    6T   �� $ textBoxAutoStop���� 5V      -   5        $��textBoxAutoStop��5V   8   $��1��6   $��2��6(   $��30��6�   ��6O   �� *
AutoStop+{�6i   �� *CanSetAutoStop+6�   �� 5W      $��1��6   $��3��6'   $��+10 Minutes��67   $	��100��6�   ��6M   �� *AddTenMinutesCommand+{�6v   �� *UseAutoStop+6�   5X      �� 5[      $��20q�6P   $	��100��6\   ��6   �� *	RunText+��61   �� *
RunCommand+5g      � 5i      $��10q�6   $	��350��6    5j      �� 5k      $
��Auto �6$    5m      �� 5n      $
��Auto �6'   .+�5p      �� $��0��6   $��0��6*   $	��350��6:    5q      ��%    5s      ��5t      �� 5u      " ��6    .�5v      ��  � �� �#AEADC16;   �� 5w       � y�$ Hidden=�6;   6L    5x      �� 5y   "    �� Binding 6.   �� *	IsRunning+ �� Value True6L   .a�5z   &   ��  � y�$ Visible=�6C   5{   #   5}      .+�5      �� $��STATUS��6   �� 5�      ��6   �� *RunningTimeString+�� 5�      $
 
Horizontal=�6!   .+�5�      �� $#��Average of Last 10 Readings: ��6     6H   �� $ lastReadTextBox���� 5�      -   5        $��lastReadTextBox��5�   $   $��5q�6V   ��6;   �� *
LastRead+6V   5�      �� 5�      $
 
Horizontal=�6!   .+�5�      �� $��Writing to File: ��6     6<   �� $ textBlockFile���� 5�      -   5        $��textBlockFile��5�   $   $��5q�69   �� 5�       �� Command 6(   �� *OpenCsvFolderCommand+.�6Q   .�5�   "   �� ��6,   �� *CsvFileName+5�      5�      5�      5�      �� 5�      $��0��6   $��0��6*   $	��350��6:    5�      ��%    5�      ��5�      �� 5�      " ��6    .�5�      ��  � �� �#AEADC16;   �� 5�       � y�$ Hidden=�6;   6L    5�      �� 5�   "    6.   �� *RunComplete+ True6N   .a�5�   &   ��  � y�$ Visible=�6C   5�   #   5�      .+�5�      �� $��	RUN STATS��6   �� 5�      ��6   �� *RunFinishedTimeString+�� 5�      $
 
Horizontal=�6!   .+�5�      �� $#��Average of Last 10 Readings: ��6     6H   �� $ lastReadTextBoxFinish���� 5�      -   5        $��lastReadTextBoxFinish��5�   $   $��5q�6\   ��6A   �� *
LastRead+6\   5�      �� 5�      $
 
Horizontal=�6!   .+�5�      �� $��Results in File: ��6     6<   �� $ textBlockFileComplete���� 5�      -   5        $��textBlockFileComplete��5�   $   $��5q�6A   �� 5�       6(   �� *OpenCsvFolderCommand+.�6Q   .�5�   "   �� ��6,   �� *CsvFileName+5�      5�      5�      5�      5�      5�      5�      5�      