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
    public partial class MantenimientoProductosCongelados : System.Web.UI.Page
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

                catch (Exception)
                {
                    lbResultado.Text = "Ha ocurrido un error";
                }

            }
        }

        // Volver
        protected void btVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        // Index Grilla
        protected void GridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProductos.PageIndex = e.NewPageIndex;
            CargarGrilla();
        }

        // Cargar Grilla
        private void CargarGrilla()
        {
            try
            {

                List<PCongelado> listadoProductos = LogicaPCongelados.Listar();

                GridProductos.DataSource = null;

                if (listadoProductos != null)
                {
                    if (listadoProductos.Count > 0)
                    {
                        GridProductos.Visible = true;
                        GridProductos.DataSource = listadoProductos;
                        GridProductos.DataBind();
                    }            

                    else
                    {
                        GridProductos.Visible = false;
                        lbResultado.Text = "No existen productos registrados";
                    }
                }
            }
            catch (Exception ex)
            {
                lbResultado.Text = ex.Message; //"Ha ocurrido un error";
            }
        }

        // Agregar nuevo cliente
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            /*
            try
            {
                if (nuevoCodigo.Value == "")
                {
                    throw new Exception("ERROR: Ingrese un codigo.");
                }

                // Agregar casteo

                Producto nuevoProducto = new Producto();

                nuevoProducto.CodigoB = Convert.ToInt32(nuevoCodigo.Value);
                nuevoProducto.Nombre = nuevoNombre.Value;
                nuevoProducto.FechaVto = Calendario.SelectedDate;

                if (nuevoPrecio.Value == "")
                {
                    throw new Exception("ERROR: Ingrese un precio.");
                }

                nuevoProducto.Precio = Convert.ToDouble(nuevoPrecio.Value);
                nuevoProducto.Peso = nuevoPeso.Value;

                int resultado = LogicaPCongelados.Agregar(nuevoProducto);

                if (resultado == 1)
                {
                    lbResultado.Text = "Cliente agregado..";
                    CargarGrilla();

                    // Reseteamos campos
                    nuevoCodigo.Value = "";
                    nuevoNombre.Value = "";
                    Calendario.SelectedDate = DateTime.Now;                
                    nuevoPrecio.Value = "";
                    nuevoPeso.Value = "";
                }

                else
                {
                    lbResultado.Text = "No se ha agregado producto...";

                }

            }

            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }*/
        }

        // Buscar
        protected void btnBuscar_Click(object sender, EventArgs e)
        {/*
            try
            {
                List<Cliente> listadoProductos = new List<Cliente>();

                if (txtBuscar.Value != "")
                {

                    Cliente cliente = LogicaClientes.Buscar(Convert.ToInt32(txtBuscar.Value));

                    if (cliente.Cedula == 0)
                    {
                        CargarGrilla();
                        throw new Exception("ERROR: No se encontraron coinciencias");
                    }

                    listadoProductos.Add(cliente);

                    GridProductos.DataSource = null;

                    if (listadoProductos != null)
                    {
                        if (listadoProductos.Count > 0)
                        {
                            GridProductos.Visible = true;
                            GridProductos.DataSource = listadoProductos;
                            GridProductos.DataBind();
                        }
                    }

                    else
                    {
                        GridProductos.Visible = false;
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
            }*/
        }

        // Realizamos modificaciones
        protected void btnModificar_Click(object sender, EventArgs e)
        {/*
            try
            {

                Cliente cliente = new Cliente();
                cliente.Cedula = Convert.ToInt32(Convert.ToInt32(nuevoCodigo.Value));
                cliente.Nombre = nuevoNombre.Value;
                cliente.Apellido = nuevoApellido.Value;
                cliente.Telefono = nuevoTelefono.Value;
                cliente.nuevoPrecio = nuevoPrecio.Value;

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
                    nuevoCodigo.Disabled = false;
                    nuevoDocumento.Value = "";
                    nuevoNombre.Value = "";
                    nuevoApellido.Value = "";
                    nuevoTelefono.Value = "";
                    nuevoPrecio.Value = "";
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
            }*/
        }

        // Cargar datos a modificar
        protected void GridProductos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            // Manejamos interfaz
            btnAgregar.Visible = false;
            btnGuardar.Visible = true;
            btnGuardarCancelar.Visible = true;

            // Cargamos datos de elemento seleccionado
            nuevoCodigo.Disabled = true;
            nuevoCodigo.Value = this.GridProductos.Rows[e.NewSelectedIndex].Cells[1].Text;
            nuevoNombre.Value = this.GridProductos.Rows[e.NewSelectedIndex].Cells[2].Text;
            Calendario.SelectedDate = Convert.ToDateTime(this.GridProductos.Rows[e.NewSelectedIndex].Cells[3].Text);
            nuevoPrecio.Value = this.GridProductos.Rows[e.NewSelectedIndex].Cells[4].Text;
            nuevoPeso.Value = this.GridProductos.Rows[e.NewSelectedIndex].Cells[5].Text;
            
        }

        // Eliminar
        protected void GridProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                lbResultado.Text = "Eliminar";
                lbResultado.Text = GridProductos.Rows[e.RowIndex].Cells[1].Text;

                int resultado = 0;

                resultado = LogicaPCongelados.Eliminar(Convert.ToInt32(GridProductos.Rows[e.RowIndex].Cells[1].Text));

                if (resultado == 1) // ok
                {
                    lbResultado.Text = "Se ha eliminado producto.";
                    CargarGrilla();
                }

                else if (resultado == -1)
                {
                    lbResultado.Text = "No es posible eliminar un producto con ventas asociadas.";
                }

                else
                {
                    GridProductos.Visible = false;
                    lbResultado.Text = "No existen productos registrados.";
                }

            }

            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }
        }

        // Cancelamos modo edicion
        protected void btnModificarCancelar_Click(object sender, EventArgs e)
        {/*
            try
            {
                btnAgregar.Visible = true;
                btnGuardar.Visible = false;
                btnGuardarCancelar.Visible = false;

                // Reseteamos campos
                nuevoCodigo.Disabled = false;
                nuevoCodigo.Value = "";
                nuevoNombre.Value = "";
                nuevoApellido.Value = "";
                nuevoTelefono.Value = "";
                nuevoPrecio.Value = "";
                nuevoPuerta.Value = "";

            }

            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }*/
        }
    }
}