   M S B A M L   `   `   `  ????E  ASQLProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:SQLProject.ViewModelSQLProject.ViewModel  5   	       SQLProject.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2ctx"clr-namespace:SQLProject.ViewModel     5   	   -   5          ?Name$  frMain??5   	    ? Title$ Student App??5   	   $	??550??6   $	??800??6*    ? 
ResizeMode$ NoResize=?66    ? WindowStartupLocation$ CenterScreen=?6L    ? DataContext 5	      .  (SQLProject.ViewModel.MainWindowViewModel  5
   
    ? 	Resources 5         RoundedBorder ?? 
TargetType ?? Property ?? Value  RoundedButtonStyle	 ?? 
TargetType
 ?? CornerRadius ??Name ?? Triggers P? Property P? Value??%?  &	        &	 T     7   ?? 5   
   " ??6&   .?5      ??  ?@??CornerRadius$ 5??6-   5      ?? 5   
   " ??6+   .?5      ??  ? ??
 ?????6+   ?? 5       ? ??
 ?   ?6+   ?? 5       ? ?? 5      ?? 5      "	 ??6&   .R?5      ?? $
 10,10,10,10??6!   #??z??6<   8??  ._?5      ?? $ contentPresenter??6/   #??z??6I   #??z??6}   #??z??6?   #??z??6?   #??z??6	  5      5      5       5      P? 5       ?@J?IsMouseOver . . ?5      ??  ? ??
 ??ح?63   ?? 5       ? ??
 ?   ?63   5       P? 5!       ? {? .  . ?5"      ??  ? ??
 ??ح?63   ?? 5#       ? ??
 ?   ?63   5$      5&      5'      ??5(      ?? 5)   
    ?? ImageSource$% /Resource/Images/background.jpg??6   .??5+      ?  ? RowDefinitions 5,   
   ?? 5-      $
??139* ?6   ?? 5.      $
??168* ?6   ?? 5/      $
??512* ?6    ? ColumnDefinitions 51   
   ?? 52      $	??11* ?6   ?? 53      $	??24* ?6   ?? 54      $	??20* ?6   ?? 55      $	??15* ?6   ?? 56      $	??45* ?6   ?? 57      $
??380* ?6   .+?59   
   ?? $??0??6   $??Aplicatie
 Studenti??6   $??Center=?6A   $??Center=?5:      $	??Top=?6/   $??60(?6G   $	??210??6U   $??3??6b   $??Sitka Display)?6s   $??10,10,1.667,0q?6?   $??6??6?   $
??Bold"?6?   ?? 5;   
   $??2??6    ?? Orientation$ Vertical=?6"   $??6??69   $??0,0.333,0.667,0q?6M   .+?5<      ?? $??	Profesori??6   $??35??6)   $??322,60,314,0q?65   $??20(?5=      #??[ 6#   $??Segoe UI Emoji)?6n   ??6O   ?? *
AddCommand+6n   ?? 5>      $??Studenti??6   $??35??6(   $??322,30,314,0q?64   $??20(?5?      #??[ 6#   $??Segoe UI Emoji)?6n   ??6O   ?? *
SeeCommand+6n   5@      5A      5B      