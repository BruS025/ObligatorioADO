using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;

namespace Logica
{
    public class LogicaVentas
    {
        public static List<Venta> Buscar(String busqueda)
        {
            return PersistenciaVentas.Buscar(String busqueda);
        }

        public static int Agregar(Venta venta)
        {
            return PersistenciaVentas.Agregar(venta);
        }

        public static int Modificar(Venta venta)
        {
            return PersistenciaVentas.Modificar(venta);
        }

        public static int Eliminar(int id)
        {
            return PersistenciaVentas.Eliminar(id);
        }
        
        public static List<Venta> Listar()
        {
            return PersistenciaVentas.Listar();
        }
    }
}
