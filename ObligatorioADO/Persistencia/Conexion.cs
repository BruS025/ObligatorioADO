﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class Conexion
    {
        //Coneccion Petero
        //private static string cnnString = "Data Source=.;Initial Catalog = OBLIGATORIO; Integrated Security= true;";

        //Coneccion Para Los Propios :)
        private static string cnnString = "Data Source=.\\SQLEXPRESS;Initial Catalog = OBLIGATORIO; Integrated Security= true;";

        public static string CnnString
        {
            get
            {
                return cnnString;
            }
        }
    }
}
