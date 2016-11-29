using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;


namespace Presentacion
{
    public partial class MantenimientoClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente clienteAgregar = new Cliente(1231234,"Nombre", "Apellido", "12341234","Direccion",1234);
        }
    }
}