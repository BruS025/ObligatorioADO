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
                    <asp:Button ID="btBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btBuscar_Click" Height="34px" />
                </span>
            </div>
        </div>
    </div>
</div>

<br />

<div class="container style="text-align: center"">
    <div class="row">

        <div class="col-md-1 col-lg-1"> 
            <!-- Activa el modal -->
            <button id="btAgregar" type="button" class="btn btn-default" data-toggle="modal" data-target="#modalAgregar">Agregar</button>                            
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
             <asp:Button ID="btVolver" CssClass="btn btn-default" runat="server" Text="Volver" OnClick="btVolver_Click" Height="34px" />
            <br />
         </div>


    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalAgregar" tabindex="-1" role="dialog" aria-labelledby="tituloModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="tituloModal">Agregar nuevo cliente</h4>
      </div>
      <div class="modal-body">
		<div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-nuevoDoc">Documento</span>
				<input id="nuevoDocumento" type="text" class="form-control" placeholder="CI" aria-describedby="basic-nuevoDoc" required="required"/>
			</div>
			
			<br />

			<div class="input-group">
				<span class="input-group-addon" id="basic-nuevoNombre">Nombre</span>
				<input id="nuevoNombre" type="text" class="form-control" placeholder="Nombre de cliente" aria-describedby="basic-nuevoNombre" required="required"/>
			</div>
			
			<br />

           <div class="input-group">
				<span class="input-group-addon" id="basic-nuevoApellido">Apellido</span>
				<input id="nuevoApellido" type="text" class="form-control" placeholder="Apellido de cliente" aria-describedby="basic-nuevoApellido" required="required"/>
			</div>
			
			<br />
			
			<div class="input-group">
				<span class="input-group-addon" id="basic-Telefono">Telefono</span>
				<input id="nuevoTelefono" type="text" class="form-control" placeholder="Telefono" aria-describedby="basic-Telefono"required="required" />
			</div>
			
			<br />

            <div class="input-group">
				<span class="input-group-addon" id="basic-Direccion">Direccion</span>
				<input id="nuevoDireccion" type="text" class="form-control" placeholder="Direccion" aria-describedby="basic-Direccion" required="required"/>
			</div>
			
			<br />

            <div class="input-group">
				<span class="input-group-addon" id="basic-nroPuerta">Numero de puerta</span>
				<input id="nuevoPuerta" type="text" class="form-control" placeholder="Nro Puerta" aria-describedby="basic-nroPuerta" required="required"/>
            </div>
			
			<br />

            <div class="input-group">
				<span class="input-group-addon" id="basic-ejemplo">Numero de puerta</span>
				<input id="ejemplo" type="text" class="form-control" placeholder="Nro Puerta" aria-describedby="basic-ejemplo" title="Se necesita un nombre" required="required"/>
            </div>
			
			<br />   
			
		</div>
        Desea agregar este cliente?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button id="confirmar" type="button" class="btn btn-primary">Agregar</button>
      </div>
    </div>
  </div>
</div>


</asp:Content>
