<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expired.aspx.cs" Inherits="ProjPIMVIII.Views.Support.Expired" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
          <link rel="stylesheet" type="text/css" href="~/content/bootstrap.css">

</head>
<body>
    <form id="form1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_pimConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:db_pimConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM [tbl_teste] WHERE (data < Date()) order by data">
                </asp:SqlDataSource>

        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Código" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Código" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="Código" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
                <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="data" SortExpression="data" />
            </Columns>
        </asp:GridView> 
    </form>
               


</body>
</html>
