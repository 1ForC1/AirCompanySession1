   M S B A M L   `   `   `  ����F  BSession1_01, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:Session1_01Session1_01  5   	       Session1_01.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Session1_01     5   	     � Title$  Login��5   	    � 
ResizeMode$ NoResize=�6    � WindowStartupLocation$ CenterScreen=�6-   $	��450��6R   $	��800��6_   .��5	      �  � ColumnDefinitions 5
   
   �� 5       � RowDefinitions 5   
   �� 5      $
��254* �6   �� 5      $	��59* �6   �� 5      $	��61* �6   �� 5      $	��60* �6   .+�5   
   �� $	��200��6   $	��600��6   $��0��6)   $��/DS2017_TP09_color@2x.png��66   �� 5   
   $��Center=�6   $��Center=�62   $��1��6M    �� Orientation$ 
Horizontal=�6Z   $��40��6s   $	��462��6   .+�5      �� $��40��6    �� TextAlignment$ Center=�6$   $��Username:  ��6;   �� 5      -   5         ��Name$ 
UserNameTB��5      $��40��6*   $	��400��66   
���   �$��2q�6V   5      �� 5   
   $��Center=�6   $��Center=�62   $��2��6M   $ 
Horizontal=�6Z   $��40��6s   $	��458��6   .+�5      �� $��40��6   $ Center=�6$   $��Password:  ��6;   G� 5      -   5         G�Name$ 
PasswordPB��5      $��40��6.   $	��400��6:   
���   �$��2q�6Z   5      �� 5   
   $��3��6   $��Center=�6"   $��Center=�6?   $ 
Horizontal=�6Z   .+�5      �� -   5        	 ��Name$	 LoginBtn��5      $��Login��6'   $��30��67   $	��200��6C   $��	60 0 15 0q�6O   
���   �$��2q�6v   
�������6�   �� 5       -   5        $	 ExitBtn��5       $
��Exit��6&   $��30��65   $	��200��6A   $��2q�6M   
���   �
�������6�   5!      5"      5#      