<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Menú principal</title>

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
        <h1><strong>Menú principal</strong></h1>
    </div>  
</header>

<br />
<br />
<br />

<div class="container">
    <div class="row">

        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 text-center">               
            <asp:Label ID="lbEmpresa" runat="server" Text="Empresa" Font-Bold="True" Font-Size="X-Large" Width="200px" BackColor="Red" ForeColor="White"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btMenuDatosEmpresa" runat="server" Text="Modificar" Width="200px" BackColor="#B50000" BorderStyle="None" Font-Size="Large" ForeColor="White" />
            <br />
            <br />
       </div>

       <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 text-center">               
            <asp:Label ID="lbClientes" runat="server" Text="Usuarios" Font-Bold="True" Font-Size="X-Large" Width="200px" BackColor="Red" ForeColor="White"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btMenuMantenimientoClientes" runat="server" Text="Clientes" Width="200px" BackColor="#B50000" BorderStyle="None" Font-Size="large" ForeColor="White" />
            <br />
            <br />
       </div>

       <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 text-center">               
            <asp:Label ID="lbProductos" runat="server" Text="Productos" Font-Bold="True" Font-Size="X-Large" Width="200px" BackColor="Red" ForeColor="White"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btMenuMantenimientoProductosEnlatados" runat="server" Text="Enlatados" Width="200px" BackColor="#B50000" BorderStyle="None" Font-Size="large" ForeColor="White" />
            <br />
            <br />
            <asp:Button ID="btMenuMantenimientoProductosCongelados" runat="server" Text="Congelados" Width="200px" BackColor="#B50000" BorderStyle="None" Font-Size="large" ForeColor="White" />
            <br />
            <br />
        </div>

        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 text-center">               
            <asp:Label ID="lbVentas" runat="server" Text="Ventas" Font-Bold="True" Font-Size="X-Large" Width="200px" BackColor="Red" ForeColor="White"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btVentas" runat="server" Text="Vender" Width="200px" BackColor="#B50000" BorderStyle="None" Font-Size="large" ForeColor="White" />
            <br />
            <br />
            <asp:Button ID="btVentasAnuales" runat="server" Text="Ventas anuales" Width="200px" BackColor="#B50000" BorderStyle="None" Font-Size="large" ForeColor="White" />
            <br />
            <br />
            <asp:Button ID="btVentasMensuales" runat="server" Text="Ventas mensuales" Width="200px" BackColor="#B50000" BorderStyle="None" Font-Size="large" ForeColor="White" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>

    </div>
</div>





</asp:Content>
