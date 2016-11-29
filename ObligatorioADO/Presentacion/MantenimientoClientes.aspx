<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoClientes.aspx.cs" Inherits="Presentacion.MantenimientoClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <title>Mantenimiento de clientes</title>

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
        <h1><strong>Mantenimiento de clientes</strong></h1>
    </div>  
</header>

<br />

<div class="container">
    <div class="row">
        <div class="col-md-6 col-lg-6">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">Buscar cliente</span>
                <input id="txtBuscar" type="text" class="form-control" placeholder="Ingrese caracteres de busqueda.." aria-describedby="basic-addon1"/>
                <span class="input-group-btn">
                    <button id="btBuscar" class="btn btn-default" type="button">Buscar</button>
                </span>
            </div>
        </div>
    </div>
</div>

<br />

<div class="container style="text-align: center"">
    <div class="row">

        <div class="col-md-1 col-lg-1">                     
            <button id="btAgregar" class="btn btn-default" type="button">Agregar</button> 
        </div>
       
            <div class="col-md-2 col-lg-2">
                <input id="txtDocumento" type="text" class="form-control" placeholder="Documento.."/>               
            </div>

            <div class="col-md-3 col-lg-3">
                <input id="txtNombre" type="text" class="form-control" placeholder="Nombre.."/>
            </div>
          
            <div class="col-md-2 col-lg-2">
                    <input id="txtDireccion" type="text" class="form-control" placeholder="Direccion.."/>
            </div>

            <div class="col-md-2 col-lg-2">
                    <input id="txtNumeroPuerta" type="text" class="form-control" placeholder="Nro. puerta.."/>
            </div>

            <!-- <div class="clearfix visible-sm-block"></div> -->

            <div class="col-md-2 col-lg-2">
                    <input id="txtTelefono" type="text" class="form-control" placeholder="Telefono.."/>
            </div>

            <div style="text-align: center" class="col-md-12">
                <br />
                <asp:Label ID="lbResultado" runat="server" Font-Size="Small" Text="Test:Resultado"></asp:Label>
                <br />
                <br />
                <br />
            </div>


         <div style="text-align: center" class="col-md-12">  
            <br />                   
            <button id="btVolver" class="btn btn-default" type="button">Volver</button> 
            <br />
         </div>


    </div>
</div>




</asp:Content>
