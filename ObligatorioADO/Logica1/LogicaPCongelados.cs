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
        public static int Buscar()
        {
            return PersistenciaPCongelados.Buscar();
        }

        public static int Agregar()
        {
            return PersistenciaPCongelados.Agregar();
        }

        public static int Modificar()
        {
            return PersistenciaPCongelados.Modificar();
        }

        public static int Eliminar()
        {
            return PersistenciaPCongelados.Eliminar();
        }
    }
}
