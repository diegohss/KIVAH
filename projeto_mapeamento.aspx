<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projeto_mapeamento.aspx.cs" Inherits="HavikTeste.projeto_mapeamento" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style3
        {
            width: 860px;
        }
        .style4
        {
            width: 200px;
        }
        .style5
        {
            width: 360px;
        }
        </style>

        <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.adicionar_campo').click(function (e) {
                    e.preventDefault();
                    var container = $('.container_campos');
                    var button = $('.adicionar_campo');
                    var fieldvalue = $('.proj_drop_campos :selected');
                    console.log(fieldvalue);
                    if (fieldvalue.val() != 0) {

                        $('<p>').text(fieldvalue.text()).appendTo(container);
                    } else {
                        alert('escolha uma opção válida!')
                    }
                })
            })        
        </script>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #F4F5F0">
    <div>
        <asp:Label ID="Label1" runat="server" Text="NOVO PROJETO" Font-Bold="True" 
            Font-Size="X-Large" Font-Names="Arial"></asp:Label>
    </div>
    <hr size="1px" />
    <div align="center">
        <table class="style1">
            <tr>
                <td>
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_projeto_desativado.png" 
                        onclick="ImageButton1_Click"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton2" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_requisitos_desativado.png" 
                        onclick="ImageButton2_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_oferta_desativado.png" 
                        onclick="ImageButton3_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_mapeamento_ativado.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton5" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_site_desativado.png" />
                </td>
            </tr>
        </table>
        <div align="center">
        <img align="middle" alt="" class="style2" 
            src="Imagens projeto/barra_progresso_mapeamento.png" /></div>
        </div>
        </div>
        <div align="center">
            <br />
            <br />
            <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label3" runat="server" Text="Configuração" 
                            Font-Names="Arial"></asp:Label>
        
                    </td>
                    <td align="left" colspan="2">
            <asp:Label ID="nome_projeto" runat="server" Text="Campos para Mapeamento" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                    <div class="container_campos"></div>
                        <asp:DropDownList CssClass="proj_drop_campos" ID="projeto_mapeamento_ddl_campos" 
                            Height="30px" Width="470px" 
                            runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_mapeamento_campos" DataTextField="campo" 
                            DataValueField="id" >
                            <asp:ListItem Value="0" Text="Escolha a Opção"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="projeto_mapeamento_campos" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [campo] FROM [vw_proj_mapeamento]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style5">
                        <asp:ImageButton CssClass="adicionar_campo"  ID="ImageButton6" runat="server" 
                            ImageUrl="~/Imagens projeto/botao_adicionar_campo.png" />
        
                    </td>
                    <td align="left">
                        <asp:ImageButton ID="ImageButton7" runat="server" 
                            ImageUrl="~/Imagens projeto/botao_proximo.png" />
                    </td>
                </tr>
                </table>        
        </div>
    </form>
</body>
</html>
