using SQLProject.Commands;
using SQLProject.Model;
using SQLProject.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace SQLProject.ViewModel
{
    class AddStudentViewModel : BaseViewModel
    {

        dbTamEntities1 schooldb = new dbTamEntities1();
        public static Student currentStudent = new Student();

        private string nume;
        public string NumeProperty
        {
            get
            {
                return nume;
            }
            set
            {
                nume = value;
                OnPropertyChanged("NumeProperty");
            }
        }
        private string prenume;
        public string PrenumeProperty
        {
            get
            {
                return prenume;
            }
            set
            {
                prenume = value;
                OnPropertyChanged("PrenumeProperty");
            }
        }
        private int idGrupa;
        public int IdGrupaProperty
        {
            get
            {
                return idGrupa;
            }
            set
            {
                idGrupa = value;
                OnPropertyChanged("IdGrupaProperty");
            }
        }
        private string email;
        public string EmailProperty
        {
            get
            {
                return email;
            }
            set
            {
                email = (string)value;
                OnPropertyChanged("EmailProperty");
            }
        }

        private string cnp;
        public string CnpProperty
        {
            get
            {
                return cnp;
            }
            set
            {
                cnp = (string)value;
                OnPropertyChanged("CnpProperty");
            }
        }
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

        private ICommand addStudentCommand;
        public ICommand AddStudentCommand
        {
            get
            {
                if (addStudentCommand == null)
                {
                    addStudentCommand = new RelayCommands(AdaugaStudentMethod);
                }
                return addStudentCommand;
            }
        }
        private void AdaugaStudentMethod(object param)
        {
            schooldb.InsertStudent(idGrupa, prenume, nume, cnp, email, true);
            MessageBox.Show("Ai adaugat un student!");
            SeeStudentsView Window = new SeeStudentsView();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = Window;
            Window.Show();


        }
    }
}
