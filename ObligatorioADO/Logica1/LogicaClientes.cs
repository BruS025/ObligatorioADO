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
        public static Cliente Buscar(int ciClie)
        {
            return PersistenciaClientes.Buscar(ciClie);
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
