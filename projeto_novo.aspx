<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projeto_novo.aspx.cs" Inherits="HavikTeste.projeto_novo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<style type="text/css">
        .style1
        {
            width: 855px;
        }
        .style2
        {
            width: 775px;
            height: 30px;
        }
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
            width: 200px;
            height: 23px;
        }
        .style6
        {
            height: 23px;
        }
        .style7
        {
            width: 360px;
        }
        .style8
        {
            height: 23px;
            width: 360px;
        }
        .style9
        {
            width: 200px;
            height: 28px;
        }
        .style10
        {
            height: 28px;
        }
        .style11
        {
            width: 468px;
        }
    </style>
</head>
<body alink="#f4f5f0">
    <form id="form1" runat="server" style="background-color: #F4F5F0">
    <ajax:ToolkitScriptManager ID="ScriptManager1" runat="server"/>
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
                        ImageUrl="~/Imagens projeto/botao_projeto_ativado.png"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="projeto_novo_button_requisitos" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_requisitos_desativado.png" 
                        onclick="projeto_novo_button_requisitos_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/Imagens projeto/botao_oferta_desativado.png" />
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
            src="Imagens projeto/barra_progresso_projeto.png" /></div>
        </div>
        <div align="center">
            <br />
            <br />
            <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label3" runat="server" Text="Resumo do Projeto" 
                            Font-Names="Arial"></asp:Label>
        
                    </td>
                    <td align="left" colspan="2">
            <asp:Label ID="nome_projeto" runat="server" Text="Nome" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_novo_nome" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
            <asp:Label ID="nome_projeto0" runat="server" Text="Empresa" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_novo_empresa" runat="server" Height="30px" Width="470px" AutoComplete="off"></asp:TextBox>
                        <ajax:AutoCompleteExtender ID="AutoCompleteExtender4" runat="server" TargetControlID="projeto_novo_empresa" Enabled="true"
                            ServicePath="PWebService.asmx" ServiceMethod="GetCompletionList" EnableCaching="true" UseContextKey="True" MinimumPrefixLength="3"
                            CompletionInterval="300" CompletionSetCount="5" ShowOnlyCurrentWordInCompletionListItem="true" >
                        </ajax:AutoCompleteExtender>
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
                    <td align="left" class="style8">
            <asp:Label ID="nome_projeto1" runat="server" Text="Produto" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                    <td align="left" class="style6">
            <asp:Label ID="Label13" runat="server" Text="Vagas" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style8">
        
                        <asp:DropDownList ID="projeto_novo_ddl_produto" Height="30px" Width="350px" 
                            runat="server" DataSourceID="projeto_novo_source_produto" 
                            DataTextField="descricao" DataValueField="id" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                        </asp:DropDownList>
        
                        <asp:SqlDataSource ID="projeto_novo_source_produto" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_proj_tp_produto]"></asp:SqlDataSource>
        
                    </td>
                    <td align="left" class="style6">
        
                        <asp:DropDownList ID="projeto_novo_ddl_produto_vagas" Height="30px" Width="100px" 
                            runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_qtde_vagas" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                        <asp:SqlDataSource ID="projeto_novo_source_qtde_vagas" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_proj_qtde_vagas]"></asp:SqlDataSource>
        
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
            <asp:Label ID="nome_projeto2" runat="server" Text="Cidade e Estado" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_novo_text_cidade_estado" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
            <asp:Label ID="nome_projeto3" runat="server" Text="Segmento" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:DropDownList ID="projeto_novo_ddl_segmento" Height="30px" Width="470px" 
                            runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_segmento" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="projeto_novo_source_segmento" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_emp_segmento]"></asp:SqlDataSource>
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
            <asp:Label ID="nome_projeto4" runat="server" Text="Área" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_novo_text_area" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
            <asp:Label ID="nome_projeto5" runat="server" Text="Cargo" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:DropDownList ID="projeto_novo_ddl_cargo" Height="30px" Width="470px" 
                            runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_cargo" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="projeto_novo_source_cargo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_proj_cargo]"></asp:SqlDataSource>
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
            <asp:Label ID="nome_projeto6" runat="server" Text="Captação" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:DropDownList ID="projeto_novo_ddl_captacao" Height="30px" Width="470px" 
                            runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_captacao" DataTextField="nome_usuario" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="projeto_novo_source_captacao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_relat_responsavel]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
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
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label2" runat="server" Text="Equipe" 
                            Font-Names="Arial"></asp:Label>
        
                    </td>
                    <td align="left" class="style7">
            <asp:Label ID="Label4" runat="server" Text="Equipe de entrega" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                    <td align="left">
            <asp:Label ID="Label7" runat="server" Text="Vagas" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style5">
        
                    </td>
                    <td align="left" class="style8">
        
                        <asp:DropDownList ID="projeto_novo_ddl_equipe_entrega" Height="30px" 
                            Width="350px" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_entrega" DataTextField="nome_usuario" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                        <asp:SqlDataSource ID="projeto_novo_source_entrega" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_proj_equipe]"></asp:SqlDataSource>
        
                    </td>
                    <td align="left" class="style6">
        
                        <asp:DropDownList ID="projeto_novo_ddl_produto_vagas1" Height="30px" 
                            Width="100px" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_qtde_vagas" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
            <asp:Label ID="Label5" runat="server" Text="Resp. Entrega" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                    <td align="left">
            <asp:Label ID="Label8" runat="server" Text="Vagas" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        <asp:DropDownList ID="projeto_novo_ddl_responsavel_entrega" Height="30px" 
                            Width="350px" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_captacao" DataTextField="nome_usuario" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left">
        
                        <asp:DropDownList ID="projeto_novo_ddl_produto_vagas2" Height="30px" 
                            Width="100px" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_qtde_vagas" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
            <asp:Label ID="Label6" runat="server" Text="Research / Analista" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                    <td align="left">
            <asp:Label ID="Label9" runat="server" Text="Vagas" Font-Names="Arial" 
                            Font-Size="Medium"></asp:Label>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        <asp:DropDownList ID="projeto_novo_ddl_analista_responsavel" Height="30px" 
                            Width="350px" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_analista" DataTextField="nome_usuario" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="projeto_novo_source_analista" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_proj_colaborador]"></asp:SqlDataSource>
                    </td>
                    <td align="left">
        
                        <asp:DropDownList ID="projeto_novo_ddl_produto_vagas3" Height="30px" 
                            Width="100px" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="projeto_novo_source_qtde_vagas" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0" Text="Escolha a Opção"> </asp:ListItem>
                        </asp:DropDownList>
        
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" class="style7">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
         </table>
        </div>
        <hr size="1px" style="border-style: dashed none none none; border-width: thin; border-color: #808080" />
        <div>
            <script src="js/mascara.js" type="text/javascript"></script>
            <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label10" runat="server" Font-Names="Arial" 
                            Text="Datas"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="nome_projeto7" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="Data de Início"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style9">
                    </td>
                    <td align="left" class="style10">
                        <asp:TextBox ID="projeto_novo_text_data_início" runat="server" Height="30px" Width="470px"
                        onkeyup="formataData (this,event);"></asp:TextBox>
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
                        <asp:Label ID="nome_projeto10" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="Início da Busca"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="projeto_novo_text_data_inicio_busca" runat="server" Height="30px" Width="470px"
                        onkeyup="formataData (this,event);"></asp:TextBox>
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
                        <asp:Label ID="nome_projeto11" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="Previsão Shortlist"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="projeto_novo_text_data_shortlist" runat="server" Height="30px" Width="470px"
                        onkeyup="formataData (this,event);"></asp:TextBox>
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
                        <asp:Label ID="nome_projeto12" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="Entrega Shortlist"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="projeto_novo_text_data_entrega" runat="server" Height="30px" Width="470px"
                        onkeyup="formataData (this,event);"></asp:TextBox>
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
        <div>
        
            <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label11" runat="server" Font-Names="Arial" 
                            Text="Vagas.com"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="nome_projeto8" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="Número no Vagas"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="projeto_novo_text_nro_vagas" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
                        <asp:Label ID="nome_projeto13" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="Requisição no Vagas"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="projeto_novo_text_requisicao_vagas" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
        <div>
        
            <table align="center" class="style3" width="860px">
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        <asp:Label ID="Label12" runat="server" Font-Names="Arial" 
                            Text="Resumo do Projeto"></asp:Label>
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="nome_projeto9" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="Requisitante da Vaga"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_novo_text_requisitante_vaga" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
                        <asp:Label ID="nome_projeto14" runat="server" Font-Names="Arial" 
                            Font-Size="Medium" Text="RH da Vaga"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style4">
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:TextBox ID="projeto_novo_text_rh_vaga" runat="server" Height="30px" Width="470px"></asp:TextBox>
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
                    <td align="right" class="style11">
                        <asp:ImageButton ID="projeto_novo_button_cadastro" runat="server" 
                            ImageUrl="~/Imagens projeto/botao_proximo.png" 
                            onclick="projeto_novo_button_cadastro_click" />
                    </td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
            </table>
        
        </div>
    </form>
</body>
</html>
