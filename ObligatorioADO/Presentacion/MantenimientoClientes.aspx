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
        <h2><strong>Mantenimiento de clientes</strong></h2>
    </div>  
</header>

<div class="container">
    <div class="row">

        <div class="col-md-12 col-lg-12">
            <div class="input-group col-md-6 col-lg-6">
                <span class="input-group-addon" id="basic-addon1">Buscar cliente</span>
                <input id="txtBuscar" type="text" class="form-control" placeholder="Ingrese caracteres de busqueda.." aria-describedby="basic-addon1"/>
                <span class="input-group-btn">
                    <asp:Button ID="btBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnAgregar_Click" Height="34px" />
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
			<input runat="server" id="nuevoDocumento" value="" type="text" class="form-control" placeholder="CI" aria-describedby="basic-nuevoDoc" />
        </div>
			
			<br />

			<div class="col-md-3">
                <br />
				<input runat="server" id="nuevoNombre" type="text" class="form-control" placeholder="Nombre de cliente" aria-describedby="basic-nuevoNombre"/>
			</div>
			
			<br />

           <div class="col-md-3">
               <br />
				<input runat="server" id="nuevoApellido" type="text" class="form-control" placeholder="Apellido de cliente" aria-describedby="basic-nuevoApellido"/>
			</div>
			
			<br />
			
            <div class="col-md-2">
                <br />
				<input runat="server" id="nuevoTelefono" type="text" class="form-control" placeholder="Telefono" aria-describedby="basic-Telefono"/>
			</div>
			
			<br />

            <div class="col-md-3">
                <br />
				<input runat="server" id="nuevoDireccion" type="text" class="form-control" placeholder="Direccion" aria-describedby="basic-Direccion"/>
			</div>
			
			<br />

            <div class="col-md-1">
                <br />
				<input runat="server" id="nuevoPuerta" type="text" class="form-control" placeholder="Nro Puerta" aria-describedby="basic-nroPuerta"/>
            </div>
			
			<br /> 
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
        Width="98%"
        ShowFooter="False"
        ShowHeaderWhenEmpty="True"
        PageSize="10"
        Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>
              <asp:CommandField HeaderStyle-BorderWidth="2px" ControlStyle-Font-Size="Small" ShowEditButton="True" ShowCancelButton="true" ControlStyle-CssClass="btn btn-default" EditText="Editar" CancelText="Cancelar" ButtonType="Button" HeaderText="Acciones" UpdateText="Guardar" CausesValidation="True" InsertVisible="True" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" ReadOnly ="True" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="NroPuerta" HeaderText="NroPuerta" SortExpression="NroPuerta" />
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


<!-- Java Script: Activar y Desactivar modal -->
<script>

    function agregarCliente() {
        
    }

    function activateModal() {

        $('#modalAgregar').modal({ backdrop: 'static', keyboard: false })
        $("#modalAgregar").modal('show');
        ContentPlaceHolder1_nuevoDocumento.disabled = false;
        ContentPlaceHolder1_nuevoNombre.disabled = false;
        ContentPlaceHolder1_nuevoApellido.disabled = false;
        ContentPlaceHolder1_nuevoTelefono.disabled = false;
        ContentPlaceHolder1_nuevoDireccion.disabled = false;
        ContentPlaceHolder1_nuevoPuerta.disabled = false;
    }

    function deactivateModal() {

            $("#modalAgregar").modal('show');
            ContentPlaceHolder1_nuevoDocumento.disabled = true;
            ContentPlaceHolder1_nuevoDocumento.value = "";

            ContentPlaceHolder1_nuevoNombre.disabled = true;
            ContentPlaceHolder1_nuevoNombre.value = "";

            ContentPlaceHolder1_nuevoApellido.disabled = true;
            ContentPlaceHolder1_nuevoApellido.value = "";

            ContentPlaceHolder1_nuevoTelefono.disabled = true;
            ContentPlaceHolder1_nuevoTelefono.value = "";

            ContentPlaceHolder1_nuevoDireccion.disabled = true;
            ContentPlaceHolder1_nuevoDireccion.value = "";

            ContentPlaceHolder1_nuevoPuerta.disabled = true;
            ContentPlaceHolder1_nuevoPuerta.value = "";

    }

</script>


</asp:Content>