<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoProductosCongelados.aspx.cs" Inherits="Presentacion.MantenimientoProductosCongelados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>Mantenimiento de productos congelados</title>

    <link rel="stylesheet" href = "css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="shortcut icon" href="Imagenes/favicon.ico"/> 
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <link rel="stylesheet" href = "css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="shortcut icon" href="Imagenes/favicon.ico"/> 
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

<header>
    <div class="container">
        <h2><strong>Mantenimiento de productos congelados</strong></h2>
    </div>  
</header>

<div class="container">
    <div class="row">

        <div class="col-md-12 col-lg-12">
            <div class="input-group col-md-6 col-lg-6">
                <span class="input-group-addon" id="basic-addon1">Buscar producto</span>
                <input id="txtBuscar" type="text" class="form-control" placeholder="Ingrese caracteres de busqueda.." aria-describedby="basic-addon1" runat="server"/>
                <span class="input-group-btn">
                    <asp:Button ID="btBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Height="34px" />
                </span>
            </div>
        </div>

        <div class="container">

        <div class="col-sm-1 col-md-1 col-lg-1">
            <br />
            <asp:Button ID="btnAgregar" CssClass="btn btn-default" runat="server" Text="Agregar" Height="34px" OnClick="btnAgregar_Click" /> 
                                 
            <asp:LinkButton ID="btnGuardar" runat="server" CssClass="btn btn-default" OnClick="btnModificar_Click" Height="34px" Visible ="false" Width ="47%" Font-Size="Smaller">
                <span aria-hidden="true" class="glyphicon glyphicon-ok"></span>
            </asp:LinkButton>
            
            <asp:LinkButton ID="btnGuardarCancelar" runat="server" CssClass="btn btn-default" OnClick="btnModificarCancelar_Click" Height="34px" Visible ="false" Width="47%" Font-Size="Smaller">
                <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
            </asp:LinkButton>

        </div>

	<div class="col-md-2">  
        <br />            
	    <input runat="server" id="nuevoCodigo" value="" type="text" class="form-control" placeholder="Codigo" aria-describedby="basic-nuevoCodigo" />
        </div>

	<div class="col-md-2">
		<br />
		<input runat="server" id="nuevoNombre" type="text" class="form-control" placeholder="Nombre" aria-describedby="basic-nuevoNombre"/>
	</div>			

    <div class="col-md-3">
        <br />
        <asp:Calendar ID="Calendario" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="98%">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
	</div>
				
    <div class="col-md-1">
        <br />
		<input runat="server" id="nuevoPrecio" type="text" class="form-control" placeholder="Precio" aria-describedby="basic-Precio"/>
    </div>

    <div class="col-md-1">
        <br />
		<input runat="server" id="nuevoPeso" type="text" class="form-control" placeholder="Peso" aria-describedby="basic-Peso"/>
    </div>
			
	<br /> 
		
	</div>			
</div>
</div>

<br />

<div class="container style="text-align: center"" id="agregarProductoFormulario">
    <div class="row">   

<div style="text-align: center" class="col-md-12">
      <asp:GridView 
        ID="GridProductos" 
        runat="server" 
        AutoGenerateEditButton="false" 
        AllowPaging="true"       
        OnPageIndexChanging="GridProductos_PageIndexChanging"
        OnSelectedIndexChanging="GridProductos_SelectedIndexChanging"
        OnRowDeleting="GridProductos_RowDeleting"
          
        AutoGenerateColumns="False"

        RowStyle-Height="34px"
        CellPadding="4"  
        ForeColor="#333333"
        GridLines="None"
        HorizontalAlign="Center"
        Visible="True"
        Width="98%"
        ShowFooter="False"
        ShowHeaderWhenEmpty="True"
        PageSize="8"
        Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

              <asp:TemplateField HeaderStyle-BorderWidth="2px" ControlStyle-Font-Size="Small" ControlStyle-CssClass="btn btn-default" HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnModificar" runat="server" CommandName="select" Text="Editar" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="CodigoB" HeaderText="Codigo" SortExpression="Codigo" ReadOnly ="True" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="FechaVto" HeaderText="Fecha de vencimiento" SortExpression="FechaVto" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Peso" HeaderText="Peso" SortExpression="Peso" />
              
              <asp:TemplateField HeaderStyle-BorderWidth="2px" ControlStyle-Font-Size="Small" ControlStyle-CssClass="btn btn-danger" HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnEliminar" runat="server" CommandName="delete" Text="Eliminar" />
                </ItemTemplate>
              </asp:TemplateField>                           

          </Columns>

                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                    <PagerStyle BackColor="#B50000" ForeColor="White" />

      </asp:GridView>
    </div>

       <div style="text-align: center" class="col-md-12">
        <br />
        <asp:Label ID="lbResultado" runat="server" Font-Size="Small" Text=""></asp:Label>
        <br />
      </div>

        <div style="text-align: center" class="col-md-12">  
            <br />
             <asp:Button ID="btVolver" CssClass="btn btn-default" runat="server" Text="Volver" OnClick="btVolver_Click" Height="34px" />
            <br />
            <br />
            <br />
            <br />
            <br />
         </div>

    </div>
</div>

</asp:Content>
