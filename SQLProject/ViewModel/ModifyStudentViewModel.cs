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
    class ModifyStudentViewModel:BaseViewModel
    {
        dbTamEntities1 schooldb = new dbTamEntities1();
        private string nume = SeeStudentsViewModel.choosedStudent.Nume;
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
        private string prenume= SeeStudentsViewModel.choosedStudent.Prenume;
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
        private int idGrupa = SeeStudentsViewModel.choosedStudent.GrupaId;
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

        private string email= SeeStudentsViewModel.choosedStudent.Email;
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

        private string cnp= SeeStudentsViewModel.choosedStudent.CNP;
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
        private ICommand updateStudentCommand;
        public ICommand UpdateStudentCommand
        {
            get
            {
                if (updateStudentCommand == null)
                {
                    updateStudentCommand = new RelayCommands(UpdateStudentMethod);
                }
                return updateStudentCommand;
            }
        }
        private void UpdateStudentMethod(object param)
        {
            schooldb.spStudentUpdate(SeeStudentsViewModel.choosedStudent.Id,idGrupa, prenume, nume, cnp, email,true);
            MessageBox.Show("Ai modificat un student!");
            SeeStudentsView Window = new SeeStudentsView();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = Window;
            Window.Show();


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

    }
}
