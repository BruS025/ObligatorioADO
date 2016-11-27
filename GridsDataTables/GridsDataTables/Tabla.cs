using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GridsDataTables
{
    public class Tabla
    {
        // Atributos
        private int _Id;
        private string _Description;
        private bool _IsComplete;

        // Constructor por defecto
        public Tabla() { }

        // Constructor con parametros
        public Tabla(int Id, string Description, bool IsComplete)
        {
            _Id = Id;
            _Description = Description;
            _IsComplete = IsComplete;

        }

        // Propiedades ID
        public int Id
        {
            get { return _Id; }
            set
            {
                if (value > 0)
                {
                    _Id = value;
                }
            }
        }

        // Propiedades DESCRIPTION
        public string Description
        {
            get { return _Description; }
            set{_Description = value;}
        }

        // Propiedades DESCRIPTION
        public bool IsComplete
        {
            get { return _IsComplete; }
            set { _IsComplete = value; }
        }

    }
}