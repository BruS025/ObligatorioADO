using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{

    public class Cliente
    {
        // Atributos
        public int _Cedula;
        public string _Nombre;
        public string _Apellido;
        public string _Telefono;
        public string _Direccion;
        public int _NroPuerta;

        // Constructor Simple

        public Cliente() { }
        // Constructor Completo
        public Cliente(int pCI, string pNom, string pApe, string pTel, string pDir, int pNroP)
        {
            _Cedula = pCI;
            _Nombre = pNom;
            _Apellido = pApe;
            _Telefono = pTel;
            _Direccion = pDir;
            _NroPuerta = pNroP;
        }

        // Métodos
        public int Cedula
        {
            get { return _Cedula; }
            set
            {
                if ((value <= 100000000) || (value > 99999999))
                    throw new Exception("ERROR: La cédula debe ser un número de 8 dígitos...");
                else
                    _Cedula = value;
            }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set
            {
                if (value.Trim().Length < 5)
                    throw new Exception("ERROR: El nombre debe tener al menos 5 caracteres...");
                else
                    _Nombre = value.Trim();
            }
        }

        public string Apellido
        {
            get { return _Apellido; }
            set
            {
                {
                    if (value.Trim().Length < 5)
                        throw new Exception("ERROR: El apellido debe tener al menos 5 caracteres...");
                    else
                        _Apellido = value.Trim();
                }
            }
        }

        public string Telefono
        {
            get { return _Telefono; }
            set
            {
                try
                {
                    //verifica solo numeros
                    Convert.ToInt64(value.Trim());

                    if ((value.Trim().Length == 8) || (value.Trim().Length == 9))
                        _Telefono = value.Trim();
                    else
                        throw new Exception("ERROR: El Telefono de la Empresa debe tener 8 o 9 Dígitos...");
                }
                catch
                {
                    throw new Exception("ERROR: El Teléfono debe contener solamente 8 o 9 caracteres numéricos");
                }
            }
        }

        public string Direccion
        {
            get { return _Direccion; }
            set
            {
                if (value.Trim().Length < 5)
                    throw new Exception("ERROR: La direccion debe tener al menos 5 caracteres...");
                else
                    _Direccion = value.Trim();
            }
        }

        public int NroPuerta
        {
            get { return _NroPuerta; }
            set
            {
                if ((value < 1) || (value > 99999))
                    throw new Exception("Error: El numero de puerta debe tener entre 1 o 5 dígitos...");
                else
                    _NroPuerta = value;
            }

        }

        // ToString()
        public override string ToString()
        {
            return ("Cédula: " + _Cedula.ToString() + "; Nombre: " + _Nombre + "; Apellido: " + _Apellido + "; Tel: " + _Telefono+ "; Dir: " + _Direccion + "; NroPuerta: " + _NroPuerta.ToString());
        }
    }

}
 
