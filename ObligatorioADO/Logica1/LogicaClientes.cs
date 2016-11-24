using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaClientes
    {
        public static int Buscar()
        {
            return PersistenciaClientes.Buscar();
        }

        public static int Agregar()
        {
            return PersistenciaClientes.Agregar();
        }

        public static int Modificar()
        {
            return PersistenciaClientes.Modificar();
        }

        public static int Eliminar()
        {
            return PersistenciaClientes.Eliminar();
        }
    }
}
