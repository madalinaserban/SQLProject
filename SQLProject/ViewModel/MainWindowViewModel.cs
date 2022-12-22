using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using SQLProject.Commands;
using SQLProject.View;

namespace SQLProject.ViewModel
{
    class MainWindowViewModel : BaseViewModel
    {
            private ICommand addCommand;
            public ICommand AddCommand
            {
                get
                {
                        addCommand = new RelayCommands(AddMethod);
                    
                    return addCommand;
                }
            }
            private void AddMethod(object param)
            {
                AddView addView = new AddView();
                App.Current.MainWindow.Close();
                App.Current.MainWindow = addView;
                addView.Show();
            }

            //private ICommand signUpCommand;
            //public ICommand SignUpCommand
            //{
            //    get
            //    {
            //        if (signUpCommand == null)
            //        {
            //            signUpCommand = new RelayCommands(SignUpMethod);
            //        }
            //        return signUpCommand;
            //    }
            //}
            //private void SignUpMethod(object param)
            //{
            //    DeleteView deleteView = new DeleteView();
            //    App.Current.MainWindow.Close();
            //    App.Current.MainWindow = signUpView;
            //    signUpView.Show();
            //}

            //private ICommand withoutAccountCommand;
            //public ICommand WithoutAccountCommand
            //{
            //    get
            //    {
            //        if (withoutAccountCommand == null)
            //        {
            //            withoutAccountCommand = new RelayCommands(WithoutAccountMethod);
            //        }
            //        return withoutAccountCommand;
            //    }
            //}
            //private void WithoutAccountMethod(object param)
            //{
            //    NotLoggedView customerView = new NotLoggedView();
            //    App.Current.MainWindow.Close();
            //    App.Current.MainWindow = customerView;
            //    customerView.Show();
            //}
        }
    }