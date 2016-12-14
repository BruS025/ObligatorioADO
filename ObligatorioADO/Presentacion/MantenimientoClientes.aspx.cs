using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using EntidadesCompartidas;
using System.Collections.Generic;
using System.Data.SqlClient;

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

                btnAgregar.Visible = false;
                btnModificar.Visible = true;
       
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
            try
            {

                Cliente cliente = LogicaClientes.Buscar(Convert.ToInt32(nuevoDocumento.Value));
                
                cliente.Nombre = nuevoNombre.Value;
                cliente.Apellido = nuevoApellido.Value;
                cliente.Telefono = nuevoTelefono.Value;
                cliente.Direccion = nuevoDireccion.Value;
                cliente.NroPuerta = Convert.ToInt32(nuevoPuerta.Value);
            }
            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            btnAgregar.Visible = true;
            btnModificar.Visible = false;

            try
            {
               
            Cliente cliente = new Cliente();
            cliente.Cedula = Convert.ToInt32(Convert.ToInt32(nuevoDocumento.Value));
            cliente.Nombre = nuevoNombre.Value;
            cliente.Apellido = nuevoApellido.Value;
            cliente.Telefono = nuevoTelefono.Value;
            cliente.Direccion = nuevoDireccion.Value;
            cliente.NroPuerta = Convert.ToInt32(nuevoPuerta.Value);



            int resultado = LogicaClientes.Modificar(cliente);

            if (resultado == 1)
            {
                lbResultado.Text = "Cliente Modificado";
            }
            else
            {
                lbResultado.Text = "No se pudo modificar";
            }
        }
        
            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }
        }
    }
}
