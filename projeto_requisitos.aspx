<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projeto_requisitos.aspx.cs" Inherits="HavikTeste.projeto_requisitos" %>

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
                <td style="margin-left: 120px">
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_projeto_desativado.png" 
                        onclick="ImageButton1_Click"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton2" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_requisitos_ativado.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_oferta_desativado.png" 
                        onclick="ImageButton3_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_mapeamento_desativado.png" 
                        onclick="ImageButton4_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton5" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_site_desativado.png" />
                </td>
            </tr>
        </table>
        <div align="center">
        <img align="middle" alt="" class="style2" 
            src="Imagens projeto/barra_progresso_requisitos.png" /></div>
        </div>
        </div>
        <div align="center">
            <br />
            <br />
            <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label3" runat="server" Text="Perfil" 
                            Font-Names="Arial"></asp:Label>
        
                    </td>
                    <td align="left">
            <asp:Label ID="nome_projeto" runat="server" Text="Comportamental" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="projeto_requisitos_text_comportamental" runat="server" Height="30px" Width="470px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
            <asp:Label ID="nome_projeto0" runat="server" Text="Técnico" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="projeto_requisitos_text_tecnico" runat="server" Height="30px" Width="470px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style8">
            <asp:Label ID="nome_projeto1" runat="server" Text="Diferencial Profissional" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style8">
        
                        <asp:TextBox ID="projeto_requisitos_text_diferencial" runat="server" Height="30px" Width="470px"></asp:TextBox>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                </table>        
        </div>
        <hr size="1px" style="border-style: dashed none none none; border-width: thin; border-color: #808080" />
    
    
        <div align="center">
        <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label2" runat="server" Text="Experiência" 
                            Font-Names="Arial"></asp:Label>
        
                    </td>
                    <td align="left" class="style7">
            <asp:Label ID="nome_projeto5" runat="server" Text="Empresas Sugeridas" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style5">
        
                    </td>
                    <td align="left" class="style8">
        
                        <asp:DropDownList ID="projeto_requisitos_ddl_empresas" Height="30px" Width="470px" 
                            runat="server" AppendDataBoundItems="True" >
                            <asp:ListItem Value="0" Text="Escolha a Opção"></asp:ListItem>
                        </asp:DropDownList>
                        </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
            <asp:Label ID="nome_projeto6" runat="server" Text="Área / Produto" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
        
                        <asp:DropDownList ID="projeto_requisitos_ddl_area" Height="30px" Width="470px" 
                            runat="server" AppendDataBoundItems="True" 
                            DataSourceID="source_projeto_requisitos_area" DataTextField="descricao" 
                            DataValueField="id" >
                            <asp:ListItem Value="0" Text="Escolha a Opção"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="source_projeto_requisitos_area" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_area]">
                        </asp:SqlDataSource>
                        </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        &nbsp;</td>
                </tr>
                </table>
        <hr size="1px" style="border-style: dashed none none none; border-width: thin; border-color: #808080" />
        </div>
    
    
        <div align="center">
        <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style15">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label10" runat="server" Text="Acadêmico" 
                            Font-Names="Arial"></asp:Label>
        
                    </td>
                    <td align="left" class="style15">
            <asp:Label ID="Label4" runat="server" Text="Nível Desejado" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                    <td align="left" colspan="2">
            <asp:Label ID="Label7" runat="server" Text="Formando em" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style5">
        
                    </td>
                    <td align="left" class="style16">
        
                        <asp:DropDownList ID="projeto_requisitos_ddl_nivel" Height="30px" 
                            Width="210px" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="source_projeto_requisitos_nivel" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                        <asp:SqlDataSource ID="source_projeto_requisitos_nivel" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_nv_idiomas]">
                        </asp:SqlDataSource>
        
                    </td>
                    <td align="left" class="style6" colspan="2">
        
                        <asp:DropDownList ID="projeto_requisitos_ddl_ano_formacao" Height="30px" 
                            Width="210px" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style15">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style9" colspan="3">
            <asp:Label ID="Label5" runat="server" Text="Graduação / Curso" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style9" colspan="3">
        
                        <asp:DropDownList ID="projeto_requisitos_ddl_graduacao" Height="30px" Width="470px" 
                            runat="server" AppendDataBoundItems="True" 
                            DataSourceID="source_projeto_requisitos_graduacao" DataTextField="descricao" 
                            DataValueField="id" >
                            <asp:ListItem Value="0" Text="Escolha a Opção"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="source_projeto_requisitos_graduacao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_graduacao]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style9" colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style9" colspan="3">
            <asp:Label ID="Label6" runat="server" Text="Certificação" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style9" colspan="3">
        
                        <asp:TextBox ID="projeto_requisitos_text_certificacao" runat="server" Height="30px" 
                            Width="470px"></asp:TextBox>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style15">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style11" colspan="3">
                        <asp:Panel ID="Panel1" runat="server" BackColor="#EEEDE7" BorderColor="#D8D6C7" 
                            Width="560px">
                            <table class="style12">
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="Label11" runat="server" Font-Names="Arial" Font-Size="Medium" 
                                            Text="Idiomas"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        <asp:DropDownList ID="projeto_novo_ddl_equipe_entrega0" runat="server" 
                                            AppendDataBoundItems="True" Height="30px" Width="210px" 
                                            DataSourceID="source_projetos_requisitos_idiomas" DataTextField="descricao" 
                                            DataValueField="id">
                                            <asp:ListItem Text="Escolha a Opção" Value="0"> </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="source_projetos_requisitos_idiomas" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_idiomas]">
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style18">
                                        <asp:DropDownList ID="projeto_novo_ddl_equipe_entrega1" runat="server" 
                                            AppendDataBoundItems="True" Height="30px" Width="210px" 
                                            DataSourceID="source_projeto_requisitos_nivel_idioma" DataTextField="descricao" 
                                            DataValueField="id">
                                            <asp:ListItem Text="Escolha a Opção" Value="0"> </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="source_projeto_requisitos_nivel_idioma" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_nv_idiomas]">
                                        </asp:SqlDataSource>
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
                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Arial" 
                                Font-Underline="False" ForeColor="#FF9933">Adicionar outro idioma</asp:LinkButton>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style15">
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
                        <asp:ImageButton ID="projeto_requisitos_button_cadastro" runat="server" 
                            ImageUrl="~/Imagens projeto/botao_proximo.png" 
                            onclick="projeto_requisitos_button_cadastro_Click" />
                    </td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
         </table>
        </div>  
    
    </form>        
        </body>
</html>
