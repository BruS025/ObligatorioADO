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
        public static List<Cliente> Buscar(String busqueda)
        {
            return PersistenciaClientes.Buscar(String busqueda);
        }

        public static int Agregar(Cliente cliente)
        {
            return PersistenciaClientes.Agregar(cliente);
        }

        public static int Modificar(Cliente cliente)
        {
            return PersistenciaClientes.Modificar(cliente);
        }

        public static int Eliminar(int cedula)
        {
            return PersistenciaClientes.Eliminar(cedula);
        }
        
        public static List<Cliente> Listar()
        {
            return PersistenciaClientes.Listar();
        }
    }
}
