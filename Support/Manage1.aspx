<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage1.aspx.cs" Inherits="ProjPIMVIII.Manage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title></title>
          <link rel="stylesheet" type="text/css" href="~/content/bootstrap.css">

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_pimConnectionString %>" 
                DeleteCommand="DELETE FROM [tbl_teste] WHERE [Código] = ?" 
                InsertCommand="INSERT INTO [tbl_teste] ([Código], [nome], [descricao], [data]) VALUES (?, ?, ?, ?)" 
                ProviderName="<%$ ConnectionStrings:db_pimConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM [tbl_teste]" 
                UpdateCommand="UPDATE [tbl_teste] SET [nome] = ?, [descricao] = ?, [data] = ? WHERE [Código] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="Código" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Código" Type="Int32" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter Name="data" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter Name="data" Type="DateTime" />
                    <asp:Parameter Name="Código" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvManage1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Código" DataSourceID="SqlDataSource1" GridLines="Vertical" OnSelectedIndexChanged="gvManage1_SelectedIndexChanged" style="text-align: center">
                <AlternatingRowStyle BackColor="Gainsboro" />
                <Columns>
                    <asp:BoundField DataField="Código" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="Código" />
                    <asp:BoundField DataField="nome" HeaderText="Nome Tarefa" SortExpression="nome" />
                    <asp:BoundField DataField="descricao" HeaderText="Descrição" SortExpression="descricao" />
                    <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="Dia Vcto." SortExpression="data" />
                    <asp:CommandField HeaderText="Ação" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
