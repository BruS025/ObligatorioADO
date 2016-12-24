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

        <div class="col-md-12 col-lg-12" id="div1">
            <div class="input-group col-md-6 col-lg-6" id="div2">
                <span class="input-group-addon" id="basic-addon1">Buscar cliente</span>
                <input id="txtBuscar" type="text" class="form-control" placeholder="Ingrese documento del cliente" aria-describedby="basic-addon1" runat="server"/>
                <span class="input-group-btn">
                    <asp:Button ID="btBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Height="34px" />
                </span>
            </div>
        </div>

        <div class="container" id="div3">

        <div class="col-sm-1 col-md-1 col-lg-1" id="div4">
            <br />
            <asp:Button ID="btnAgregar" CssClass="btn btn-default" runat="server" Text="Agregar" Height="34px" OnClick="btnAgregar_Click" /> 
                                 
            <asp:LinkButton ID="btnGuardar" runat="server" CssClass="btn btn-default" OnClick="btnModificar_Click" Height="34px" Visible ="false" Width ="47%" Font-Size="Smaller">
                <span id="span1" aria-hidden="true" class="glyphicon glyphicon-ok"></span>
            </asp:LinkButton>
            
            <asp:LinkButton ID="btnGuardarCancelar" runat="server" CssClass="btn btn-default" OnClick="btnModificarCancelar_Click" Height="34px" Visible ="false" Width="47%" Font-Size="Smaller">
                <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
            </asp:LinkButton>

        </div>

	<div class="col-md-2" id="div5">  
        <br />            
	    <input runat="server" id="nuevoDocumento" value="" type="text" class="form-control" placeholder="CI" aria-describedby="basic-nuevoDoc" />
        </div>

	<div class="col-md-2">
		<br />
		<input runat="server" id="nuevoNombre" type="text" class="form-control" placeholder="Nombre" aria-describedby="basic-nuevoNombre"/>
	</div>			

	<div class="col-md-2">
                <br />
		<input runat="server" id="nuevoApellido" type="text" class="form-control" placeholder="Apellido" aria-describedby="basic-nuevoApellido"/>
	</div>			
			
   <div class="col-md-2">
		<br />
		<input runat="server" id="nuevoTelefono" type="text" class="form-control" placeholder="Teléfono" aria-describedby="basic-Telefono"/>
	</div>		

    <div class="col-md-2">
        <br />
		<input runat="server" id="nuevoDireccion" type="text" class="form-control" placeholder="Dirección" aria-describedby="basic-Direccion"/>
	</div>			

    <div class="col-md-1">
        <br />
		<input runat="server" id="nuevoPuerta" type="text" class="form-control" placeholder="Nro. Puerta" aria-describedby="basic-nroPuerta"/>
    </div>
			
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
        OnPageIndexChanging="GridClientes_PageIndexChanging"
        OnSelectedIndexChanging="GridClientes_SelectedIndexChanging"
        OnRowDeleting="GridClientes_RowDeleting"
          
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

              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Cedula" HeaderText="Cédula" SortExpression="Cedula" ReadOnly ="True" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Telefono" HeaderText="Teléfono" SortExpression="Telefono" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Direccion" HeaderText="Dirección" SortExpression="Direccion" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="NroPuerta" HeaderText="NroPuerta" SortExpression="NroPuerta" />
              
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
