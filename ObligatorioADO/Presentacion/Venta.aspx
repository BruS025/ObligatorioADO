<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Venta.aspx.cs" Inherits="Presentacion.Venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Ventas</title>

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
        <h2><strong>Ventas</strong></h2>
    </div>  
</header>

<div class="container">
    <div class="row">

        <div class="col-md-12 col-lg-12">
            <div class="input-group col-md-6 col-lg-6">
                <asp:DropDownList ID="VentaCliente" runat="server"></asp:DropDownList>
            </div>
        </div>

        <div class="col-sm-1 col-md-1 col-lg-1">
            <br />
            <asp:ListBox ID="ListadoProductos" runat="server"></asp:ListBox>                           
        </div>

	<div class="col-md-12">  
        <br />            
        <asp:Button ID="btnQuitar" CssClass="btn btn-default" runat="server" Text="-1" OnClick="btnQuitar_Click" Height="34px" />
        </div>

	<div class="col-md-12">  
        <br />            
        <asp:Button ID="btnAgregar" CssClass="btn btn-default" runat="server" Text="+1" OnClick="btnAgregar_Click" Height="34px" />
        </div>		

	<div class="col-md-2">
                <br />
		<asp:ListBox ID="Carrito" runat="server"></asp:ListBox>  
	</div>		
        
    <div class="col-md-2">
        <br />
		<asp:Button ID="btnLimpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" Height="34px" />
	</div>		
			
   <div class="col-md-2">
		<br />
		<asp:Button ID="btnVender" CssClass="btn btn-default" runat="server" Text="Vender" OnClick="btnVender_Click" Height="34px" />
	</div>		
			
	<br /> 
		
	</div>			
</div>

<br />

<div class="container style="text-align: center"" >
    <div class="row">   

       <div style="text-align: center" class="col-md-12">
        <br />
        <asp:Label ID="lbResultado" runat="server" Font-Size="Small" Text=""></asp:Label>
        <br />
      </div>

        <div style="text-align: center" class="col-md-12">  
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
