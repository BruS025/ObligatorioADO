using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        // Page load
        protected void Page_Load(object sender, EventArgs e)
        {
                
        }

        // Redirects
        protected void btMenuMantenimientoClientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoClientes.aspx");
        }

        protected void btMenuMantenimientoProductosEnlatados_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoProductosEnlatados.aspx");
        }

        protected void btMenuMantenimientoProductosCongelados_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoProductosCongelados.aspx");
        }
    }
}