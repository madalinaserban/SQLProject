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
        private ICommand seeCommand;
        public ICommand SeeCommand
        {
            get
            {
                seeCommand = new RelayCommands(SeeMethod);

                return seeCommand;
            }
        }
        private void SeeMethod(object param)
        {
            SeeStudentsView seeView = new SeeStudentsView();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = seeView;
            seeView.Show();

        }

    }
}