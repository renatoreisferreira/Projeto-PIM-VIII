<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="ProjPIMVIII.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="stylesheet" type="text/css" href="content/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
<script src="Scripts/jquery-3.4.1.min.js"></script>
<script src="Scripts/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
     jQuery(function ($) {
         $("#dataTextBox").mask("99/99/9999");
       });
</script>  

<title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_pimConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:db_pimConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM [tbl_teste]" 
                DeleteCommand="DELETE FROM [tbl_teste] WHERE [Código] = ?" 
                InsertCommand="INSERT INTO [tbl_teste] ([nome], [descricao], [data]) VALUES (?, ?, ?)" 
                UpdateCommand="UPDATE [tbl_teste] SET [nome] = ?, [descricao] = ?, [data] = ?, WHERE [Código] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="Código" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter Name="data"  DbType="date" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter Name="data" Type="DateTime" />
                    <asp:Parameter Name="Código" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="lvAdd" runat="server" DataKeyNames="Código" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnSelectedIndexChanged="lvAdd_SelectedIndexChanged">
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                        </td>
            <asp:RequiredFieldValidator ID="rfvTBnome" 
             runat="server" ControlToValidate="nomeTextBox" 
             ErrorMessage="Favor Inserir o Nome da Tarefa" Display="None" Visible="True" Enabled="True">
            </asp:RequiredFieldValidator>
                        <td>
                            <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                            <br />
                        </td>
             <asp:RequiredFieldValidator ID="rfvTBdescricao" 
             runat="server" ControlToValidate="descricaoTextBox" 
             ErrorMessage="Favor Inserir a Descrição da Tarefa" Display="None">
            </asp:RequiredFieldValidator>
                        <td>
                            <asp:TextBox ID="dataTextBox" ClientIDMode="Static" runat="server" Text='<%# Bind("data") %>' />
                        </td>
             <asp:RequiredFieldValidator ID="rfvDTdata" 
             runat="server" ControlToValidate="dataTextBox" 
             ErrorMessage="Favor Inserir a Data de Vencimento da Tarefa. Ex: 01/02/2020" Display="None">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="revDTdata" 
            runat="server" ErrorMessage="Favor Inserir a Data de Vencimento da Tarefa. Ex: 01/02/2020" 
            ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ControlToValidate="dataTextBox" Display="None">
            </asp:RegularExpressionValidator>

            <asp:RangeValidator ID="rvDTData" runat="server" 
            ErrorMessage="Digitar uma Data Válida entre dias 01 e 31 e Meses entre 01 e 12" MaximumValue="31/31/2099" MinimumValue="01/01/1900" 
            ControlToValidate="dataTextBox"></asp:RangeValidator>
                        <br />
                        

                        <td>
                            <asp:Button ID="Button2" runat="server" CommandName="Insert" Text="Gravar"  />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                        <th runat="server">Nome Tarefa</th>
                                        <th runat="server">Descrição</th>
                                        <th runat="server">Data Vcto.</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>


            <asp:ValidationSummary ID="vsAdd" runat="server" />
            <br />
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
