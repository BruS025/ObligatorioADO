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
        {/*
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

            }*/
        }

        // Volver
        protected void btVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        // Cargar Grilla
        private void CargarGrilla()
        {/*
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
            }*/
        }

        // Agregar nuevo cliente
        protected void btnAgregar_Click(object sender, EventArgs e)
        {/*

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
            }*/
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {

        }

        protected void btnVender_Click(object sender, EventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {

        }
    }
}
