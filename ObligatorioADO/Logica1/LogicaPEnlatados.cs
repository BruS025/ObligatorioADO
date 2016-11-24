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
        public static int Buscar()
        {
            return PersistenciaPEnlatados.Buscar();
        }

        public static int Agregar()
        {
            return PersistenciaPEnlatados.Agregar();
        }

        public static int Modificar()
        {
            return PersistenciaPEnlatados.Modificar();
        }

        public static int Eliminar()
        {
            return PersistenciaPEnlatados.Eliminar();
        }
    }
}
