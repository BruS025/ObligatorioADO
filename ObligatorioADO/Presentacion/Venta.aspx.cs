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
    public partial class Venta : System.Web.UI.Page
    {
        // Page load
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

        // Index Grilla
        protected void GridClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridClientes.PageIndex = e.NewPageIndex;
            CargarGrilla();
        }

        // Cargar Grilla
        private void CargarGrilla()
        {
            try
            {

                List<Cliente> listadoClientes = LogicaClientes.Listar();

                GridClientes.DataSource = null;

                if (listadoClientes != null)
                {
                    if (listadoClientes.Count > 0)
                    {
                        GridClientes.Visible = true;
                        GridClientes.DataSource = listadoClientes;
                        GridClientes.DataBind();
                    }

                }

                else
                {
                    GridClientes.Visible = false;
                    lbResultado.Text = "No existen clientes registrados";
                }
            }
            catch (Exception)
            {
                lbResultado.Text = "Ha ocurrido un error";
            }
        }

        // Agregar nuevo cliente
        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            try
            {
                if (nuevoDocumento.Value == "")
                {
                    throw new Exception("ERROR: Ingrese un documento.");
                }



                Cliente nuevoCliente = new Cliente();

                nuevoCliente.Cedula = Convert.ToInt32(nuevoDocumento.Value);
                nuevoCliente.Nombre = nuevoNombre.Value;
                nuevoCliente.Apellido = nuevoApellido.Value;
                nuevoCliente.Telefono = nuevoTelefono.Value;
                nuevoCliente.Direccion = nuevoDireccion.Value;

                if (nuevoPuerta.Value == "")
                {
                    throw new Exception("ERROR: Ingrese un numero de puerta.");
                }

                nuevoCliente.NroPuerta = Convert.ToInt32(nuevoPuerta.Value);

                int resultado = LogicaClientes.Agregar(nuevoCliente);

                if (resultado == 1)
                {
                    lbResultado.Text = "Cliente agregado..";
                    CargarGrilla();

                    // Reseteamos campos
                    nuevoDocumento.Value = "";
                    nuevoNombre.Value = "";
                    nuevoApellido.Value = "";
                    nuevoTelefono.Value = "";
                    nuevoDireccion.Value = "";
                    nuevoPuerta.Value = "";

                }

                else if (resultado == -1)
                {
                    lbResultado.Text = "El documento ingresado ya se encuentra registrado.";
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

        // Buscar
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                List<Cliente> listadoClientes = new List<Cliente>();

                if (txtBuscar.Value != "")
                {

                    Cliente cliente = LogicaClientes.Buscar(Convert.ToInt32(txtBuscar.Value));

                    if (cliente.Cedula == 0)
                    {
                        CargarGrilla();
                        throw new Exception("ERROR: No se encontraron coinciencias");
                    }

                    listadoClientes.Add(cliente);

                    GridClientes.DataSource = null;

                    if (listadoClientes != null)
                    {
                        if (listadoClientes.Count > 0)
                        {
                            GridClientes.Visible = true;
                            GridClientes.DataSource = listadoClientes;
                            GridClientes.DataBind();
                        }
                    }

                    else
                    {
                        GridClientes.Visible = false;
                        lbResultado.Text = "No existen clientes registrados.";
                    }
                }
                else
                {
                    CargarGrilla();
                }

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

                if (nuevoPuerta.Value == "")
                {
                    throw new Exception("ERROR: Ingrese un numero de puerta.");
                }

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

        // Eliminar
        protected void GridClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                lbResultado.Text = "Eliminar";
                lbResultado.Text = GridClientes.Rows[e.RowIndex].Cells[1].Text;

                int resultado = 0;

                resultado = LogicaClientes.Eliminar(Convert.ToInt32(GridClientes.Rows[e.RowIndex].Cells[1].Text));

                if (resultado == 1) // ok
                {
                    lbResultado.Text = "Se ha eliminado cliente.";
                    CargarGrilla();
                }

                else if (resultado == -1)
                {
                    lbResultado.Text = "No es posible eliminar un cliente con ventas asociadas.";
                }

                else
                {
                    GridClientes.Visible = false;
                    lbResultado.Text = "No existen clientes registrados.";
                }

            }

            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }
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
