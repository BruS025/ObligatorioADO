using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class Conexion
    {
        private static string cnnString = "Data Source=.\\SQLEXPRESS;Initial Catalog = ArticulosDB; Integrated Security= true;";

        public static string CnnString
        {
            get
            {
                return cnnString;
            }
        }
    }
}
