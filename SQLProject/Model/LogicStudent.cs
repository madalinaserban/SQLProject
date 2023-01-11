using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLProject.Model
{
    class LogicStudent
        {
            private dbTamEntities1 schooldb = new dbTamEntities1();
            public List<StudentMenu> GetStudentsMenu()
            {
                var productQuery = (from student in schooldb.Students
                                    where student.Active == true
                                    select new StudentMenu 
                                    {
                                        Nume = (string)student.LastName,
                                        Prenume = (string)student.FirstName,
                                        GrupaId= (int) student.GroupeId,
                                        Email=(string)student.Email
                                    }).ToList();

                return productQuery;
            }

        public void DeleteStudent(int id)
        {
            using (SqlConnection con = ((SqlConnection)schooldb.Database.Connection))
            {
                SqlCommand cmd = new SqlCommand("DELETEROOM", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter idFeature = new SqlParameter("@id", id);
                cmd.Parameters.Add(idFeature);
                con.Open();
                cmd.ExecuteNonQuery();
                schooldb.SaveChanges();
            }

        }

        }
    }
