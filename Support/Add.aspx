<%@ Page Language="C#" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="ProjPIMVIII.Add"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
<script type="text/javascript">
    $("#dataTextBox").mask("00/99/9999");
    </script>
<title></title>
</head>
<body bgcolor="#65789b">
    <form id="form1" runat="server">
        <div style=" margin-left: 0px; margin-top: 0px;  float:left; width:659px; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight:600; height: 165px;" >
            <div style="background-color:greenyellow; height:25px; width:130px; padding: 6px 0px 0px 6px; margin: -10px -0px -0px -10px; border-radius: 5px 5px" >Adicionar Tarefas</div>

            <asp:ListView ID="lvAdd" runat="server"  DataKeyNames="Código" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnSelectedIndexChanged="lvAdd_SelectedIndexChanged" style="" ClientIDMode="Static">
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
                            <asp:TextBox ID="descricaoTextBox"  runat="server" Text='<%# Bind("descricao") %>' />
                            <br />
                        </td>
             <asp:RequiredFieldValidator ID="rfvTBdescricao" 
             runat="server" ControlToValidate="descricaoTextBox" 
             ErrorMessage="Favor Inserir a Descrição da Tarefa" Display="None">
            </asp:RequiredFieldValidator>
                        <td>
                            <asp:TextBox ID="dataTextBox" ClientIDMode="Static"  name="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
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
                        <td>
                            <asp:Button ID="Button2" runat="server" CommandName="Insert" Text="Gravar"  />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" >
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="width:600px; border-collapse: collapse;border-color: #65789b;border-style:none;border-width:1px;font-family:Arial; text-align: left;">
                                    <tr runat="server" style="background-color:skyblue ; ">
                                        <th runat="server">Nome Tarefa</th>
                                        <th runat="server">Descrição</th>
                                        <th runat="server" ClientIDMode="Static">Vencimento</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server"  style=" "></td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>

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

            <br />
        </div>
                <div style="float:right; height: 107px; padding-top: 5px;">
                                <asp:ValidationSummary ID="vsAdd" runat="server" Font-Italic="True" Font-Names="Arial" ForeColor="#CCCCCC" Font-Size="Small" Font-Bold="True" Height="27px" Width="455px" />

                </div>
    </form>        
</body>
</html>
