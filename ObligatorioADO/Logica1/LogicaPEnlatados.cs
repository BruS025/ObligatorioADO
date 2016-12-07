using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaPEnlatados
    {
        public static PEnlatado Buscar(long cod)
        {
            return PersistenciaPEnlatados.Buscar(cod);
        }

        public static int Agregar(PEnlatado producto)
        {
            return PersistenciaPEnlatados.Agregar(producto);
        }

        public static int Modificar(PEnlatado producto)
        {
            return PersistenciaPEnlatados.Modificar(producto);
        }

        public static int Eliminar(long cod)
        {
            return PersistenciaPEnlatados.Eliminar(cod);
        }
        
        public static List<PEnlatado> Listar()
        {
            return PersistenciaPEnlatados.Listar();
        }
    }
}
