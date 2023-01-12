using SQLProject.Commands;
using SQLProject.Model;
using SQLProject.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace SQLProject.ViewModel
{
    class SeeStudentsViewModel : BaseViewModel
    {
        private ObservableCollection<StudentMenu> students;
        private LogicStudent logicStudent = new LogicStudent();
        dbTamEntities1 schooldb = new dbTamEntities1();

        public ObservableCollection<StudentMenu> StudentsCollection
        {
            get
            {
                return students;
            }
            set
            {
                students = value;
                OnPropertyChanged("StudentsCollection");
            }
        }

        public static StudentMenu choosedStudent;
        private StudentMenu selectedStudent;
        public StudentMenu SelectedStudent
        {
            get
            {
                return selectedStudent;
            }
            set
            {
                selectedStudent = value;
                if (selectedStudent != null)
                {
                    CanExecuteDeleteCommand = true;
                    CanExecuteModifyCommand = true;
                    choosedStudent = selectedStudent;
                }
                OnPropertyChanged("SelectedStudent");
            }
        }

        public bool CanExecuteDeleteCommand { get; set; }
        public bool CanExecuteModifyCommand { get; set; }

        public SeeStudentsViewModel()
        {
            StudentsCollection = new ObservableCollection<StudentMenu>(logicStudent.GetStudentsMenu());
        }

        private ICommand modificaStudentCommand;
        public ICommand ModificaStudentCommand
        {
            get
            {
                if (modificaStudentCommand == null)
                {
                    modificaStudentCommand = new RelayCommands(ModificaStudentMethod, param => CanExecuteModifyCommand);
                }
                return modificaStudentCommand;
            }
        }
        private void ModificaStudentMethod(object param)
        {
            ModifyStudentView startWindow = new ModifyStudentView();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = startWindow;
            startWindow.Show();
        }
        private ICommand stergeStudentCommand;
        public ICommand StergeStudentCommand
        {
            get
            {
                if (stergeStudentCommand == null)
                {
                    stergeStudentCommand = new RelayCommands(StergeStudentMethod, param => CanExecuteDeleteCommand);
                }
                return stergeStudentCommand;
            }
        }
        private void StergeStudentMethod(object param)
        {
            schooldb.DELETESTUDENT(selectedStudent.Id);
            MessageBox.Show("Ai sters studentul :" + SelectedStudent.Nume + " " + SelectedStudent.Prenume);
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
            MainWindow startWindow = new MainWindow();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = startWindow;
            startWindow.Show();
        }

        private ICommand addStudentsCommand;
        public ICommand AddStudentsCommand
        {
            get
            {
                addStudentsCommand = new RelayCommands(AddStudentsMethod);

                return addStudentsCommand;
            }
        }
        private void AddStudentsMethod(object param)
        {
            AddView addView = new AddView();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = addView;
            addView.Show();
        }
        private ICommand orderbyCommand;
        private ICommand OrderByCommand
        {
            get
            {
                if (backCommand == null)
                {
                    backCommand = new RelayCommands(OrderByMethod);
                }
                return backCommand;
            }
        }
        private void OrderByMethod(object param)
        {
        }
    }
}