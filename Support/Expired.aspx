<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expired.aspx.cs" Inherits="ProjPIMVIII.Views.Support.Expired" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

</head>
<body bgcolor="#65789b">
    <form id="form1" runat="server">
                <div style=" margin-left: 0px; float:left; margin-top: 0px;  float:left; width:1056px; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight:600; height: 498px;" >
                  <div style="background-color:greenyellow; height:25px; width:130px; padding: 7px 0px 0px 10px; margin: -10px -0px -0px -10px; border-radius: 5px 5px" >Tarefas Expiradas</div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_pimConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:db_pimConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM [tbl_teste] WHERE (data < Date()) order by data" 
                        DeleteCommand="DELETE FROM [tbl_teste] WHERE [Código] = ?" InsertCommand="INSERT INTO [tbl_teste] ([Código], [nome], [descricao], [data]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [tbl_teste] SET [nome] = ?, [descricao] = ?, [data] = ? WHERE [Código] = ?">
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

                    <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Código" DataSourceID="SqlDataSource1" style="text-align: center; margin-right: 66px;" EnableTheming="True" Width="1000px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            
                            <AlternatingRowStyle BackColor="#F7F7F7" />
<Columns>
                <asp:BoundField DataField="Código" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="Código" >
                <ControlStyle BackColor="SkyBlue"  />
                    <HeaderStyle Width="50px" BackColor="SkyBlue" ForeColor="Black"/>
                </asp:BoundField>
                <asp:BoundField DataField="nome" HeaderText="Nome Tarefa" SortExpression="nome" >
                    <HeaderStyle BackColor="SkyBlue" Width="170px"  ForeColor="Black"/>
                </asp:BoundField>
                <asp:BoundField DataField="descricao" HeaderText="Descrição" SortExpression="descricao" >
                    <HeaderStyle BackColor="SkyBlue" Width="300px" ForeColor="Black"/>
                </asp:BoundField>
                <asp:BoundField DataField="data" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Dia Vencimento" SortExpression="data" >
                    <HeaderStyle BackColor="SkyBlue" Width="150px" ForeColor="Black"/>
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" HeaderText="Ação">
                    <HeaderStyle BackColor="SkyBlue" Width="150px" ForeColor="Black" />
                </asp:CommandField>
            </Columns>
             <FooterStyle HorizontalAlign="Center" BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#cccccc" ForeColor="#4A3C8C" HorizontalAlign="center" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="Skyblue" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="Skyblue" />
        </asp:GridView> 
       </div>
    </form>
               


</body>
</html>
