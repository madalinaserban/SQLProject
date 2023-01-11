using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLProject.Model
{
    class StudentMenu
    {
            public StudentMenu()
            {

            }

            public int Id { get; set; }
            public string Nume { get; set; }
            public string Prenume { get; set; }
            public int GrupaId { get; set; }
            public bool Active { get; set; }
            public string CNP { get; set; }
            public string Email { get; set; }

        
    }
}
