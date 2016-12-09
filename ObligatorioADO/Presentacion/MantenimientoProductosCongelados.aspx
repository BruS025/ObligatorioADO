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

<div class="container" style="background-color: #C0C0C0">
    <div class="row">

        <div class="col-md-12 col-lg-12">
            <div class="input-group col-md-6 col-lg-6">
                <span class="input-group-addon" id="basic-addon1">Buscar producto</span>
                <input id="txtBuscar" type="text" class="form-control" placeholder="Ingrese caracteres de busqueda.." aria-describedby="basic-addon1"/>
                <span class="input-group-btn">
                    <asp:Button ID="btBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Height="34px" />
                </span>
            </div>
        </div>

        <div class="container">

        <div class="col-md-1">
            <br />
            <asp:Button ID="btnAgregar" CssClass="btn btn-default" runat="server" Text="Agregar" Height="34px" OnClick="btnAgregar_Click" />            
        </div>

	<div class="col-md-2">  
        <br />            
	    <input runat="server" id="nuevoCodigo" value="" type="text" class="form-control" placeholder="Codigo" aria-describedby="basic-nuevoCodigo" />
    </div>
			
	

	<div class="col-md-3">
		<br />
		<input runat="server" id="nuevoNombre" type="text" class="form-control" placeholder="Nombre de producto" aria-describedby="basic-nuevoNombre"/>
	</div>
			

	<div class="col-md-3">
        <br />
		<input runat="server" id="nuevaFecha" type="text" class="form-control" placeholder="Fecha de vencimiento" aria-describedby="basic-nuevaFecha"/>
	</div>		
			
    <div class="col-md-2">
		<br />
		<input runat="server" id="nuevoPrecio" type="text" class="form-control" placeholder="Precio" aria-describedby="basic-Precio"/>
	</div>
			
	<br />

    <div class="col-md-1">
        <br />
		<input runat="server" id="nuevoPeso" type="text" class="form-control" placeholder="Peso" aria-describedby="basic-Peso"/>
	</div>		
		
</div>			
</div>
</div>

<br />

<div class="container style="text-align: center"" >
    <div class="row">   

<div style="text-align: center" class="col-md-12">
      <asp:GridView 
        ID="GridClientes" 
        runat="server" 
        AutoGenerateEditButton="false" 
        AllowPaging="true"
        OnRowEditing="GridClientes_RowEditing"         
        OnRowCancelingEdit="GridClientes_RowCancelingEdit" 
        OnRowUpdating="GridClientes_RowUpdating"
        OnPageIndexChanging="GridClientes_PageIndexChanging"
          
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
        PageSize="10"
        Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>
              <asp:CommandField HeaderStyle-BorderWidth="2px" ControlStyle-Font-Size="Small" ShowEditButton="True" ShowCancelButton="true" ControlStyle-CssClass="btn btn-default" EditText="Editar" CancelText="Cancelar" ButtonType="Button" HeaderText="Acciones" UpdateText="Guardar" CausesValidation="True" InsertVisible="True" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="CodigoB" HeaderText="Codigo" SortExpression="CodigoB" ReadOnly ="True" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="FechaVto" HeaderText="FechaVto" SortExpression="FechaVto" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Peso" HeaderText="Peso" SortExpression="Peso" />
              <asp:CommandField HeaderStyle-BorderWidth="2px" ControlStyle-Font-Size="Small" ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True" DeleteText="Eliminar" ButtonType="Button" HeaderText="Eliminar" CausesValidation="True" />
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
        <asp:Label ID="lbResultado" runat="server" Font-Size="Small" Text="Test:Resultado"></asp:Label>
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
