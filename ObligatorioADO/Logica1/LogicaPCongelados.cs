using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaPCongelados
    {
        public static PCongelado Buscar(int Cod)
        {
            return PersistenciaPCongelados.Buscar(Cod);
        }

        public static int Agregar(PCongelado producto)
        {
            return PersistenciaPCongelados.Agregar(producto);
        }

        public static int Modificar(PCongelado producto)
        {
            return PersistenciaPCongelados.Modificar(producto);
        }

        public static int Eliminar(int cod)
        {
            return PersistenciaPCongelados.Eliminar(cod);
        }
        
        public static List<PCongelado> Listar()
        {
            return PersistenciaPCongelados.Listar();
        }
    }
}
