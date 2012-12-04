<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projeto_oferta.aspx.cs" Inherits="HavikTeste.projeto_oferta" %>

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
        .style8
        {
            height: 23px;
            }
        .style7
        {
        }
        .style5
        {
            width: 200px;
            height: 23px;
        }
        .style6
        {
            height: 23px;
        }
        .style9
        {
        }
        .style11
        {
        }
        .style12
        {
            width: 100%;
        }
        .style14
        {
            width: 80px;
        }
        .style15
        {
            width: 250px;
        }
        .style16
        {
            width: 250px;
            height: 23px;
        }
        .style17
        {
            width: 230px;
        }
        .style18
        {
            width: 235px;
        }
        .style19
        {
            width: 290px;
        }
        </style>
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
                        ImageUrl="~/Imagens projeto/botao_oferta_ativado.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_mapeamento_desativado.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton5" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_site_desativado.png" />
                </td>
            </tr>
        </table>
        <div align="center">
        <img align="middle" alt="" class="style2" 
            src="Imagens projeto/barra_progresso_oferta.png" /></div>
        </div>
        </div>
        <div align="center">
            <br />
            <br />
            <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label3" runat="server" Text="Remuneração" 
                            Font-Names="Arial"></asp:Label>
        
                    </td>
                    <td align="left" colspan="2">
            <asp:Label ID="nome_projeto" runat="server" Text="Intervalo Salarial" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_oferta_text_intervalo_salarial" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
                    <td align="left" colspan="2">
            <asp:Label ID="nome_projeto0" runat="server" Text="Salário de Faturamento Inicial / Negociado" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_oferta_text_salario_inicial" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
                    <td align="left" class="style19">
            <asp:Label ID="nome_projeto7" runat="server" Text="Bônus" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                    <td align="left">
            <asp:Label ID="nome_projeto8" runat="server" Text="Valor / Quantia" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style19">
        
                        <asp:DropDownList ID="projeto_oferta_ddl_bonus" Height="30px" 
                            Width="210px" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                    </td>
                    <td align="left">
                        <asp:TextBox ID="projeto_oferta_text_valor_bonus" runat="server" Height="30px" Width="250px"></asp:TextBox>
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
                    <td align="left" class="style8" colspan="2">
            <asp:Label ID="nome_projeto1" runat="server" Text="Total Cash" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style8" colspan="2">
        
                        <asp:TextBox ID="projeto_oferta_text_total_cash" runat="server" Height="30px" Width="470px"></asp:TextBox>
        
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
                    <td align="left" colspan="2">
                        <asp:Panel ID="Panel2" runat="server" BackColor="#EEEDE7" BorderColor="#D8D6C7" 
                            Width="560px">
                            <table class="style12">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Font-Names="Arial" Font-Size="Medium" 
                                            Text="Benefício"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Font-Names="Arial" Font-Size="Medium" 
                                            Text="Valor / Porcentagem"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        <asp:DropDownList ID="projeto_oferta_ddl_beneficio" runat="server" 
                                            AppendDataBoundItems="True" Height="30px" Width="210px">
                                            <asp:ListItem Text="Escolha a Opção" Value="0"> </asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style18">
                                        <asp:TextBox ID="projeto_oferta_text_valor" runat="server" Height="30px" Width="250px"></asp:TextBox>
                                    </td>
                                    <td class="style14">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        &nbsp;</td>
                                    <td class="style18">
                                        &nbsp;</td>
                                    <td class="style14">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <asp:LinkButton ID="LinkButton2" runat="server" Font-Names="Arial" 
                                Font-Underline="False" ForeColor="#FF9933">Adicionar outro benefício</asp:LinkButton>
                        </asp:Panel>
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
                    <td align="left" class="style15">
                        &nbsp;</td>
                    <td align="right" class="style19">
                        <asp:ImageButton ID="projeto_oferta_button_cadastro" runat="server" 
                            ImageUrl="~/Imagens projeto/botao_proximo.png" 
                            onclick="projeto_oferta_button_cadastro_Click" />
                    </td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                </table>        
        </div>
    </form>
</body>
</html>
