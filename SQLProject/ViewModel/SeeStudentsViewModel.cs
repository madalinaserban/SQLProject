﻿using SQLProject.Commands;
using SQLProject.Model;
using SQLProject.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
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
                    choosedStudent = selectedStudent;
                }
                OnPropertyChanged("SelectedProduct");
            }
        }

        public SeeStudentsViewModel()
        {
            StudentsCollection = new ObservableCollection<StudentMenu>(logicStudent.GetStudentsMenu());
        }

        private ICommand stergeStudentCommand;
        public ICommand StergeStudentCommand
        {
            get
            {
                if (stergeStudentCommand == null)
                {
                    stergeStudentCommand = new RelayCommands(StergeStudentMethod);
                }
                return stergeStudentCommand;
            }
        }
        private void StergeStudentMethod(object param)
        {
            int a = 0;
            var id = schooldb.GETID_STUDENT(choosedStudent.CNP);
            foreach (var cam in id)
            {
                a = (int)cam;
            }
            LogicStudent student1 = new LogicStudent();
            schooldb.DELETESTUDENT(a);
            MessageBox.Show("Ai sters un student!");
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
    }
}