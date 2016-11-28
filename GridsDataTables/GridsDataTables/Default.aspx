<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridsDataTables.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GridView example</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

      <asp:GridView 
        ID="TaskGridView" 
        runat="server" 
        AutoGenerateEditButton="True" 
        AllowPaging="true"
        OnRowEditing="TaskGridView_RowEditing"         
        OnRowCancelingEdit="TaskGridView_RowCancelingEdit" 
        OnRowUpdating="TaskGridView_RowUpdating"
        OnPageIndexChanging="TaskGridView_PageIndexChanging"
          
        AutoGenerateColumns="False"

        CellPadding="4"  
        ForeColor="#333333"
        GridLines="None"
        HorizontalAlign="Center"
        Visible="True"
        Width="700px"
        ShowFooter="False"
        ShowHeaderWhenEmpty="True"
        PageSize="5"
        Font-Size="Large">

        <AlternatingRowStyle BackColor="White" />

          <Columns>
              <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly ="True" />
              <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
              <asp:CheckBoxField DataField="IsComplete" HeaderText="IsComplete" SortExpression="IsComplete" />
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

      </asp:GridView>


    </div>
    </form>
</body>
</html>
