using SQLProject.Commands;
using SQLProject.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SQLProject.ViewModel
{
    class AddStudentViewModel:BaseViewModel
    {
        private ICommand backCommand;
        public ICommand BackCommand
        {
            get
            {
                if (backCommand == null)
                {
                    backCommand = new RelayCommands(BackMethod);
                }
                return backCommand;
            }
        }
        private void BackMethod(object param)
        {
            SeeStudentsView Window = new SeeStudentsView();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = Window;
            Window.Show();
        }
    }
}
