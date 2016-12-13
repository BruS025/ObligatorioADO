using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using EntidadesCompartidas;
using System.Collections.Generic;

namespace Presentacion
{
    public partial class MantenimientoClientes : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                CargarGrilla();

                /*
                foreach (Cliente item in listadoClientes)
                {
                    LBMaterias.Items.Add(item.Id + " - " + item.Nombre);
                }

                // Create a new table.
                DataTable taskTable = new DataTable("TaskList");

                // Create the columns.
                taskTable.Columns.Add("Cedula", typeof(int));
                taskTable.Columns.Add("Nombre", typeof(string));
                taskTable.Columns.Add("Apellido", typeof(string));
                taskTable.Columns.Add("Telefono", typeof(int));
                taskTable.Columns.Add("Direccion", typeof(string));
                taskTable.Columns.Add("NroPuerta", typeof(int));

                //Add data to the new table.
                for (int i = 0; i < 20; i++)
                {
                    DataRow tableRow = taskTable.NewRow();
                    tableRow["Cedula"] = i;
                    tableRow["Nombre"] = "12345678" + i.ToString();
                    tableRow["Apellido"] = "12345678" + i.ToString();
                    tableRow["Telefono"] = i;
                    tableRow["Direccion"] = "12345678" + i.ToString();
                    tableRow["NroPuerta"] = i;

                    taskTable.Rows.Add(tableRow);
                }

                //Persist the table in the Session object.
                Session["TaskTable"] = taskTable;

                //Bind data to the GridView control.
                BindData();*/
            }
        }

        // Volver
        protected void btVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        // Buscar
        protected void btBuscar_Click(object sender, EventArgs e)
        {
            lbResultado.Text = "Buscar";

        }

        // Index Grilla
        protected void GridClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridClientes.PageIndex = e.NewPageIndex;
            CargarGrilla();
        }

        // Cancel Grilla
        protected void GridClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridClientes.EditIndex = -1;
            CargarGrilla();
        }

        // Editig Grilla
        protected void GridClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridClientes.EditIndex = e.NewEditIndex;
            CargarGrilla();
        }

        protected void GridClientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable dt = (DataTable)Session["TaskTable"];

            //Update the values.
            GridViewRow row = GridClientes.Rows[e.RowIndex];
            //dt.Rows[row.DataItemIndex]["Id"] = ((TextBox)(row.Cells[1].Controls[0])).Text;
            dt.Rows[row.DataItemIndex]["Description"] = ((TextBox)(row.Cells[2].Controls[0])).Text;
            dt.Rows[row.DataItemIndex]["IsComplete"] = ((CheckBox)(row.Cells[3].Controls[0])).Checked;

            GridClientes.EditIndex = -1;

            CargarGrilla();
        }

        private void BindData()
        {
            GridClientes.DataSource = Session["TaskTable"];
            GridClientes.DataBind();
        }

        // Cargar Grilla
        private void CargarGrilla()
        {
            List<Cliente> listadoClientes = LogicaClientes.Listar();

            GridClientes.DataSource = null;

            if (listadoClientes != null)
            {
                GridClientes.Visible = true;
                GridClientes.DataSource = listadoClientes;
                GridClientes.DataBind();
            }

            else
            {
                GridClientes.Visible = false;
                lbResultado.Text = "No existen clientes registrados";
            }
        }
        

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            try
            {
       
            Cliente nuevoCliente = new Cliente();

            nuevoCliente.Cedula = Convert.ToInt32(nuevoDocumento.Value);
            nuevoCliente.Nombre = nuevoNombre.Value;
            nuevoCliente.Apellido = nuevoApellido.Value;
            nuevoCliente.Telefono = nuevoTelefono.Value;
            nuevoCliente.Direccion = nuevoDireccion.Value;
            nuevoCliente.NroPuerta = Convert.ToInt32(nuevoPuerta.Value);

            int resultado = LogicaClientes.Agregar(nuevoCliente);

            if (resultado == 1)
            {
                lbResultado.Text = "Cliente agregado..";

            }

            else
            {
                lbResultado.Text = "No se ha agregado Cliente..";
            }

            }

            catch (Exception ex)
        {
                lbResultado.Text = ex.Message;
        }
}


        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void GridClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //LogicaClientes.Eliminar(GridClientes.Rows[]); Indicar la cedula de la row seleccionada
            lbResultado.Text = "Eliminado";
        }

        protected void GridClientes_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            CargarGrilla();
            lbResultado.Text = "Eliminado2";
        }
    }
}
