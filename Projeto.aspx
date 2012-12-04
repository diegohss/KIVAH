<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projeto.aspx.cs" Inherits="HavikTeste.Produto" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            margin-left: 80px;
        }
        .style3
        {
        }
        .style4
        {
            width: 335px;
            height: 22px;
        }
        .style6
        {
        }
        .style21
        {
        }
        .style22
        {
            margin-left: 40px;
            height: 26px;
        }
        .style23
        {
            height: 26px;
        }
        .style25
        {
            width: 273px;
            height: 22px;
        }
        .style28
        {
        }
        .style29
        {
            margin-left: 40px;
            width: 215px;
        }
        .style31
        {
            margin-left: 40px;
            width: 117px;
        }
        .style33
        {
            width: 1020px;
        }
        .style34
        {
        }
        .style35
        {
            width: 162px;
        }
        .style37
        {
            margin-left: 40px;
            width: 273px;
        }
        .style39
        {
            margin-left: 40px;
            width: 172px;
        }
        .style40
        {
            margin-left: 40px;
            width: 166px;
        }
        .style42
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="title">
    <asp:Panel ID="resumoProduto" runat="server" Height="128px"
            BackColor="#EEDD83">            
                    <div class="title" style="overflow:auto" >
                    <asp:Panel ID="grid_cliente" runat="server" BackColor="#EEDD83" Height="126px" >
                        <asp:GridView ID="grid_busca_projeto" runat="server" AutoGenerateColumns="False"
                            onselectedindexchanged="grid_busca_projeto_SelectedIndexChanged" 
                            DataKeyNames="id_projeto">
                            <Columns>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" SortExpression="id_projeto">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Projeto" HeaderText="Projeto" SortExpression="Projeto">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                        SortExpression="id_empresa" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_tipo_produto" HeaderText="id_tipo_produto" 
                                        SortExpression="id_tipo_produto" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="produto" HeaderText="produto" SortExpression="produto">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_segmento" HeaderText="id_segmento" 
                                        SortExpression="id_segmento" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="segmento" HeaderText="segmento" SortExpression="segmento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_area" HeaderText="id_area" 
                                        SortExpression="id_area" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="area" HeaderText="area" SortExpression="area">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_subdivisao" HeaderText="id_subdivisao" 
                                        SortExpression="id_subdivisao" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="subdivisao" HeaderText="subdivisao" SortExpression="subdivisao">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_responsavel_entrega" 
                                        HeaderText="id_responsavel_entrega" SortExpression="id_responsavel_entrega" 
                                        Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="responsavel_entrega" HeaderText="responsavel_entrega" SortExpression="responsavel_entrega">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_cargo" HeaderText="id_cargo" 
                                        SortExpression="id_cargo" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_colaborador_responsavel" 
                                        HeaderText="id_colaborador_responsavel" 
                                        SortExpression="id_colaborador_responsavel" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="colaborador_responsavel" HeaderText="colaborador_responsavel" SortExpression="colaborador_responsavel">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dt_ini" HeaderText="dt_ini" SortExpression="dt_ini">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dt_fim" HeaderText="dt_fim" SortExpression="dt_fim">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="salario" HeaderText="salario" SortExpression="salario">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" SortExpression="ultimo_status">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" SortExpression="ultimo_substatus">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_rh" HeaderText="id_rh" SortExpression="id_rh" 
                                        Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Responsavel_Empresa_RH" HeaderText="Responsavel_Empresa_RH" SortExpression="Responsavel_Empresa_RH">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_requisitante" HeaderText="id_requisitante" 
                                        SortExpression="id_requisitante" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Responsavel_Empresa_Requisitante" HeaderText="Responsavel_Empresa_Requisitante" SortExpression="Responsavel_Empresa_Requisitante">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    </div>
    </asp:Panel>
    </div>
    <div class="clear">
    <asp:Menu ID="menuProjeto" runat="server" CssClass="menuEmpresa" OnMenuItemClick="menuProjeto_MenuItemClick"
        IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" BorderWidth="1px" Width="100%" EnableViewState="true">
        <StaticSelectedStyle BackColor="LightBlue" BorderStyle="Solid" BorderColor="Black" />
        <Items>
            <asp:MenuItem Text="projeto" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="requisitos" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="oferta" Value="8"></asp:MenuItem>
            <asp:MenuItem Text="site" Value="2"></asp:MenuItem>
            <asp:MenuItem Text="clientes" Value="3"></asp:MenuItem>
            <asp:MenuItem Text="status" Value="4"></asp:MenuItem>
            <asp:MenuItem Text="IMPORTANTE" Value="5"></asp:MenuItem>
            <asp:MenuItem Text="financeiro" Value="6"></asp:MenuItem>
            <asp:MenuItem Text="relatório" Value="7"></asp:MenuItem>
        </Items>
    </asp:Menu>
    </div>
    <body>
    <ajax:ToolkitScriptManager ID="ScriptManager1" runat="server"/>
    <script type = "text/javascript">
        window.onload = function () {
            var scrollY = parseInt('<%=Request.Form["scrollY"] %>');
            if (!isNaN(scrollY)) {
                window.scrollTo(0, scrollY);
            }
        };
        window.onscroll = function () {
            var scrollY = document.body.scrollTop;
            if (scrollY == 0) {
                if (window.pageYOffset) {
                    scrollY = window.pageYOffset;
                }
                else {
                    scrollY = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
                }
            }
            if (scrollY > 0) {
                var input = document.getElementById("scrollY");
                if (input == null) {
                    input = document.createElement("input");
                    input.setAttribute("type", "hidden");
                    input.setAttribute("id", "scrollY");
                    input.setAttribute("name", "scrollY");
                    document.forms[0].appendChild(input);
                }
                input.value = scrollY;
            }
        };
    </script>
    <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
        <asp:View ID="proj_produto" runat="server">
            <br />    
            <script src="js/mascara.js" type="text/javascript">
