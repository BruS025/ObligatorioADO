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
                try
                {
                    CargarGrilla();
                }

                catch (Exception ex)
                {
                    lbResultado.Text = ex.Message;
                }               

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
        
        // Agregar nuevo cliente
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
                CargarGrilla();

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

        // Realizamos modificaciones
        protected void btnModificar_Click(object sender, EventArgs e)
        {
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
                CargarGrilla();

                btnAgregar.Visible = true;
                btnGuardar.Visible = false;
                btnGuardarCancelar.Visible = false;

                // Reseteamos campos
                    nuevoDocumento.Disabled = false;
                    nuevoDocumento.Value = "";
                    nuevoNombre.Value = "";
                    nuevoApellido.Value = "";
                    nuevoTelefono.Value = "";
                    nuevoDireccion.Value = "";
                    nuevoPuerta.Value = "";

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

        // Cargar datos a modificar
        protected void GridClientes_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            // Manejamos interfaz
            btnAgregar.Visible = false;
            btnGuardar.Visible = true;
            btnGuardarCancelar.Visible = true;

            // Cargamos datos de elemento seleccionado
            nuevoDocumento.Disabled = true;
            nuevoDocumento.Value = this.GridClientes.Rows[e.NewSelectedIndex].Cells[1].Text;
            nuevoNombre.Value = this.GridClientes.Rows[e.NewSelectedIndex].Cells[2].Text;
            nuevoApellido.Value = this.GridClientes.Rows[e.NewSelectedIndex].Cells[3].Text;
            nuevoTelefono.Value = this.GridClientes.Rows[e.NewSelectedIndex].Cells[4].Text;
            nuevoDireccion.Value = this.GridClientes.Rows[e.NewSelectedIndex].Cells[5].Text;
            nuevoPuerta.Value = this.GridClientes.Rows[e.NewSelectedIndex].Cells[6].Text;
           
        }

        protected void GridClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lbResultado.Text = "Eliminar";
            lbResultado.Text = GridClientes.Rows[e.RowIndex].Cells[1].Text;

        }

        // Cancelamos modo edicion
        protected void btnModificarCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                btnAgregar.Visible = true;
                btnGuardar.Visible = false;
                btnGuardarCancelar.Visible = false;

                // Reseteamos campos
                nuevoDocumento.Disabled = false;
                nuevoDocumento.Value = "";
                nuevoNombre.Value = "";
                nuevoApellido.Value = "";
                nuevoTelefono.Value = "";
                nuevoDireccion.Value = "";
                nuevoPuerta.Value = "";

            }

            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }
        }
    }
}
