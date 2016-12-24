﻿using System;
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

            try
            {
                if (nuevoCodigo.Value == "")
                {
                    throw new Exception("ERROR: Ingrese un codigo.");
                }

                // Agregar casteo

                PCongelado nuevoProducto = new PCongelado();

                nuevoProducto.CodigoB = Convert.ToInt32(nuevoCodigo.Value);
                nuevoProducto.Nombre = nuevoNombre.Value;
                nuevoProducto.FechaVto = Calendario.SelectedDate;

                if (nuevoPrecio.Value == "")
                {
                    throw new Exception("ERROR: Ingrese un precio.");
                }

                nuevoProducto.Precio = Convert.ToDouble(nuevoPrecio.Value);
                nuevoProducto.Peso = Convert.ToDouble(nuevoPeso.Value);

                int resultado = LogicaPCongelados.Agregar(nuevoProducto);

                if (resultado == 2)                   
                {
                    lbResultado.Text = "Producto agregado..";
                    CargarGrilla();

                    // Reseteamos campos
                    nuevoCodigo.Value = "";
                    nuevoNombre.Value = "";
                    Calendario.SelectedDate = DateTime.Now;                
                    nuevoPrecio.Value = "";
                    nuevoPeso.Value = "";
                }

                else if (resultado == -1)
                {
                    lbResultado.Text = "Ya existe un producto registrado con el codigo indicado..";
                }

                else
                {
                    lbResultado.Text = Convert.ToString(resultado);  //"No se ha agregado producto...";

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
                List<PCongelado> listadoProductos = new List<PCongelado>();

                if (txtBuscar.Value != "")
                {

                    PCongelado producto = LogicaPCongelados.Buscar(Convert.ToInt32(txtBuscar.Value));

                    if (producto.CodigoB == 0)
                    {
                        CargarGrilla();
                        throw new Exception("ERROR: No se encontraron coinciencias");
                    }

                    listadoProductos.Add(producto);

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
                        lbResultado.Text = "No existen productos registrados.";
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
                PCongelado producto = new PCongelado();
                producto.CodigoB = Convert.ToInt32(Convert.ToInt32(nuevoCodigo.Value));
                producto.Nombre = nuevoNombre.Value;
                producto.FechaVto = Calendario.SelectedDate;
                producto.Precio = Convert.ToDouble(nuevoPrecio.Value);
                producto.Peso = Convert.ToDouble(nuevoPeso.Value);

                int resultado = LogicaPCongelados.Modificar(producto);

                if (resultado == 2)
                {
                    lbResultado.Text = "Producto Modificado";
                    CargarGrilla();

                    btnAgregar.Visible = true;
                    btnGuardar.Visible = false;
                    btnGuardarCancelar.Visible = false;

                    // Reseteamos campos
                    nuevoCodigo.Disabled = false;
                    nuevoCodigo.Value = "";
                    nuevoNombre.Value = "";
                    Calendario.SelectedDate = DateTime.Now;
                    nuevoPrecio.Value = "";
                    nuevoPeso.Value = "";

                }
                else
                {
                    lbResultado.Text = Convert.ToString(resultado); //"No se pudo modificar";
                }
            }

            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }
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
                int resultado = 0;

                resultado = LogicaPCongelados.Eliminar(Convert.ToInt32(GridProductos.Rows[e.RowIndex].Cells[1].Text));

                if (resultado == -1)
                {
                    lbResultado.Text = Convert.ToString(resultado); //"Se ha eliminado producto.";
                    CargarGrilla();
                }

                else
                {
                    GridProductos.Visible = false;
                    lbResultado.Text = "Ha ocurrido un error..";
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
                nuevoCodigo.Disabled = false;
                nuevoCodigo.Value = "";
                nuevoNombre.Value = "";
                Calendario.SelectedDate = DateTime.Now;
                nuevoPrecio.Value = "";
                nuevoPeso.Value = "";

            }

            catch (Exception ex)
            {
                lbResultado.Text = ex.Message;
            }
        }
    }
}