</script>       
            <table class="style1">
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="mensagem_proj_produto" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td align="left">
                        <asp:Label ID="proj_produto_label_id" runat="server" Font-Bold="True" 
                            BorderStyle="None" Font-Italic="True"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:Label ID="Label138" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em produto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="label_projeto_id" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="nome*"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" Text="produto*"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label150" runat="server" Text="previsão shortlist"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label151" runat="server" Text="entrega shortlist"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style22" colspan="2">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_produto_textnome" runat="server" Width="330px"></asp:TextBox>
                    </td>
                    <td class="style22">
                        <asp:DropDownList ID="proj_produto_droptipo" runat="server" Height="20px" 
                            Width="330px" AppendDataBoundItems="True" DataSourceID="proj_produto_tipo" 
                            DataTextField="descricao" DataValueField="id">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_tipo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_tp_produto]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="style23">
                            <asp:TextBox ID="proj_produto_dt_prevista_shortlist" runat="server" 
                                Height="20px" onkeydown="return (event.keyCode!=13);" onkeyup="formataData (this,event);" Width="100px"></asp:TextBox>
                                </td>
                    <td class="style23">
                        <asp:TextBox ID="proj_produto_dt_entrega_shortlist" runat="server" 
                            Height="20px" onkeydown="return (event.keyCode!=13);" 
                            onkeyup="formataData (this,event);" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label2" runat="server" Text="empresa*"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label122" runat="server" Text="cargo*"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label152" runat="server" Text="inicio da busca"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label157" runat="server" Text="cdds shortlist"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <script type="text/javascript" language="javascript">
                            function GetCode(sender, e) {
                                $get("<%=id_empresa.ClientID %>").value = e.get_value();
                            }
                        </script>
                        <asp:HiddenField ID="id_empresa" runat="server" />
                        <asp:TextBox ID="proj_produto_empresa" runat="server" 
                            AutoComplete="off" onkeydown="return (event.keyCode!=13);" Width="190px"></asp:TextBox>
                        &nbsp;<asp:Button ID="proj_produto_botao_empresa" runat="server" Height="20px" style="margin-bottom: 0px" 
                            Text="procurar" Width="120px" onclick="proj_produto_botao_empresa_Click" />
                    </td>
                    <td class="style2">
                        
                        <asp:DropDownList ID="proj_produto_dropcargo" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_produto_cargo" 
                            DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_cargo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_cargo]">
                        </asp:SqlDataSource>
                        
                    </td>
                    <td>
                        <asp:TextBox ID="proj_produto_dt_inicio_busca" runat="server" Height="20px" 
                            onkeydown="return (event.keyCode!=13);" onkeyup="formataData (this,event);" 
                            Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="proj_produto_quantidade_candidatos" runat="server" 
                            onkeydown="return (event.keyCode!=13);" onkeyup="formataInteiro (this,event);" 
                            Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label3" runat="server" Text="área*"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label123" runat="server" Text="cidade e estado do projeto"></asp:Label>
                    </td>
                    <td>
                        
                        <asp:Label ID="Label155" runat="server" Text="número no VAGAS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label156" runat="server" Text="requisição no VAGAS"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:DropDownList ID="proj_produto_droparea" runat="server" 
                            DataTextField="descricao" DataValueField="id"
                            OnSelectedIndexChanged="ddlarea_SelectedIndexChanged" DataSourceID="proj_produto_area"
                            AutoPostBack="true" Height="20px" Width="330px" 
                            AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_area" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"                                 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                             </asp:SqlDataSource>
                    </td>
                    <td class="style2">
                        
                        
                        
                        <asp:DropDownList ID="proj_dadoscadastrais_dropcidade" runat="server" 
                            DataSourceID="proj_dadoscadastrais_cidades" DataTextField="munnome" 
                            DataValueField="muncod" Height="19px" Width="198px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_dadoscadastrais_cidades" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            OnSelecting="SqlDataSourceDadosCadastraisCidade_Selecting" 
                            SelectCommand="sp_vw_proj_cidade" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="proj_dadoscadastrais_estado" Name="ufcod" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="proj_dadoscadastrais_estado" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="True" 
                            DataSourceID="proj_projeto_estados" DataTextField="ufsigla" 
                            DataValueField="ufcod" Height="22px" 
                            OnSelectedIndexChanged="ddldadoscadastrais_estado_SelectedIndexChanged" 
                            Width="72px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_projeto_estados" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [ufcod], [ufsigla] FROM [vw_proj_estados]">
                        </asp:SqlDataSource>
                        
                        
                        
                    </td>
                    <td>
                        <asp:TextBox ID="proj_produto_nronovagas" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="65px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="proj_produto_requisicao" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="65px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label136" runat="server" Text="subdivisão*"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label9" runat="server" Text="responsável captação*"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label154" runat="server" Text="tipo da vaga"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        
                        <asp:DropDownList ID="proj_produto_dropsubdivisao" runat="server" 
                            AutoPostBack="true" DataSourceID="proj_produto_subdivisao" 
                            DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                            Width="330px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_subdivisao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_subdivisao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="proj_produto_droparea" Name="id" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        
                        
                        
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="proj_produto_dropcaptacao" runat="server" 
                            DataSourceID="proj_produto_responsavel" DataTextField="nome_usuario" 
                            DataValueField="id" Height="20px" Width="330px" 
                            AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_responsavel" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [nome_usuario] FROM [vw_proj_responsavel]">
                        </asp:SqlDataSource>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="proj_produto_dropnivel" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_produto_dificuldade" 
                            DataTextField="descricao" DataValueField="id" Height="21px" Width="80px">
                            <asp:ListItem Value="0">Nota</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_dificuldade" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_grau_dificuldade]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label137" runat="server" Text="segmento*"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label162" runat="server" Text="equipe de entrega*"></asp:Label>
                    </td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        
                        
                        <asp:DropDownList ID="proj_produto_dropsegmento" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="proj_segmento" 
                            DataTextField="descricao" DataValueField="id" Height="20px" 
                            OnSelectedIndexChanged="ddlsegmento_SelectedIndexChanged" Width="330px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_segmento" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            onselecting="proj_segmento_Selecting" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_segmento]">
                        </asp:SqlDataSource>
                        
                    </td>
                    <td class="style2">                                               
                        
                        <asp:DropDownList ID="proj_produto_drop_equipe" runat="server" 
                            AppendDataBoundItems="True" Height="20px" Width="330px" 
                            DataSourceID="proj_produto_equipe" DataTextField="nome_usuario" 
                            DataValueField="id">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:SqlDataSource ID="proj_produto_equipe" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [nome_usuario] FROM [vw_proj_equipe]">
                        </asp:SqlDataSource>
                        
                    </td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label102" runat="server" Text="data de início"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label103" runat="server" 
                            Text="data de término"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label161" runat="server" Text="responsável entrega*"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label149" runat="server" Text="empresas para abordagem"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">                                       
                    <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_produto_dt_inicio" runat="server" Enabled="False" 
                            Height="20px" Width="100px"></asp:TextBox>                                               
                    </td>
                    <td class="style2">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_produto_dt_fim" runat="server" Enabled="False" 
                            Height="20px" Width="100px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        
                        <asp:DropDownList ID="proj_produto_dropentrega" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_produto_responsavel" 
                            DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                    <td colspan="2">
                        <script language="javascript" type="text/javascript">






                                function GetConcorrente(sender, e) {
                                    $get("<%=id_proj_concorrente.ClientID %>").value = e.get_value();
                                }
                            </script>
                        <asp:HiddenField ID="id_proj_concorrente" runat="server" />
                        <asp:TextBox ID="proj_produto_textconcorrentes" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="310px"></asp:TextBox>
                        <ajax:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" 
                            CompletionInterval="300" CompletionSetCount="5" EnableCaching="true" 
                            Enabled="true" MinimumPrefixLength="2" OnClientItemSelected="GetConcorrente" 
                            ServiceMethod="GetCompletionListConcorrentes" ServicePath="PWebService.asmx" 
                            ShowOnlyCurrentWordInCompletionListItem="true" 
                            TargetControlID="proj_produto_textconcorrentes" UseContextKey="True"></ajax:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Label ID="Label160" runat="server" 
                            Text="researcher ou analista responsável*"></asp:Label>
                    </td>
                    <td colspan="2">
                        
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:DropDownList ID="proj_produto_dropresponsavel" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_colaborador" 
                            DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_colaborador" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [nome_usuario] FROM [vw_proj_colaborador]">
                        </asp:SqlDataSource>
                    </td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label109" runat="server" Text="requisitante da vaga"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label111" runat="server" Text="telefone"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label112" runat="server" Text="email"></asp:Label>
                        &nbsp;</td>
                    <td colspan="2">
                        <asp:Button ID="projeto_produto_abordagem" runat="server" Height="20px" 
                            onclick="Button2_Click" Text="adicionar" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:DropDownList ID="proj_produto_drop_requisitante" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="proj_produto_requisitante" DataTextField="nome" 
                            DataValueField="id" Height="20px" Width="220px" AutoPostBack="True" 
                            onselectedindexchanged="proj_produto_drop_requisitante_SelectedIndexChanged">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_requisitante" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_requisitante" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="id_empresa" Name="id_empresa" 
                                    PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style2">
                        <asp:Panel ID="Panel4" runat="server" Height="65px" 
                            Width="130px">
                            <asp:ListBox ID="proj_produto_list_req_tel" runat="server" Width="120px" 
                                DataSourceID="proj_produto_req_tel" DataTextField="telefone" 
                                DataValueField="telefone"></asp:ListBox>
                            <asp:SqlDataSource ID="proj_produto_req_tel" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_proj_cli_telefone_req" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="proj_produto_drop_requisitante" 
                                        Name="id_cliente" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                    <td class="style2">
                        <asp:Panel ID="Panel6" runat="server" Height="65px"
                            Width="330px">
                            <asp:ListBox ID="proj_produto_list_req_email" runat="server" Width="320px" 
                                DataSourceID="proj_produto_req_email" DataTextField="email" 
                                DataValueField="email">
                            </asp:ListBox>
                            <asp:SqlDataSource ID="proj_produto_req_email" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_proj_cli_email_req" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="proj_produto_drop_requisitante" 
                                        Name="id_cliente" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label148" runat="server" Text="lista de empresas para abordagem"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label110" runat="server" Text="RH da vaga"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label114" runat="server" Text="telefone"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label113" runat="server" Text="email"></asp:Label>
                        &nbsp;</td>
                    <td rowspan="5" colspan="2">
                        <asp:ListBox ID="proj_produto_listaconcorrentes" runat="server" 
                            DataSourceID="proj_produto_listconcorrentes" DataTextField="concorrente" 
                            DataValueField="id_concorrente" Height="180px" Width="310px"></asp:ListBox>
                        <asp:SqlDataSource ID="proj_produto_listconcorrentes" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_concorrentes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:DropDownList ID="proj_produto_drop_rh" runat="server" Height="20px" 
                            Width="221px" DataSourceID="proj_produto_rh" DataTextField="nome" 
                            DataValueField="id" AutoPostBack="True" AppendDataBoundItems="True" 
                            onselectedindexchanged="proj_produto_drop_rh_SelectedIndexChanged">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_produto_rh" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_rh" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="id_empresa" Name="id_empresa" 
                                    PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style2">
                        <asp:Panel ID="Panel5" runat="server" Height="65px"
                            Width="130px">
                            <asp:ListBox ID="proj_produto_text_rh_tel" runat="server" Width="120px" 
                                DataSourceID="proj_produto_rh_telefone" DataTextField="telefone" 
                                DataValueField="telefone">
                            </asp:ListBox>
                            <asp:SqlDataSource ID="proj_produto_rh_telefone" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_proj_cli_telefone_rh" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="proj_produto_drop_rh" Name="id_cliente" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                    <td class="style2">
                        <asp:Panel ID="Panel7" runat="server" Height="65px" 
                            Width="330px">
                            <asp:ListBox ID="proj_produto_list_rh_email" runat="server" Width="320px" 
                                DataSourceID="proj_produto_rh_email" DataTextField="email" 
                                DataValueField="email">
                            </asp:ListBox>
                            <asp:SqlDataSource ID="proj_produto_rh_email" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_proj_cli_email_rh" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="proj_produto_drop_rh" Name="id_cliente" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Button ID="Button39" runat="server" Height="20px" onclick="Button24_Click" 
                            Text="atualizar" ValidationGroup="valida_projeto_cadastro" Visible="False" 
                            Width="120px" />
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Button ID="produto_cadastrar" runat="server" Height="20px" onclick="Button23_Click" 
                            Text="cadastrar" Width="120px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="proj_produto_novo_cadastro" runat="server" Height="20px" 
                            onclick="Button31_Click" Text="novo cadastro" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
            </table>
            <asp:Panel ID="Panel13" runat="server" CssClass="modalPopup" 
                                style="overflow:auto">
                                <asp:GridView ID="grid_popup_empresa" runat="server" 
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id,nome"
                                    ForeColor="Black" GridLines="Vertical" PageSize="6" 
                                    onselectedindexchanged="grid_popup_empresa_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />                                        
                                        <asp:BoundField DataField="id" HeaderText="id" 
                                            SortExpression="id" />
                                        <asp:BoundField DataField="nome" HeaderText="nome" 
                                            SortExpression="nome" />
                                        <asp:BoundField DataField="razao_social" HeaderText="razao_social" 
                                            SortExpression="razao_social" />
                                        <asp:BoundField DataField="cidade" HeaderText="cidade" 
                                            SortExpression="cidade" />
                                        <asp:BoundField DataField="uf" HeaderText="uf" 
                                            SortExpression="uf" />
                                        <asp:BoundField DataField="qtd_proj_havik" HeaderText="qtd_proj_havik" 
                                            SortExpression="qtd_proj_havik" /> 
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                </asp:GridView>
                                <asp:Button ID="btnClose1" runat="server" Text="Fechar" Width="50px" />
                            </asp:Panel>
                            <asp:Button ID="btnShowModalPopup1" runat="server" style="display:none" />
                            <ajax:ModalPopupExtender ID="Panel13_ModalPopupExtender" runat="server" 
                                BackgroundCssClass="modalBackground" CancelControlID="btnClose1" 
                                DynamicServicePath="" Enabled="True" PopupControlID="Panel13" 
                                TargetControlID="btnShowModalPopup1"></ajax:ModalPopupExtender>
        </asp:View>
        <asp:View ID="proj_requisitos" runat="server">
            <br />
            <table class="style33">
                <tr>
                    <td class="style40">
                        <asp:Label ID="mensagem_proj_requisitos" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>                        
                        </td>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style2" colspan="2">
                        &nbsp;</td>
                    <td class="style34" colspan="2" align="right">
                        <asp:Label ID="Label139" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em requisitos"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style40">
                        <asp:Label ID="Label13" runat="server" Text="idiomas"></asp:Label>
                    </td>
                    <td class="style37">
                        <asp:Label ID="Label98" runat="server" Text="nível"></asp:Label>
                    </td>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label17" runat="server" Text="graduação"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="proj_radio_nvl_graduacao" 
                            ErrorMessage="selecione uma graduação e seu nível" 
                            ValidationGroup="validagraduacao"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style34">
                        <asp:Label ID="Label101" runat="server" Text="características escolhidas"></asp:Label>
                    </td>
                    <td class="style35">
                        <asp:Label ID="Label100" runat="server" Text="características"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style40">
                        <asp:DropDownList ID="proj_requisitos_dropidiomas" runat="server" Height="22px" 
                            Width="170px" DataSourceID="proj_requisitos_idioma" 
                            DataTextField="descricao" DataValueField="id" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_requisitos_idioma" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [descricao], [id] FROM [vw_proj_idiomas]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="proj_requisitos_nota" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_notas]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="style37">
                        <asp:DropDownList ID="proj_requisitos_dropnivel" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_requisitos_nota" 
                            DataTextField="descricao" DataValueField="id" Height="20px" Width="70px">
                            <asp:ListItem Value="0">Nota</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style29">
                    <script type="text/javascript" language="javascript">
                        function GetValueGraduacao(sender, e) {
                            $get("<%=id_graduacao.ClientID %>").value = e.get_value();
                        }
                        </script>
                        <asp:HiddenField ID="id_graduacao" runat="server"/>
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_requisitos_textgraduacao" runat="server" Width="180px" 
                            AutoComplete="off" Height="20px"></asp:TextBox>
                        <ajax:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" TargetControlID="proj_requisitos_textgraduacao" Enabled="true"
                            ServicePath="PWebService.asmx" ServiceMethod="GetCompletionListProjetoGraduacao" EnableCaching="true" UseContextKey="True" MinimumPrefixLength="2"
                            CompletionInterval="300" CompletionSetCount="5" ShowOnlyCurrentWordInCompletionListItem="true" OnClientItemSelected="GetValueGraduacao"></ajax:AutoCompleteExtender>
                        &nbsp;&nbsp;</td>
                    <td class="style31">
                        <asp:RadioButtonList ID="proj_radio_nvl_graduacao" runat="server" Width="99px" 
                            Height="50px">
                            <asp:ListItem Value="1">1ª Linha</asp:ListItem>
                            <asp:ListItem Value="2">2ª Linha</asp:ListItem>
                            <asp:ListItem Value="3">3ª Linha</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="style34" rowspan="3">
                        <script src="js/mascara.js" type=text/javascript></script>
                        <asp:ListBox ID="proj_oferta_listbeneficios" runat="server" 
                            DataSourceID="proj_oferta_listabeneficios" DataTextField="perfil" 
                            DataValueField="id_perfil" Height="102px" Width="145px"></asp:ListBox>
                    </td>
                    <td rowspan="5" class="style35">
                        <div ;="" style="position:relative; overflow:auto; height:180px; width:160px">
                            <asp:CheckBoxList ID="proj_oferta_checkboxlist_beneficios" runat="server" 
                                AutoPostBack="True" DataMember="DefaultView" datasourceid="havik_link3" 
                                DataTextField="descricao" DataValueField="id" Height="160px" 
                                RepeatLayout="Flow" Width="145px">
                            </asp:CheckBoxList>
                        </div>
                        <asp:SqlDataSource ID="havik_link3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_perfil]">
                        </asp:SqlDataSource>                        
                    </td>
                </tr>
                <tr>
                    <td class="style25" colspan="2">
                        <asp:Button ID="proj_requisitos_adicionar_idioma" runat="server" Height="20px" Text="adicionar" 
                            Width="120px" onclick="Button3_Click" />
                    </td>
                    <td class="style4" colspan="2">
                        <asp:Button ID="proj_requisitos_adiciona_graduacao" runat="server" Height="20px" Text="adicionar" 
                            Width="120px" onclick="Button4_Click" ValidationGroup="validagraduacao" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        </td>
                </tr>
                <tr>
                    <td class="style37" rowspan="4" colspan="2">
                        <asp:GridView ID="grid_idiomas" runat="server" AutoGenerateColumns="False"  
                            DataSourceID="proj_requisitos_grididiomas" Height="98px" Width="330px" 
                            AllowPaging="True" PageSize="4" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                            GridLines="Vertical" DataKeyNames="id" 
                            onselectedindexchanged="grid_idiomas_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" 
                                    SortExpression="id" InsertVisible="False" ReadOnly="True" 
                                    Visible="False" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" Visible="False" />
                                <asp:BoundField DataField="descricao" HeaderText="descricao" 
                                    SortExpression="descricao" />
                                <asp:BoundField DataField="nvl_idioma" HeaderText="nivel" 
                                    SortExpression="nvl_idioma" />
                                <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                    ReadOnly="True" SortExpression="dt_cadastro" />
                                <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                    SortExpression="nome_usuario" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#EEDD83" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="proj_requisitos_grididiomas" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_idiomas" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style2" rowspan="4" colspan="2">
                        <asp:GridView ID="grid_graduacao" runat="server" 
                            style="position:relative; Overflow:auto; top: 0px; left: 0px; width: 335px; height: 98px;" 
                            AutoGenerateColumns="False" DataSourceID="proj_requisitos_gridgraduacao" 
                            AllowPaging="True" PageSize="5" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                            GridLines="Vertical" 
                            onselectedindexchanged="grid_graduacao_SelectedIndexChanged" 
                            DataKeyNames="id">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" 
                                    SortExpression="id" InsertVisible="False" ReadOnly="True" 
                                    Visible="False" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" Visible="False" />
                                <asp:BoundField DataField="id_graduacao" HeaderText="id_graduacao" 
                                    SortExpression="id_graduacao" Visible="False" />
                                <asp:BoundField DataField="graduacao" HeaderText="graduacao" 
                                    SortExpression="graduacao" />
                                <asp:BoundField DataField="id_nvl_graduacao" HeaderText="id_nvl_graduacao" 
                                    SortExpression="id_nvl_graduacao" Visible="False" />
                                <asp:BoundField DataField="nivel_graduacao" HeaderText="nivel" 
                                    SortExpression="nivel_graduacao" />
                                <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                    ReadOnly="True" SortExpression="dt_cadastro" />
                                <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                    SortExpression="nome_usuario" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#EEDD83" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="proj_requisitos_gridgraduacao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_graduacao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style34">
                        <asp:Button ID="proj_requisitos_adiciona_caracteristica" runat="server" Height="20px" onclick="Button34_Click" 
                            Text="adicionar" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td class="style34">
                        <asp:Button ID="proj_requisitos_exclui_caracteristica" runat="server" Height="20px"
                            Text="excluir" Width="120px" onclick="Button35_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="style34" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        <asp:Label ID="Label125" runat="server" Text="intervalo salarial"></asp:Label>
                    </td>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label18" runat="server" Text="escolaridade*"></asp:Label>
                    </td>
                    <td class="style3" colspan="2">
                        <asp:Label ID="Label163" runat="server" Text="certificações/especializações"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style37">
                        <asp:TextBox ID="proj_requisitos_textsalario_ini" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="85px"></asp:TextBox>
                    </td>
                    <td class="style37">
                        <asp:TextBox ID="proj_requisitos_textsalario_fim" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="85px"></asp:TextBox>
                    </td>
                    <td class="style2" colspan="2">
                        <asp:DropDownList ID="proj_requisitos_dropescolaridade" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_requisitos_escolaridade" 
                            DataTextField="descricao" DataValueField="id" Height="22px" Width="170px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_requisitos_escolaridade" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_escolaridade]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="style3" colspan="2">
                        <asp:TextBox ID="proj_produto_textcurso" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="330px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style40">
                        <asp:Label ID="Label16" runat="server" Text="tamanho da equipe"></asp:Label>
                    </td>
                    <td class="style39">
                        <asp:Label ID="Label15" runat="server" Text="experiência (anos)"></asp:Label>
                    </td>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label19" runat="server" Text="superior imediato"></asp:Label>
                    </td>
                    <td class="style3" colspan="2">
                        <asp:Button ID="proj_requisitos_cadastrar_curso" runat="server" Height="20px"
                        Text="adicionar" Width="120px" 
                            onclick="proj_requisitos_cadastrar_curso_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="style40">
                        <asp:TextBox ID="proj_requisitos_texttamanhoequipe" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="65px"></asp:TextBox>
                    </td>
                    <td class="style39">
                        <asp:TextBox ID="proj_requisitos_textexperiencia" runat="server" 
                            onkeydown="return (event.keyCode!=13);" Width="65px"></asp:TextBox>
                    </td>
                    <td class="style2" colspan="2">
                        <asp:DropDownList ID="proj_requisitos_dropsuperiorimediato" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_requisitos_superiorimediato" 
                            DataTextField="descricao" DataValueField="id" Width="330px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_requisitos_superiorimediato" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_cargo]" 
                            onselecting="proj_requisitos_superiorimediato_Selecting">
                        </asp:SqlDataSource>
                    </td>
                    <td class="style3" colspan="2" rowspan="4">
                        <asp:Panel ID="Panel14" runat="server" Height="140px" style="overflow:auto" 
                            Width="320px">
                            <asp:GridView ID="proj_requisitos_certificacao" runat="server" 
                                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="id" 
                                ForeColor="Black" GridLines="Vertical"  
                                Width="330px" DataSourceID="proj_req_certificacao" 
                                onselectedindexchanged="proj_requisitos_certificacao_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />                                    
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                        SortExpression="id_projeto" Visible="False" />
                                    <asp:BoundField DataField="descricao" HeaderText="descricao" 
                                        SortExpression="descricao" />
                                    <asp:BoundField DataField="dt_criacao" HeaderText="dt_criacao" 
                                        SortExpression="dt_criacao" />
                                    <asp:BoundField DataField="usuario_criacao" HeaderText="usuario_criacao" 
                                        SortExpression="usuario_criacao" />
                                    <asp:BoundField DataField="exibir" HeaderText="exibir" SortExpression="exibir" 
                                        Visible="False" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#C7E2FF" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="proj_req_certificacao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_proj_certificacao" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style2" colspan="2">
                        <asp:SqlDataSource ID="proj_oferta_listabeneficios" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_perfil" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style2" colspan="2">
                        <asp:Button ID="proj_requisitos_cadastrar" runat="server" Height="20px" 
                            onclick="Button25_Click" Text="cadastrar" Width="120px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button26" runat="server" Height="20px" onclick="Button26_Click" 
                            Text="atualizar" Visible="False" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td class="style37">
                    
                        &nbsp;</td>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style2" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;<td class="style37">
                        
                            &nbsp;<td class="style2" colspan="2">                            
                                            
                        </td>
                        <td class="style3" colspan="2">
                            &nbsp;</td>
                    </td>
                    </tr>
            </table>
        </asp:View>
        <asp:View ID="proj_site" runat="server">
            <br />
            <table class="style1">
                <tr>
                    <td class="style2">
                        <asp:Label ID="mensagem_proj_site" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="style6" colspan="2" align="right">
                        <asp:Label ID="Label140" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em site"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label159" runat="server" Text="título*"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="style6" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_site_titulo" Width="660px" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="style6" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label23" runat="server" Text="descrição completa"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="style6" colspan="2">
                        <asp:Label ID="Label24" runat="server" Text="resumo da descrição"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:TextBox ID="proj_site_descricao" runat="server" Height="200px" 
                            Width="660px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style6" colspan="2">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_site_resumo" runat="server" Height="200px" Width="330px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Button ID="proj_site_adicionar" runat="server" Height="20px" Text="adicionar" 
                            Width="120px" onclick="Button7_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" Height="20px" Text="atualizar" 
                            Width="120px" onclick="Button6_Click" Visible="False" />
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="radio_mostrarnosite" 
                            ErrorMessage="indique se deseja mostrar no site" 
                            ValidationGroup="projeto_validasite"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="style6">
                        <asp:Label ID="Label25" runat="server" Text="mostrar no site"></asp:Label>
                        &nbsp; &nbsp; &nbsp;&nbsp;
                    </td>
                    <td class="style6">
                        <asp:RadioButtonList ID="radio_mostrarnosite" runat="server">
                            <asp:ListItem Value="1">Sim</asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">Não</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="proj_clientes" runat="server">
            <table class="style42">
                <tr>
                    <td colspan="3"><asp:Panel ID="Panel1" runat="server"  Height="25px" Width="507px"  style="overflow:auto">
                        <asp:GridView ID="retorno_projeto" runat="server" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                SortExpression="empresa">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="segmento" HeaderText="segmento" SortExpression="segmento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="area" HeaderText="area" 
                                SortExpression="area">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="subdivisao" HeaderText="subdivisao" 
                                SortExpression="subdivisao">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tipo_produto" HeaderText="tipo_produto" 
                                SortExpression="tipo_produto">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="responsavel_captacao" HeaderText="responsavel_captacao" SortExpression="responsavel_captacao">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="responsavel_entrega" HeaderText="responsavel_entrega" SortExpression="responsavel_entrega">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="colaborador_responsavel" HeaderText="colaborador_responsavel" SortExpression="colaborador_responsavel">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" SortExpression="dt_cadastro">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="usuario_criacao" HeaderText="usuario_criacao" SortExpression="usuario_criacao">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nome_cliente" HeaderText="nome_cliente" SortExpression="nome_cliente">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="email_fatura" HeaderText="email_fatura" 
                                SortExpression="email_fatura">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="particularidade" HeaderText="particularidade" SortExpression="particularidade">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="keyaccount" HeaderText="keyaccount" SortExpression="keyaccount">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sucesso" HeaderText="sucesso" SortExpression="sucesso">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="retainer" HeaderText="retainer" SortExpression="retainer">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="parcela_1" HeaderText="parcela_1" SortExpression="parcela_1">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="parcela_2" HeaderText="parcela_2" SortExpression="parcela_2">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="parcela_3" HeaderText="parcela_3" SortExpression="parcela_3">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>    
                            <asp:BoundField DataField="modo_pagamento" HeaderText="modo_pagamento" SortExpression="modo_pagamento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="vencimento" HeaderText="vencimento" SortExpression="vencimento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="fee" HeaderText="fee" SortExpression="fee">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="imposto" HeaderText="imposto" SortExpression="imposto">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="salario_ini" HeaderText="salario_ini" SortExpression="salario_ini">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="salario_fim" HeaderText="salario_fim" SortExpression="salario_fim">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>    
                            <asp:BoundField DataField="tp_contrato" HeaderText="tp_contrato" SortExpression="tp_contrato">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="tamanho_equipe" HeaderText="tamanho_equipe" SortExpression="tamanho_equipe">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="experiencia" HeaderText="experiencia" SortExpression="experiencia">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>    
                            <asp:BoundField DataField="escolaridade" HeaderText="escolaridade" SortExpression="escolaridade">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="superior_imediato" HeaderText="superior_imediato" SortExpression="superior_imediato">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="salario_mensal" HeaderText="salario_mensal" SortExpression="salario_mensal">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>     
                            <asp:BoundField DataField="bonus" HeaderText="bonus" SortExpression="bonus">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="total_cash" HeaderText="total_cash" SortExpression="total_cash">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="descricao_completa" HeaderText="descricao_completa" SortExpression="descricao_completa">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="resumo_descricao" HeaderText="resumo_descricao" SortExpression="resumo_descricao">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="mostrar_site" HeaderText="mostrar_site" SortExpression="mostrar_site">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" SortExpression="id_empresa">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>     
                            <asp:BoundField DataField="id_requisitante" HeaderText="id_requisitante" SortExpression="id_requisitante">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="id_rh" HeaderText="id_rh" SortExpression="id_rh">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="id_estado" HeaderText="id_estado" SortExpression="id_estado">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="id_cidade" HeaderText="id_cidade" SortExpression="id_cidade">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="proj_inicio" HeaderText="proj_inicio" SortExpression="proj_inicio">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="proj_fim" HeaderText="proj_fim" SortExpression="proj_fim">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="salario_1" HeaderText="salario_1" SortExpression="salario_1">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="salario_2" HeaderText="salario_2" SortExpression="salario_2">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dt_prev_shortlist" HeaderText="dt_prev_shortlist" SortExpression="dt_prev_shortlist">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="dt_ent_shortlist" HeaderText="dt_ent_shortlist" SortExpression="dt_ent_shortlist">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>     
                            <asp:BoundField DataField="dt_ini_busca" HeaderText="dt_ini_busca" SortExpression="dt_ini_busca">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="qtd_cand_shortlist" HeaderText="qtd_cand_shortlist" SortExpression="qtd_cand_shortlist">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="grau_dificuldade" HeaderText="grau_dificuldade" SortExpression="grau_dificuldade">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="cod_do_vagas" HeaderText="cod_do_vagas" SortExpression="cod_do_vagas">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>    
                            <asp:BoundField DataField="requisicao_vagas" HeaderText="requisicao_vagas" SortExpression="requisicao_vagas">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="equipe" HeaderText="equipe" SortExpression="equipe">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                        </Columns>
                        </asp:GridView>
                    </asp:Panel></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="mensagem_proj_clientes" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="right">
                        <asp:Label ID="Label141" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em cliente"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label117" runat="server" Text="status"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label116" runat="server" Text="substatus"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="label_proj_clientes" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 40px">
                    <asp:DropDownList ID="projeto_clientes_drop_status" runat="server" Height="20px" 
                                Width="330px" DataSourceID="proj_projeto_status" DataTextField="descricao" 
                                DataValueField="id" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlprojetostatus_SelectedIndexChanged" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Value="0" Selected="True">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_projeto_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_status]">
                            </asp:SqlDataSource></td>
                    <td>
                    <asp:DropDownList ID="projeto_clientes_drop_substatus" 
                            DataSourceID="proj_projeto_substatus" runat="server" Height="20px" 
                                Width="330px" DataTextField="substatus" DataValueField="id_substatus" 
                            AutoPostBack="True" AppendDataBoundItems="True">
                            <asp:ListItem Value="0" Selected="True">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_projeto_substatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"                                 
                                SelectCommand="sp_vw_cli_substatus" 
                            SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="projeto_clientes_drop_status" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>    
                             </asp:SqlDataSource></td>
                    <td>
                        <asp:Button ID="Button30" runat="server" Height="20px" 
                            Text="filtrar" Width="120px" onclick="Button30_Click" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                    <asp:Panel ID="Panel2" runat="server" Width="1020px" Height="220px" style="overflow:auto">
                        <asp:GridView ID="proj_clientes_grid_clientes" runat="server" 
                            DataSourceID="proj_clientes_gridclientes" AutoGenerateColumns="False"
                            onrowdatabound="proj_clientes_grid_clientes_RowDataBound" 
                            onselectedindexchanged="proj_clientes_grid_clientes_SelectedIndexChanged" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True" 
                            DataKeyNames="id_cliente,nome">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="dt_status" HeaderText="dt_status"  DataFormatString="{0:dd/MM/yyyy hh:mm}"
                                    SortExpression="dt_status" />
                                <asp:BoundField DataField="nome" HeaderText="nome" 
                                    SortExpression="nome" />
                                <asp:BoundField DataField="Idade" HeaderText="Idade" 
                                    SortExpression="Idade" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="salario" HeaderText="salario" 
                                    SortExpression="salario" />
                                <asp:BoundField DataField="cargo" HeaderText="cargo" 
                                    SortExpression="cargo" />
                                <asp:BoundField DataField="area" HeaderText="area" 
                                    SortExpression="area" />
                                <asp:BoundField DataField="subdivisao" HeaderText="subdivisao" 
                                    SortExpression="subdivisao" />
                                <asp:BoundField DataField="entrevista" 
                                    HeaderText="entrevista" SortExpression="entrevista" />
                                <asp:BoundField DataField="ingles" 
                                    HeaderText="ingles" SortExpression="ingles" />
                                <asp:BoundField DataField="usuario_status" HeaderText="usuario_status" 
                                    SortExpression="usuario_status" />
                                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                    SortExpression="id_cliente" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#EEDD83" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="proj_clientes_gridclientes" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_clientes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="String" />
                                <asp:ControlParameter ControlID="projeto_clientes_drop_status" Name="id_status" 
                                    PropertyName="SelectedValue" Type="String" DefaultValue="" />
                                <asp:ControlParameter ControlID="projeto_clientes_drop_substatus" 
                                    Name="id_substatus" PropertyName="SelectedValue" Type="String" 
                                    DefaultValue="" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
        </asp:View>
        <asp:View ID="proj_havik" runat="server">
            <br />
            <table class="style1">
            <tr>
            <td colspan = 2>
                <asp:Label ID="mensagem_proj_havik" runat="server" Font-Bold="True" 
                    ForeColor="Red"></asp:Label>
            </td>
                <td align="right" colspan="2">
                    <asp:Label ID="Label142" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                        Text="você está em status"></asp:Label>
                </td>
            </tr>
                <tr>
                    <td class="style21">
                        <asp:Label ID="Label26" runat="server" Text="status*"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="proj_havik_dropstatus" 
                            ErrorMessage="Selecionar um status antes de cadastrar" 
                            ValidationGroup="proj_havik_validastatus"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style6" colspan="3" rowspan="6">
                        <asp:GridView ID="proj_grid_status" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" DataKeyNames="id" 
                            DataSourceID="proj_status_substatus_grid" Width="675px" 
                            AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                            BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="obs" HeaderText="obs" SortExpression="obs" />
                                <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                    SortExpression="dt_cadastro" />
                                <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                    SortExpression="nome_usuario" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#EEDD83" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="proj_status_substatus_grid" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_status" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        <asp:DropDownList ID="proj_havik_dropstatus" runat="server" Height="20px" 
                                Width="330px" DataSourceID="proj_havik_status" DataTextField="descricao" 
                                DataValueField="id" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChanged" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_status]">
                            </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        <asp:Label ID="Label27" runat="server" Text="substatus"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        <asp:DropDownList ID="proj_havik_dropsubstatus" 
                            DataSourceID="proj_havik_substatus" runat="server" Height="20px" 
                                Width="330px" DataTextField="substatus" DataValueField="id_substatus">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_substatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"                                 
                                SelectCommand="sp_vw_proj_substatus"
                                OnSelecting="SqlDataSourceSubstatus_Selecting" 
                            SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="proj_havik_dropstatus" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>    
                             </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        <asp:Label ID="Label28" runat="server" Text="observações"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        <asp:TextBox ID="proj_havik_textobservacoes" runat="server" Height="120px" 
                            Width="330px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        <asp:Button ID="proj_havik_adicionar_status" runat="server" Height="20px" Text="adicionar" 
                            Width="120px" onclick="Button8_Click" 
                            ValidationGroup="proj_havik_validastatus" />
                    </td>
                    <td class="style6" colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="proj_observacoes" runat="server">
            <br />
            <table class="style1">
                <tr>
                    <td class="style21" colspan="2">
                        <asp:Label ID="mensagem_proj_observacoes" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                    <td align="right" class="style21" colspan="2">
                        <asp:Label ID="Label143" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em importante"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style21" colspan="4">
                        <asp:Label ID="Label88" runat="server" Text="observações anteriores"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="4">
                        <asp:GridView ID="proj_gridobs" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            DataKeyNames="obs" DataSourceID="proj_obs_gridobs" ForeColor="Black" 
                            GridLines="Vertical" onrowdatabound="proj_gridobs_RowDataBound" 
                            onselectedindexchanged="proj_gridobs_SelectedIndexChanged" PageSize="8" 
                            Width="1010px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" Visible="False" />
                                <asp:BoundField DataField="mini_obs" HeaderText="mini_obs" ReadOnly="True" 
                                    SortExpression="mini_obs" />
                                <asp:BoundField DataField="obs" HeaderText="obs" SortExpression="obs" 
                                    Visible="False" />
                                <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                    SortExpression="dt_cadastro" />
                                <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                    SortExpression="nome_usuario" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#EEDD83" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="proj_obs_gridobs" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_obs" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="4">
                        <asp:Label ID="Label129" runat="server" Text="observações"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="2" rowspan="5">
                        <asp:TextBox ID="proj_observacoes_textobservacoes" runat="server" 
                            Height="202px" TextMode="MultiLine" Width="710px"></asp:TextBox>
                    </td>
                    <td class="style14" colspan="2">
                        <asp:Label ID="Label158" runat="server" Text="inserir ou visualizar anexo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="2">
                        <asp:FileUpload ID="proj_upload_documento" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="2">
                        <asp:DropDownList ID="proj_importante_drop_tipo_doc" runat="server" 
                            Height="22px" Width="218px" AppendDataBoundItems="True" 
                            DataSourceID="proj_importante_tipo_anexo" DataTextField="descricao" 
                            DataValueField="id">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_importante_tipo_anexo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_anexos" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style14">
                        <asp:Button ID="proj_importante_salvar_doc" runat="server" Height="20px" 
                            style="margin-bottom: 0px" Text="salvar" 
                            ValidationGroup="valida_cadastro_cv" Width="120px" 
                            onclick="proj_importante_salvar_doc_Click" />
                    </td>
                    <td class="style14">
                        <asp:Button ID="proj_importante_abrir_doc" runat="server" Height="20px" 
                            style="margin-bottom: 0px" Text="abrir" Width="120px" 
                            onclick="proj_importante_abrir_doc_Click" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="2">
                        <asp:Panel ID="Panel10" runat="server" Height="140px" style="overflow:auto" 
                            Width="300px">
                            <asp:GridView ID="proj_profissional_grid_anexos" runat="server" 
                                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                DataSourceID="cli_profissional_anexos" ForeColor="Black" 
                                GridLines="Vertical" DataKeyNames="id" 
                                
                                onselectedindexchanged="proj_profissional_grid_anexos_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Abrir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" 
                                        InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="tipo_anexo" HeaderText="tipo_anexo" 
                                        SortExpression="tipo_anexo" />
                                    <asp:BoundField DataField="nome_arquivo" HeaderText="nome_arquivo" 
                                        SortExpression="nome_arquivo" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                    <asp:BoundField DataField="data_anexo" HeaderText="data_anexo" ReadOnly="True" 
                                        SortExpression="data_anexo" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </asp:Panel>
                        <asp:SqlDataSource ID="cli_profissional_anexos" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_carrega_anexos" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        <asp:Button ID="proj_observacoes_adicionar" runat="server" Height="20px" 
                            onclick="Button19_Click" Text="adicionar" Width="120px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button20" runat="server" Height="20px" 
                            onclick="Button20_Click" Text="limpar" Width="120px" />
                    </td>
                    <td class="style14" colspan="3">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="proj_financeiro" runat="server">
            <br />
            <table class="style1">
                <tr>
                    <td class="style6">
                        <asp:Label ID="mensagem_proj_financeiro" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                    <td class="style6" colspan="4">
                        &nbsp;</td>
                    <td align="right" colspan="4">
                        <asp:Label ID="Label144" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em financeiro"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label89" runat="server" Text="candidato"></asp:Label>
                    </td>
                    <td class="style6" colspan="2">
                        <asp:Label ID="Label81" runat="server" Text="ação*"></asp:Label>
                    </td>
                    <td class="style6" colspan="2">
                        <asp:Label ID="Label93" runat="server" Text="base faturamento*"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label164" runat="server" Text="salário final*"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label182" runat="server" Text="multi. salário*"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label177" runat="server" Text="fee (%)*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <script type="text/javascript" language="javascript">
                        function GetCode(sender, e) {
                            $get("<%=id_candidato.ClientID %>").value = e.get_value();
                        }
                        </script>

                        <asp:HiddenField ID="id_candidato" runat="server" />
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" 
                            ID="proj_financeiro_textcandidato" runat="server" Width="330px" Enabled="False"></asp:TextBox>
                        
                    </td>
                    <td class="style6" colspan="2">
                        <script src="js/mascara.js" type=text/javascript></script>
                        <asp:DropDownList ID="proj_financeiro_dropdacao" runat="server" 
                            AppendDataBoundItems="True" Height="22px" Width="170px" 
                            DataSourceID="proj_financeiro_acao" DataTextField="descricao" 
                            DataValueField="id" AutoPostBack="True" 
                            onselectedindexchanged="proj_financeiro_dropdacao_SelectedIndexChanged1">
                            <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_financeiro_acao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_acao]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="style6" colspan="2">
                        <asp:TextBox ID="proj_financeiro_textsalarioinicial" runat="server" 
                            AutoPostBack="True" onkeydown="return (event.keyCode!=13);" 
                            onkeyup="formataValor (this,event);" 
                            OnTextChanged="proj_financeiro_textsalarioinicial_TextChanged" Width="140px"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="proj_financeiro_textsalariofinal" runat="server" 
                            AutoPostBack="True" Enabled="False" onkeydown="return (event.keyCode!=13);" 
                            onkeyup="formataValor (this,event);" 
                            ontextchanged="proj_financeiro_textsalariofinal_TextChanged" Width="140px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="adm_text_multiplicador" runat="server" AutoPostBack="True" 
                            Height="20px" onkeydown="return (event.keyCode!=13);" 
                            onkeyup="formataDouble (this,event);" 
                            ontextchanged="adm_text_multiplicador_TextChanged" Width="50px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="adm_text_fee" runat="server" AutoPostBack="True" Height="20px" 
                            onkeydown="return (event.keyCode!=13);" 
                            ontextchanged="adm_text_fee_TextChanged" Width="50px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label90" runat="server" Text="email para envio da fatura"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="Label187" runat="server" Text="%*"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="Label188" runat="server" Text="impostos*"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="Label199" runat="server" Text="embutir*"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="Label198" runat="server" Text="vencimento"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label195" runat="server" Text="faturar"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label194" runat="server" Text="valor bruto"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label193" runat="server" Text="valor NET"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label192" runat="server" Text="total projeto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_financeiro_textemailfatura" runat="server" Width="330px"></asp:TextBox>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="adm_text_porcentagem" runat="server" AutoPostBack="True" 
                            Height="20px" onkeydown="return (event.keyCode!=13);" 
                            ontextchanged="adm_text_porcentagem_TextChanged" Width="50px"></asp:TextBox>
                        
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="proj_financeiro_dropimpostos" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="True" 
                            DataSourceID="proj_financeiro_impostos" DataTextField="descricao" 
                            DataValueField="id" Height="20px" 
                            onselectedindexchanged="proj_financeiro_dropimpostos_SelectedIndexChanged" 
                            Width="120px">
                            <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="proj_financeiro_dropembutirimposto" runat="server" 
                            AppendDataBoundItems="True" Height="18px" Width="56px" AutoPostBack="True" 
                            onselectedindexchanged="proj_financeiro_dropembutirimposto_SelectedIndexChanged">
                            <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            <asp:ListItem Value="1">sim</asp:ListItem>
                            <asp:ListItem Value="2">não</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="adm_text_vencimento" runat="server" Height="20px" 
                            onkeydown="return (event.keyCode!=13);" onkeyup="formataData (this,event);" 
                            Width="80px"></asp:TextBox>
                    </td>
                    <td>
                                          
                        <asp:DropDownList ID="proj_financeiro_dropfaturar" runat="server" 
                            AppendDataBoundItems="True" Height="18px" Width="56px">
                            <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            <asp:ListItem Value="1">sim</asp:ListItem>
                            <asp:ListItem Value="2">não</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="proj_financeiro_texts_fatura_impostos" runat="server" 
                            Enabled="False" onkeydown="return (event.keyCode!=13);" Width="80px"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:TextBox ID="proj_financeiro_text_valor_fatura" runat="server" 
                            Enabled="False" onkeydown="return (event.keyCode!=13);" Width="80px"></asp:TextBox>
                        
                    </td>
                    <td>
                        <asp:TextBox ID="proj_financeiro_textsegundaparcela" runat="server" 
                            Enabled="False" onkeydown="return (event.keyCode!=13);" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label91" runat="server" Text="particularidades na negociação"></asp:Label>
                    </td>
                    <td class="style28" colspan="4">
                        <asp:Button ID="proj_financeiro_cadastrar1" runat="server" Height="20px" 
                            onclick="Button27_Click" Text="cadastrar" Width="110px" />
                        &nbsp;<asp:Button ID="proj_financeiro_novo_cadastro" runat="server" 
                            Height="20px" onclick="proj_financeiro_novo_cadastro_Click" 
                            Text="novo cadastro" Width="110px" />
                        &nbsp;<asp:Button ID="proj_financeiro_cancelar_acao" runat="server" Height="20px" 
                            onclick="proj_financeiro_cancelar_acao_Click" Text="cancelar ação" 
                            Width="110px" />
                    </td>
                    <td colspan="4">
                        
                    </td>
                </tr>
                <tr>
                    <td class="style6" rowspan="9">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_financeiro_textparticularidades" runat="server" 
                            Height="240px" Width="330px" TextMode="MultiLine"></asp:TextBox>
                        <asp:HiddenField ID="proj_fin_id_linha" runat="server" />
                        <asp:HiddenField ID="proj_fin_id_faturar" runat="server" />
                        <asp:HiddenField ID="proj_fin_ativo" runat="server" Value="1" />
                    </td>
                    <td class="style28" colspan="2">
                        
                        <asp:Label ID="Label196" runat="server" Text="despesas"></asp:Label>
                        
                    </td>
                    <td class="style28" colspan="2">                    
                        <script src="js/mascara.js" type=text/javascript></script>
                        <asp:Label ID="Label197" runat="server" Text="valor"></asp:Label>
                    </td>
                    <td colspan="4" rowspan="2">
                        <asp:HiddenField ID="proj_fin_verificar" runat="server" />
                        <asp:HiddenField ID="proj_fin_aliquota" runat="server" />
                        <asp:HiddenField ID="proj_fin_aliquota_net" runat="server" />
                        <asp:HiddenField ID="proj_fin_fee_valor" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style28" colspan="2">
                        <asp:DropDownList ID="proj_financeiro_dropdespesas" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="proj_financeiro_despesas" 
                            DataTextField="descricao" DataValueField="id" Height="22px" Width="170px">
                            <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="proj_financeiro_despesas" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_tp_despesas]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="style28" colspan="2">
                        <asp:TextBox ID="proj_financeiro_textvalor" runat="server" 
                            onkeydown="return (event.keyCode!=13);" onkeyup="formataValor (this,event);" 
                            Width="95px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        <asp:Button ID="proj_financeiro_adicionar_despesa" runat="server" Height="20px" 
                            onclick="Button21_Click" Text="adicionar" Width="120px" />
                    </td>
                    <td class="style6" colspan="2">
                        &nbsp;</td>
                    <td colspan="4">
                        <asp:SqlDataSource ID="proj_financeiro_impostos" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_proj_impostos]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="4">
                        <script src="js/mascara.js" type="text/javascript"></script>
                        <asp:Panel ID="Panel8" runat="server" Height="115px" style="overflow:auto" 
                            Width="320px">
                            <asp:GridView ID="proj_financeiro_griddespesas" runat="server" 
                                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="id" DataSourceID="proj_fin_griddespesas" 
                                ForeColor="Black" GridLines="Vertical" 
                                onselectedindexchanged="proj_financeiro_griddespesas_SelectedIndexChanged" 
                                Width="330px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="id" Visible="False" />
                                    <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                        SortExpression="id_projeto" Visible="False" />
                                    <asp:BoundField DataField="id_despesa" HeaderText="id_despesa" 
                                        SortExpression="id_despesa" Visible="False" />
                                    <asp:BoundField DataField="descricao" HeaderText="descricao" 
                                        SortExpression="descricao" />
                                    <asp:BoundField DataField="vl_despesa" DataFormatString="{0:C2}" 
                                        HeaderText="valor" SortExpression="vl_despesa" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="usuario" 
                                        SortExpression="nome_usuario" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        ReadOnly="True" SortExpression="dt_cadastro" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#EEDD83" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </asp:Panel>
                        <asp:SqlDataSource ID="proj_fin_griddespesas" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_fin_despesas" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6" colspan="4">
                        &nbsp;</td>
                    <td colspan="4">
                        <asp:Button ID="emp_financeiro_cadastra_imposto" runat="server" Height="20px" 
                            onclick="Button21_Click" Text="incluir" Width="120px" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="4">
                        
                    </td>
                    <td colspan="4">
                        <asp:Label ID="Label165" runat="server" Text="lista de impostos" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        
                        &nbsp;</td>
                    <td class="style6" colspan="2">
                        &nbsp;</td>
                    <td rowspan="3" colspan="4">
                        <asp:ListBox ID="proj_financeiro_listimpostos" runat="server" Height="80px" 
                            Width="330px" Visible="False"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        &nbsp;</td>
                    <td class="style6" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6" colspan="4">
                        
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label171" runat="server" Text="informações da ação/nota"></asp:Label>
                    </td>
                    <td class="style6" colspan="4">
                        
                        &nbsp;</td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6" colspan="9">
                    <asp:Panel ID="Panel9" runat="server" Height="300px" style="overflow: auto" 
                            Width="1000px">
                        <asp:GridView ID="proj_fin_grid_financeiro" runat="server" BackColor="White" 
                            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" 
                            DataSourceID="proj_fin_financeiro" AllowSorting="True" 
                            DataKeyNames="id,id1,acao,produto,dt_registro_acao,status_financeiro,usuario_status,dt_status_fin,status_nota,empresa,projeto,equipe,resp_captacao,resp_entrega,colaborador_resp,fee,imposto,valor_nota,particularidades,qtd_salarios,id_candidato,candidato,base_faturamento,valor_fatura,valor_fat_imposto,salario_final,modo_pagamento,data_vencimento,email_contato,numero_vagas,requisicao_vagas,qtd_parcelas,id_faturar,faturar,ativo,percentual,id_impostos,embutir,mult_salario" 
                            onselectedindexchanged="proj_fin_grid_financeiro_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" 
                                    InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="id1" HeaderText="id1" SortExpression="id1" 
                                    InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="acao" HeaderText="acao" 
                                    SortExpression="acao" />
                                <asp:BoundField DataField="produto" HeaderText="produto" 
                                    SortExpression="produto" />
                                <asp:BoundField DataField="dt_registro_acao" HeaderText="dt_registro_acao" 
                                    SortExpression="dt_registro_acao" />
                                <asp:BoundField DataField="status_financeiro" HeaderText="status_financeiro" 
                                    SortExpression="status_financeiro" />
                                <asp:BoundField DataField="usuario_status" HeaderText="usuario_status" 
                                    SortExpression="usuario_status" />
                                <asp:BoundField DataField="dt_status_fin" HeaderText="dt_status_fin" 
                                    SortExpression="dt_status_fin" />
                                <asp:BoundField DataField="status_nota" HeaderText="status_nota" 
                                    SortExpression="status_nota" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="equipe" HeaderText="equipe" 
                                    SortExpression="equipe" />
                                <asp:BoundField DataField="resp_captacao" HeaderText="resp_captacao" 
                                    SortExpression="resp_captacao" />
                                <asp:BoundField DataField="resp_entrega" HeaderText="resp_entrega" 
                                    SortExpression="resp_entrega" />
                                <asp:BoundField DataField="colaborador_resp" HeaderText="colaborador_resp" 
                                    SortExpression="colaborador_resp" />
                                <asp:BoundField DataField="fee" HeaderText="fee" 
                                    SortExpression="fee" />
                                <asp:BoundField DataField="imposto" HeaderText="imposto" 
                                    SortExpression="imposto" />
                                <asp:BoundField DataField="valor_nota" HeaderText="valor_nota" 
                                    SortExpression="valor_nota" />
                                <asp:BoundField DataField="particularidades" HeaderText="particularidades" 
                                    SortExpression="particularidades" />
                                <asp:BoundField DataField="qtd_salarios" HeaderText="qtd_salarios" 
                                    SortExpression="qtd_salarios" />
                                <asp:BoundField DataField="id_candidato" HeaderText="id_candidato" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_candidato" />
                                <asp:BoundField DataField="candidato" HeaderText="candidato" 
                                    SortExpression="candidato" />
                                <asp:BoundField DataField="base_faturamento" HeaderText="base_faturamento" 
                                    SortExpression="base_faturamento" />
                                <asp:BoundField DataField="valor_fatura" HeaderText="valor_fatura" 
                                    SortExpression="valor_fatura" />
                                <asp:BoundField DataField="valor_fat_imposto" HeaderText="valor_fat_imposto" 
                                    SortExpression="valor_fat_imposto" />
                                <asp:BoundField DataField="salario_final" HeaderText="salario_final" 
                                    SortExpression="salario_final" />
                                <asp:BoundField DataField="modo_pagamento" HeaderText="modo_pagamento" 
                                    SortExpression="modo_pagamento" />
                                <asp:BoundField DataField="data_vencimento" HeaderText="data_vencimento" 
                                    SortExpression="data_vencimento" />
                                <asp:BoundField DataField="email_contato" HeaderText="email_contato" 
                                    SortExpression="email_contato" />
                                <asp:BoundField DataField="numero_vagas" HeaderText="numero_vagas" 
                                    SortExpression="numero_vagas" />
                                <asp:BoundField DataField="requisicao_vagas" HeaderText="requisicao_vagas" 
                                    SortExpression="requisicao_vagas" />
                                <asp:BoundField DataField="qtd_parcelas" HeaderText="qtd_parcelas" 
                                    SortExpression="qtd_parcelas" />
                                <asp:BoundField DataField="id_faturar" HeaderText="id_faturar" 
                                    SortExpression="id_faturar" />
                                <asp:BoundField DataField="faturar" HeaderText="faturar" ReadOnly="True" 
                                    SortExpression="faturar" />
                                <asp:BoundField DataField="ativo" HeaderText="ativo" SortExpression="ativo" />
                                <asp:BoundField DataField="percentual" HeaderText="percentual" 
                                    SortExpression="percentual" />
                                <asp:BoundField DataField="id_impostos" HeaderText="id_impostos" 
                                    SortExpression="id_impostos" />
                                <asp:BoundField DataField="embutir" HeaderText="embutir" 
                                    SortExpression="embutir" />
                                <asp:BoundField DataField="mult_salario" HeaderText="mult_salario" 
                                    SortExpression="mult_salario" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        </asp:Panel>
                        <asp:SqlDataSource ID="proj_fin_financeiro" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_acoes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style6" colspan="4">
                        &nbsp;</td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        
                        &nbsp;</td>
                    <td class="style6" colspan="4">
                    </td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style6" colspan="4">
                        &nbsp;</td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style6" colspan="4">
                        <asp:Panel ID="Panel3" runat="server" Height="65px" style="overflow: auto" 
                            Width="130px">
                            <asp:GridView ID="proj_financeiro_grid_financeiro" runat="server" 
                                Visible="False">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                        SortExpression="id_empresa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="keyaccount" HeaderText="keyaccount" 
                                        SortExpression="keyaccount">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="sucesso" HeaderText="sucesso" 
                                        SortExpression="sucesso">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="retainer" HeaderText="retainer" 
                                        SortExpression="retainer">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="parcela_1" HeaderText="parcela_1" 
                                        SortExpression="parcela_1">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="parcela_2" HeaderText="parcela_2" 
                                        SortExpression="parcela_2">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="parcela_3" HeaderText="parcela_3" 
                                        SortExpression="parcela_3">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="modo_pagamento" HeaderText="modo_pagamento" 
                                        SortExpression="modo_pagamento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="vencimento" HeaderText="vencimento" 
                                        SortExpression="vencimento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dt_alteracao" HeaderText="dt_alteracao" 
                                        SortExpression="dt_alteracao">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="usuario_alteracao" HeaderText="usuario_alteracao" 
                                        SortExpression="usuario_alteracao">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style6" colspan="4">
                        &nbsp;</td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style6" colspan="4">
                        &nbsp;</td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="projeto_relatorio" runat="server">
            <table class="style42">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td align="right">
                        <asp:Label ID="Label145" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em relatório"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:GridView ID="proj_relatorio_grid_relatorio" runat="server" 
                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" DataSourceID="proj_relatorio_gridrelatorio" ForeColor="Black" 
                            GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="rank" HeaderText="rank" SortExpression="rank" 
                                    Visible="False" />
                                <asp:BoundField DataField="qtd_cliente" HeaderText="qtd_cliente" 
                                    ReadOnly="True" SortExpression="qtd_cliente" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="proj_relatorio_gridrelatorio" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_relatorio" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="proj_oferta" runat="server">
            <table class="style42">
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2" align="right">
                        <asp:Label ID="Label146" runat="server" Font-Bold="True" ForeColor="#FFCC00" 
                            Text="você está em oferta"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="mensagem_proj_oferta" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label132" runat="server" Text="salário mensal"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label133" runat="server" Text="modelo de contrato"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label130" runat="server" Text="lista de benefícios"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label131" runat="server" Text="benefícios da oferta"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_requisitos_textsalario" runat="server" 
                            onkeyup="formataValor (this,event);" style="text-align:left;" Width="155px"></asp:TextBox>
                    </td>
                    <td rowspan="4">
                        <asp:RadioButtonList ID="proj_requisitos_modelocontrato" runat="server">
                            <asp:ListItem Value="1">CLT</asp:ListItem>
                            <asp:ListItem Value="2">PJ</asp:ListItem>
                            <asp:ListItem Value="3">CLT Flex</asp:ListItem>
                            <asp:ListItem Value="4">Sócio</asp:ListItem>
                            <asp:ListItem Selected="True" Value="5">À definir</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td rowspan="4" style="margin-left: 40px">
                        <asp:ListBox ID="proj_requisitos_listbeneficios" runat="server" 
                            DataSourceID="proj_requisitos_listabeneficios" DataTextField="beneficios" 
                            DataValueField="id_beneficios" Height="102px" Width="145px"></asp:ListBox>
                    </td>
                    <td rowspan="6">
                        
                        <div ;="" style="position:relative; overflow:auto; height:180px; width:160px">
                            <asp:CheckBoxList ID="proj_requisitos_checkboxlist_beneficios" runat="server" 
                                AutoPostBack="True" DataMember="DefaultView" DataSourceID="havik_link2" 
                                DataTextField="descricao" DataValueField="id" Height="160px" 
                                RepeatLayout="Flow" Width="145px">
                            </asp:CheckBoxList>
                        </div>
                        <asp:SqlDataSource ID="havik_link2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="SELECT [id], [descricao] FROM [vw_beneficios]">
                        </asp:SqlDataSource>
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label134" runat="server" Text="bônus (qtde salários)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_requisitos_textbonus" runat="server" Width="65px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label135" runat="server" Text="total cash"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="proj_requisitos_totalcash" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="proj_oferta_cadastra_beneficio" runat="server" Height="20px" onclick="Button5_Click" 
                            Text="adicionar" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="proj_oferta_exclui_beneficio" runat="server" Height="20px" onclick="Button29_Click" 
                            Text="excluir" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <asp:Button ID="proj_oferta_cadastrar" runat="server" Height="20px" onclick="Button32_Click" 
                            Text="cadastrar" Width="120px" />
                        
                    </td>
                    <td>
                        <asp:Button ID="Button33" runat="server" Height="20px" onclick="Button33_Click" 
                            Text="atualizar" Width="120px" Visible="False" />
                    </td>
                    <td colspan="2">
                        <asp:SqlDataSource ID="proj_requisitos_listabeneficios" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_proj_beneficios" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    </body>
    </asp:Content>
