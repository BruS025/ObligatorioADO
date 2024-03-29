﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class MantenimientoClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
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
                BindData();
            }
        }

        protected void btVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            lbResultado.Text = "Buscar";
        }

        protected void GridClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridClientes.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void GridClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridClientes.EditIndex = -1;
            BindData();
        }

        protected void GridClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridClientes.EditIndex = e.NewEditIndex;
            BindData();
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

            BindData();
        }

        private void BindData()
        {
            GridClientes.DataSource = Session["TaskTable"];
            GridClientes.DataBind();
        }
    }
}