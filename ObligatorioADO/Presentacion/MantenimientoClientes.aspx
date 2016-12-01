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
        <div class="col-md-1 col-lg-1"> 
            <!-- Activa el modal --> 
            <button onclick="return activateModal()" id="btAgregar" data-backdrop="static" type="button" data-keyboard="false" class="btn btn-default">Agregar</button>   
            <br />            
        </div>  

    </div>
</div>

<br />

<div class="container style="text-align: center"" id="agregarClienteFormulario">
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
        Width="90%"
        ShowFooter="False"
        ShowHeaderWhenEmpty="True"
        PageSize="10"
        Font-Size="Large">

        <AlternatingRowStyle BackColor="White" />

          <Columns>
              <asp:CommandField ControlStyle-Font-Size="Small" ShowEditButton="True" ShowCancelButton="true" ControlStyle-CssClass="btn btn-default" EditText="Editar" CancelText="Cancelar" ButtonType="Button" HeaderText="Acciones" UpdateText="Guardar" CausesValidation="True" InsertVisible="True" />
              <asp:BoundField ItemStyle-Font-Size="Medium" DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" ReadOnly ="True" />
              <asp:BoundField ItemStyle-Font-Size="Medium" DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
              <asp:BoundField ItemStyle-Font-Size="Medium" DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
              <asp:BoundField ItemStyle-Font-Size="Medium" DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
              <asp:BoundField ItemStyle-Font-Size="Medium" DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
              <asp:BoundField ItemStyle-Font-Size="Medium" DataField="NroPuerta" HeaderText="NroPuerta" SortExpression="NroPuerta" />
              <asp:CommandField ControlStyle-Font-Size="Small" ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True" DeleteText="Eliminar" ButtonType="Button" HeaderText="Eliminar" CausesValidation="True" />
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


<!-- Modal --> <!-- Agregar class= "modal hide fade" -->
<div class="modal fade" id="modalAgregar" tabindex="-1" role="dialog" aria-labelledby="tituloModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="return deactivateModal()" ><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="tituloModal">Agregar nuevo cliente</h4>
      </div>
      <div class="modal-body">
		<div class="form-horizontal" id="formModal">
            <div id="errorModalAgregarCliente"></div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-nuevoDoc">Documento</span>
				<input disabled="disabled" id="nuevoDocumento" value="" type="text" class="form-control" placeholder="CI" aria-describedby="basic-nuevoDoc" required="required"/>
			</div>
			
			<br />

			<div class="input-group">
				<span class="input-group-addon" id="basic-nuevoNombre">Nombre</span>
				<input disabled="disabled" id="nuevoNombre" type="text" class="form-control" placeholder="Nombre de cliente" aria-describedby="basic-nuevoNombre" required="required"/>
			</div>
			
			<br />

           <div class="input-group">
				<span class="input-group-addon" id="basic-nuevoApellido">Apellido</span>
				<input disabled="disabled" id="nuevoApellido" type="text" class="form-control" placeholder="Apellido de cliente" aria-describedby="basic-nuevoApellido" required="required"/>
			</div>
			
			<br />
			
			<div class="input-group">
				<span class="input-group-addon" id="basic-Telefono">Telefono</span>
				<input disabled="disabled" id="nuevoTelefono" type="text" class="form-control" placeholder="Telefono" aria-describedby="basic-Telefono"required="required" />
			</div>
			
			<br />

            <div class="input-group">
				<span class="input-group-addon" id="basic-Direccion">Direccion</span>
				<input disabled="disabled" id="nuevoDireccion" type="text" class="form-control" placeholder="Direccion" aria-describedby="basic-Direccion" required="required"/>
			</div>
			
			<br />

            <div class="input-group">
				<span class="input-group-addon" id="basic-nroPuerta">Numero de puerta</span>
				<input disabled="disabled" id="nuevoPuerta" type="text" class="form-control" placeholder="Nro Puerta" aria-describedby="basic-nroPuerta" required="required"/>
            </div>
			
			<br /> 
			
		</div>
        Desea agregar este cliente?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="return deactivateModal()">Cancelar</button>
        <button id="confirmar" type="button" class="btn btn-primary">Agregar</button>
      </div>
    </div>
  </div>
</div>

<!-- Java Script: Activar y Desactivar modal -->
<script>

    function activateModal() {

        $('#modalAgregar').modal({ backdrop: 'static', keyboard: false })
        $("#modalAgregar").modal('show');
        nuevoDocumento.disabled = false;
        nuevoNombre.disabled = false;
        nuevoApellido.disabled = false;
        nuevoTelefono.disabled = false;
        nuevoDireccion.disabled = false;
        nuevoPuerta.disabled = false;
    }

    function deactivateModal() {

        $("#modalAgregar").modal('show');
        nuevoDocumento.disabled = true;
        nuevoDocumento.value = "";

        nuevoNombre.disabled = true;
        nuevoNombre.value = "";

        nuevoApellido.disabled = true;
        nuevoApellido.value = "";

        nuevoTelefono.disabled = true;
        nuevoTelefono.value = "";

        nuevoDireccion.disabled = true;
        nuevoDireccion.value = "";

        nuevoPuerta.disabled = true;
        nuevoPuerta.value = "";


    }

</script>




</asp:Content>
