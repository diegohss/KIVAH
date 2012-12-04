<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Busca.aspx.cs" Inherits="HavikTeste.Busca" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<script runat="server">

    protected void menuBusca_MenuItemClick(object sender, MenuEventArgs e)
    {
        int index = Int32.Parse(e.Item.Value);
        MultiView1.ActiveViewIndex = index;
    }
</script>
<asp:Content ID="BuscaMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="title" style="overflow:auto">
        <asp:Panel ID="Panel1" runat="server" Height=230px>
                    <asp:GridView ID="grid_proj_busca_e" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="grid_proj_busca_e_SelectedIndexChanged">
                            <Columns>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                        SortExpression="id_projeto">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Projeto" HeaderText="Projeto" 
                                        SortExpression="Projeto">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                        SortExpression="id_empresa" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Empresa" HeaderText="Empresa" 
                                        SortExpression="Empresa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_tipo_produto" HeaderText="id_tipo_produto" 
                                        SortExpression="id_tipo_produto" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="produto" HeaderText="produto" 
                                        SortExpression="produto">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_segmento" HeaderText="id_segmento" 
                                        SortExpression="id_segmento" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="segmento" HeaderText="segmento" 
                                        SortExpression="segmento">
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
                                    <asp:BoundField DataField="subdivisao" HeaderText="subdivisao" 
                                        SortExpression="subdivisao">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_responsavel_entrega" 
                                        HeaderText="id_responsavel_entrega" SortExpression="id_responsavel_entrega" 
                                        Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="responsavel_entrega" 
                                        HeaderText="responsavel_entrega" SortExpression="responsavel_entrega">
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
                                    <asp:BoundField DataField="colaborador_responsavel" 
                                        HeaderText="colaborador_responsavel" SortExpression="colaborador_responsavel">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dt_ini" HeaderText="dt_ini" SortExpression="dt_ini">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dt_fim" HeaderText="dt_fim" SortExpression="dt_fim">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="salario" HeaderText="salario" 
                                        SortExpression="salario">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                                        SortExpression="ultimo_status">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                                        SortExpression="ultimo_substatus">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_rh" HeaderText="id_rh" SortExpression="id_rh" 
                                        Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Responsavel_Empresa_RH" 
                                        HeaderText="Responsavel_Empresa_RH" SortExpression="Responsavel_Empresa_RH">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_requisitante" HeaderText="id_requisitante" 
                                        SortExpression="id_requisitante" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Responsavel_Empresa_Requisitante" 
                                        HeaderText="Responsavel_Empresa_Requisitante" 
                                        SortExpression="Responsavel_Empresa_Requisitante">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>   
                            
                            <asp:GridView ID="grid_cli_busca_e" runat="server" AutoGenerateColumns="False" 
                                PageSize="5" 
                        onselectedindexchanged="grid_cli_busca_e_SelectedIndexChanged" 
                        DataKeyNames="id_cliente,hexa">
                                <Columns>                                
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cli_check_all" OnCheckedChanged="cli_check_all_CheckChanged" runat="server" AutoPostBack="True" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cli_check" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />                                    
                                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Idade" HeaderText="Idade" 
                                        SortExpression="Idade">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                        SortExpression="id_empresa" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultima_Empresa" HeaderText="Ultima_Empresa" SortExpression="Ultima_Empresa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="filial" HeaderText="filial" SortExpression="filial">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Qtd_Projetos_Participou" HeaderText="Qtd_Projetos_Participou" 
                                        SortExpression="Qtd_Projetos_Participou">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_area" HeaderText="id_area" 
                                        SortExpression="id_area" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultima_Area" HeaderText="Ultima_Area" 
                                        SortExpression="Ultima_Area">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_subdivisao" HeaderText="id_subdivisao" 
                                        SortExpression="id_subdivisao" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultima_Subdivisao" HeaderText="Ultima_Subdivisao" 
                                        SortExpression="Ultima_Subdivisao">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_segmento" HeaderText="id_segmento" 
                                        SortExpression="id_segmento" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultimo_Segmento" HeaderText="Ultimo_Segmento" SortExpression="Ultimo_Segmento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>    
                                    <asp:BoundField DataField="id_cargo" HeaderText="id_cargo" 
                                        SortExpression="id_cargo" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultimo_Cargo" HeaderText="Ultimo_Cargo" SortExpression="Ultimo_Cargo">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="salario" HeaderText="salario" SortExpression="salario">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_cidade" HeaderText="id_cidade" 
                                        SortExpression="id_cidade" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Cidade" HeaderText="Cidade" 
                                        SortExpression="Cidade">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>      
                                    <asp:BoundField DataField="id_graduacao" HeaderText="id_graduacao" 
                                        SortExpression="id_graduacao" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultima_Graduacao" HeaderText="Ultima_Graduacao" 
                                        SortExpression="Ultima_Graduacao">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField> 
                                    <asp:BoundField DataField="id_idioma" HeaderText="id_idioma" 
                                        SortExpression="id_idioma" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultimo_Idioma" HeaderText="Ultimo_Idioma" 
                                        SortExpression="Ultimo_Idioma">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Nivel_Idioma" HeaderText="Nivel_Idioma" 
                                        SortExpression="Nivel_Idioma">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>                                    
                                    <asp:BoundField DataField="Media_Potencial" HeaderText="Media_Potencial" 
                                        SortExpression="Media_Potencial">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cicatriz" HeaderText="cicatriz" 
                                        SortExpression="cicatriz">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="hexa" HeaderText="hexa" 
                                        SortExpression="hexa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>                             
                                    <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                        SortExpression="id_cliente">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>    
                                </Columns>
                            </asp:GridView>   
                            
                            <asp:GridView ID="grid_emp_busca_e" runat="server" AutoGenerateColumns=false 
                                onselectedindexchanged="grid_emp_busca_e_SelectedIndexChanged">
                            <Columns>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" SortExpression="id_empresa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_segmento" HeaderText="id_segmento" SortExpression="id_segmento" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="segmento" HeaderText="segmento" SortExpression="segmento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_cidade" HeaderText="id_cidade" SortExpression="id_cidade" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cidade" HeaderText="cidade" SortExpression="cidade">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cod_pais" HeaderText="cod_pais" SortExpression="cod_pais">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ddd" HeaderText="ddd" SortExpression="ddd">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="telefone" HeaderText="telefone" SortExpression="telefone">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Qtd_Projetos_Ativos" HeaderText="Qtd_Projetos_Ativos" SortExpression="Qtd_Projetos_Ativos">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Qtd_Projetos" HeaderText="Qtd_Projetos" SortExpression="Qtd_Projetos">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="offlimits" HeaderText="offlimits" SortExpression="offlimits">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="site" HeaderText="site" SortExpression="site">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="keyaccount" HeaderText="keyaccount" SortExpression="keyaccount">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>                                    
                                </Columns>
                            </asp:GridView>  
        </asp:Panel>
    </div>
    <div class="clear">
    <asp:Menu ID="menuBusca" runat="server" CssClass="menuEmpresa" OnMenuItemClick="menuBusca_MenuItemClick"
        IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" BorderWidth="1px" Width="100%">
        <Items>
            <asp:MenuItem Text="cliente" Value="2"></asp:MenuItem>             
            <asp:MenuItem Text="projeto" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="empresa" Value="0"></asp:MenuItem>                       
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
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="2">
            <asp:View ID="busca_emp" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="rowcount_empresa" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style2" rowspan="2">
                            &nbsp;</td>
                        <td class="style2" rowspan="2">
                            <asp:RadioButtonList ID="busca_emp_radio_tipobusca" runat="server">
                                <asp:ListItem Selected="True" Value="1">Busca E</asp:ListItem>
                                <asp:ListItem Value="2">Busca OU</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="style2" rowspan="2">
                            <asp:Button ID="busca_empresa1" runat="server" Height="20px" 
                                Text="buscar" Width="120px" onclick="Button50_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="mensagem_busca_emp" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="nome empresa"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" Text="endereço"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label168" runat="server" Text="nome filial"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_emp_textnome" runat="server" Width="330px" AutoComplete="off"></asp:TextBox>
                            <ajax:AutoCompleteExtender ID="AutoCompleteExtender4" runat="server" TargetControlID="busca_emp_textnome" Enabled="true"
                            ServicePath="PWebService.asmx" ServiceMethod="GetCompletionList" EnableCaching="true" UseContextKey="True" MinimumPrefixLength="2"
                            CompletionInterval="300" CompletionSetCount="5" ShowOnlyCurrentWordInCompletionListItem="true" >
                            </ajax:AutoCompleteExtender>
                        </td>
                        <td class="style2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_emp_textendereco" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_emp_textnomefilial" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label4" runat="server" Text="nome contato"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label178" runat="server" Text="estado"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label169" runat="server" Text="endereço filial"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_emp_textnomecontato" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropestado" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="Emp_estado" DataTextField="ufsigla" 
                                DataValueField="ufcod" Height="20px" Width="150px" 
                                onselectedindexchanged="busca_emp_dropestado_SelectedIndexChanged" 
                                AutoPostBack="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_estado" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [ufcod], [ufsigla], [nome] FROM [vw_emp_estados]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_emp_textenderecofilial" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label167" runat="server" Text="telefone"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label179" runat="server" Text="cidade"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label170" runat="server" Text="estado filial"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label210" runat="server" Text="cidade filial"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_emp_texttelefone" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style2">
                            
                            <asp:DropDownList ID="busca_emp_dropcidade" runat="server" DataSourceID="emp_dropcidade" 
                                DataTextField="munnome" DataValueField="muncod" Height="23px" 
                                Width="200px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_dropcidade" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_busca_cli_cidade" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_emp_dropestado" Name="ufcod" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </td>
                        <td>
                            <asp:DropDownList ID="busca_emp_dropestado_filial" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Emp_estado_filial" 
                                DataTextField="ufsigla" DataValueField="ufcod" Height="20px" 
                                onselectedindexchanged="busca_emp_dropestado_SelectedIndexChanged" 
                                Width="121px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_estado_filial" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [ufcod], [ufsigla], [nome] FROM [vw_emp_estados]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:DropDownList ID="busca_emp_dropcidade_filial" runat="server" 
                                DataSourceID="emp_dropcidade_filial" DataTextField="munnome" DataValueField="muncod" 
                                Height="23px" Width="190px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_dropcidade_filial" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_busca_cli_cidade" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_emp_dropestado" Name="ufcod" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label173" runat="server" Text="origem"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label172" runat="server" Text="país"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label12" runat="server" Text="faturamento"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_droporigem" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="Emp_pais" DataTextField="nome" 
                                DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_droppais" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="Emp_pais" DataTextField="nome" 
                                DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_pais" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome] FROM [vw_emp_paises]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_emp_dropfaturamento" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="emp_faturamento" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_faturamento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_faturamento]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label174" runat="server" Text="numero de funcionários"></asp:Label>
                        </td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropnrodefuncionarios" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="emp_mercado_funcionários" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Ecolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_mercado_funcionários" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_funcionarios]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label11" runat="server" Text="status"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label160" runat="server" Text="status2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label161" runat="server" Text="status3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropstatus" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="busca_emp_havik_status" DataTextField="descricao" 
                                DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedemp" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_emp_havik_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_status]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropstatus2" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="busca_emp_havik_status2" DataTextField="descricao" 
                                DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedemp2" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_emp_havik_status2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_status]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_emp_dropstatus3" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="busca_emp_havik_status3" DataTextField="descricao" 
                                DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedemp3" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_emp_havik_status3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_status]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label175" runat="server" Text="substatus"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label162" runat="server" Text="substatus2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label163" runat="server" Text="substatus3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropsubstatus" runat="server" 
                                AutoPostBack="True" DataSourceID="busca_emp_substatus" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_emp_substatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubstatus_Selectingemp" 
                                SelectCommand="sp_vw_busca_emp_substatus" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_emp_dropstatus" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropsubstatus2" runat="server" 
                                AutoPostBack="True" DataSourceID="busca_emp_substatus2" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_emp_substatus2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubstatus_Selectingemp2" 
                                SelectCommand="sp_vw_busca_emp_substatus" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_emp_dropstatus2" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_emp_dropsubstatus3" runat="server" 
                                AutoPostBack="True" DataSourceID="busca_emp_substatus3" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_emp_substatus3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"                                SelectCommand="sp_vw_busca_emp_substatus" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_dropstatus3" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label176" runat="server" Text="segmento"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label177" runat="server" Text="segmento2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label165" runat="server" Text="segmento3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropsegmento" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="Emp_segmento" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_segmento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_segmento]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="busca_emp_dropsegmento2" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="Emp_segmento2" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_segmento2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_segmento]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_emp_dropsegmento3" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="Emp_segmento3" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_segmento3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_segmento]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            <asp:Button ID="busca_empresa2" runat="server" Height="20px" onclick="Button48_Click" 
                                Text="buscar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                        </td>
                        <td class="style5">
                        </td>
                        <td class="style6" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="4">
                            
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="busca_proj" runat="server">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style2" colspan="4">
                            <asp:Label ID="rowcount_proj" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style2" rowspan="2">
                            <asp:RadioButtonList ID="busca_proj_radio_tipobusca" runat="server">
                                <asp:ListItem Selected="True" Value="1">Busca E</asp:ListItem>
                                <asp:ListItem Value="2">Busca OU</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="style2" rowspan="2">
                            <asp:Button ID="busca_projeto1" runat="server" Height="20px" onclick="Button47_Click" 
                                Text="buscar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="4">
                            <asp:Label ID="mensagem_busca_proj" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label17" runat="server" Text="nome projeto"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label208" runat="server" Text="situação projeto"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label150" runat="server" Text="empresa"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_proj_textnome" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style2" colspan="2">
                            
                            <asp:DropDownList ID="busca_proj_drop_projetos" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="false" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                                <asp:ListItem Value="1">Projetos abertos</asp:ListItem>
                                <asp:ListItem Value="2">Projetos fechados</asp:ListItem>
                            </asp:DropDownList>
                            
                        </td>
                        <td colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_proj_empresa" runat="server" AutoComplete="off" 
                                style="margin-bottom: 0px" Width="330px"></asp:TextBox>
                            <ajax:AutoCompleteExtender ID="busca_proj_empresa_AutoCompleteExtender" 
                                runat="server" CompletionInterval="300" CompletionSetCount="5" 
                                EnableCaching="true" Enabled="true" MinimumPrefixLength="2" 
                                ServiceMethod="GetCompletionList" ServicePath="PWebService.asmx" 
                                ShowOnlyCurrentWordInCompletionListItem="true" 
                                TargetControlID="busca_proj_empresa" UseContextKey="True">
                            </ajax:AutoCompleteExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label180" runat="server" Text="área"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label146" runat="server" Text="área2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label184" runat="server" Text="área3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_droparea" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="busca_proj_area" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlarea_SelectedIndexChangedproj" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_proj_area" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceArea_Selectingproj" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                                <SelectParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_droparea2" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="busca_proj_area2" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlarea_SelectedIndexChangedproj2" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_proj_area2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceArea_Selectingproj2" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                                <SelectParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_proj_droparea3" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="busca_proj_area3" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlarea_SelectedIndexChangedproj3" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_proj_area3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceArea_Selectingproj3" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                                <SelectParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label26" runat="server" Text="segmento"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label182" runat="server" Text="segmento2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label185" runat="server" Text="segmento3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropsegmento" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_segmento" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlsegmento_SelectedIndexChangedproj" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_segmento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_segmento]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2" colspan="2">
                            
                            <asp:DropDownList ID="busca_proj_dropsegmento2" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_segmento2" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlsegmento_SelectedIndexChangedproj2" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_segmento2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_segmento]">
                            </asp:SqlDataSource>
                            
                        </td>
                        <td colspan="2">
                            
                            <asp:DropDownList ID="busca_proj_dropsegmento3" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_segmento3" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlsegmento_SelectedIndexChangedproj3" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_segmento3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_segmento]">
                            </asp:SqlDataSource>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label181" runat="server" Text="subdivisão"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label183" runat="server" Text="subdivisão2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label186" runat="server" Text="subdivisão3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropsubdivisao" runat="server" 
                                AutoPostBack="true" DataSourceID="proj_produto_subdivisao" 
                                DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_produto_subdivisao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubdivisao_Selectingproj" 
                                SelectCommand="sp_vw_proj_subdivisao" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_proj_droparea" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropsubdivisao2" runat="server" DataSourceID="proj_produto_subdivisao2" 
                                DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_produto_subdivisao2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubdivisao_Selectingproj2" 
                                SelectCommand="sp_vw_proj_subdivisao" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_proj_droparea2" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_proj_dropsubdivisao3" runat="server" DataSourceID="proj_produto_subdivisao3" 
                                DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_produto_subdivisao3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubdivisao_Selectingproj3" 
                                SelectCommand="sp_vw_proj_subdivisao" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_proj_droparea3" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label20" runat="server" Text="responsável captação"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label31" runat="server" Text="escolaridade"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label25" runat="server" Text="cargo"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropcaptacao" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="busca_proj_responsavelcaptacao" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_proj_responsavelcaptacao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_proj_responsavel]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropescolaridade" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_requisitos_escolaridade" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="170px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_requisitos_escolaridade" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_escolaridade]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_proj_dropcargo" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_produto_cargo" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_produto_cargo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_cargo]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label21" runat="server" Text="responsável entrega"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label33" runat="server" Text="graduação"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label154" runat="server" Text="cargo2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropentrega" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="busca_proj_responsavelcaptacao" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_proj_textgraduacao" runat="server" 
                                AutoComplete="off" Width="170px"></asp:TextBox>
                            <ajax:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                                CompletionInterval="300" CompletionSetCount="5" EnableCaching="true" 
                                Enabled="true" MinimumPrefixLength="2" 
                                ServiceMethod="GetCompletionListGraduacao" ServicePath="PWebService.asmx" 
                                ShowOnlyCurrentWordInCompletionListItem="true" 
                                TargetControlID="busca_proj_textgraduacao" UseContextKey="True">
                            </ajax:AutoCompleteExtender>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_proj_dropcargo2" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_produto_cargo2" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_produto_cargo2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_cargo]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label153" runat="server" Text="colaborador responsável"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label32" runat="server" Text="salário inicial"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label29" runat="server" Text="salário final"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label155" runat="server" Text="cargo3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropcolaborador" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="busca_proj_colaborador" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_proj_colaborador" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_proj_colaborador]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_proj_textsalario_inicial" runat="server" Width="155px"></asp:TextBox>
                        </td>
                        <td class="style2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_proj_textsalario_final" runat="server" Width="155px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_proj_dropcargo3" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_produto_cargo3" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_produto_cargo3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_cargo]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label22" runat="server" Text="idioma"></asp:Label>
                            </td>
                        <td class="style2">
                            <asp:Label ID="Label98" runat="server" Text="nível"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label197" runat="server" Text="número do projeto"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label34" runat="server" Text="Descrição site (palavra chave)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:DropDownList ID="busca_proj_dropidiomas" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_requisitos_idioma" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="170px">
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
                        <td class="style2">
                            <asp:DropDownList ID="busca_proj_dropnivel" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_requisitos_nota" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="70px">
                                <asp:ListItem Value="0">Nota</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_proj_textidprojeto" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="busca_proj_textdescricao" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label23" runat="server" Text="modelo de contratação"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label207" runat="server" Text="produto"></asp:Label>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropmodelo_contratacao" runat="server" 
                                DataSourceID="busca_proj_tpcontratacao" DataTextField="descricao" 
                                DataValueField="id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_proj_tpcontratacao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_tp_contratacao]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_droptipo" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="proj_produto_tipo" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_produto_tipo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_tp_produto]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label151" runat="server" Text="status"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label187" runat="server" Text="status2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label189" runat="server" Text="status3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropstatus" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="proj_havik_status" DataTextField="descricao" DataValueField="id" 
                                Height="20px" OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedproj" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_status]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2" colspan="2">
                            
                            <asp:DropDownList ID="busca_proj_dropstatus2" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="proj_havik_status2" DataTextField="descricao" DataValueField="id" 
                                Height="20px" OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedproj2" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_status2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_status]">
                            </asp:SqlDataSource>
                            
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_proj_dropstatus3" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="proj_havik_status3" DataTextField="descricao" DataValueField="id" 
                                Height="20px" OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedproj3" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_status3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_status]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label152" runat="server" Text="substatus"></asp:Label>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label188" runat="server" Text="substatus2"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label190" runat="server" Text="substatus3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropsubstatus" runat="server" 
                                AutoPostBack="True" DataSourceID="proj_havik_substatus" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_substatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubstatus_Selectingproj" 
                                SelectCommand="sp_vw_proj_substatus" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_proj_dropsubstatus" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:DropDownList ID="busca_proj_dropsubstatus2" runat="server" 
                                AutoPostBack="True" DataSourceID="proj_havik_substatus2" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_substatus2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubstatus_Selectingproj2" 
                                SelectCommand="sp_vw_proj_substatus" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_proj_dropstatus2" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="busca_proj_dropsubstatus3" runat="server" 
                                AutoPostBack="True" DataSourceID="proj_havik_substatus3" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="proj_havik_substatus3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubstatus_Selectingproj3" 
                                SelectCommand="sp_vw_proj_substatus" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_proj_dropstatus3" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            &nbsp;</td>
                        <td class="style2" colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            <asp:Button ID="busca_projeto2" runat="server" Height="20px" onclick="Button47_Click" 
                                Text="buscar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" colspan="2">
                            
                        </td>
                        <td class="style5" colspan="2">
                            
                        </td>
                        <td class="style6" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            &nbsp;</td>
                        <td class="style2" colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            
                        </td>
                        <td class="style2" colspan="2">
                            
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            &nbsp;</td>
                        <td class="style2" colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="6">
                            
                            
                            
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="busca_cli" runat="server">
                <br />
                <table class="style7">
                    <tr>
                        <td class="style11" colspan="7">
                        <asp:RadioButtonList ID="busca_cli_radio_projetos" runat="server" 
                                RepeatDirection="Horizontal" AutoPostBack="True" 
                                onselectedindexchanged="busca_cli_radio_projetos_SelectedIndexChanged">
                            <asp:ListItem Value="1">meus projetos</asp:ListItem>
                            <asp:ListItem Value="3">projetos havik</asp:ListItem>
                            </asp:RadioButtonList>
                        <asp:DropDownList ID="busca_cli_drop_projeto" runat="server" 
                                Height="20px" Width="330px" DataSourceID="busca_cli_dropprojetos" 
                                DataTextField="projeto" DataValueField="id_projeto" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_dropprojetos" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_busca_proj_cliente_cb" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_radio_projetos" Name="tipo" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="busca_cli_vincular" runat="server" Height="20px" onclick="Button49_Click" 
                                Text="vincular ao projeto" Width="120px" />
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="3">
                            <asp:Label ID="rowcount_cliente" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td rowspan="2">
                            <asp:RadioButtonList ID="busca_cli_radio_tipobusca" runat="server">
                                <asp:ListItem Selected="True" Value="1">Busca E</asp:ListItem>
                                <asp:ListItem Value="2">Busca OU</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td colspan="3" rowspan="2">
                            <asp:Button ID="busca_cliente1" runat="server" Height="20px" onclick="Button46_Click" 
                                Text="buscar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="3">
                            <asp:Label ID="mensagem_busca_cli" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label101" runat="server" Text="nome"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label102" runat="server" Text="email"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label103" runat="server" Text="telefone"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label209" runat="server" Text="ID cliente"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textnome" runat="server" Width="330px" ></asp:TextBox>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textemail" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_texttelefone" runat="server" Width="120px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="cli_busca_text_id_cliente" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="120px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label104" runat="server" Text="endereço"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label106" runat="server" Text="cidade"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label107" runat="server" Text="bairro"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textendereco" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textcidade" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td colspan="4">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textbairro" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label110" runat="server" Text="área"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label133" runat="server" Text="área2"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label193" runat="server" Text="área3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:DropDownList ID="busca_cli_droparea" runat="server" AutoPostBack="true" 
                                DataSourceID="busca_cli_area" DataTextField="descricao" DataValueField="id" 
                                Height="20px" OnSelectedIndexChanged="ddlarea_SelectedIndexChangedcli" 
                                Width="330px" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_area" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceArea_Selectingcli" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                                <SelectParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:DropDownList ID="busca_cli_droparea2" runat="server" AutoPostBack="true" 
                                DataSourceID="busca_cli_area2" DataTextField="descricao" DataValueField="id" 
                                Height="20px" OnSelectedIndexChanged="ddlarea_SelectedIndexChangedcli2" 
                                Width="330px" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_area2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceArea_Selectingcli2" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                                <SelectParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="busca_cli_droparea3" runat="server" AutoPostBack="true" 
                                DataSourceID="busca_cli_area" DataTextField="descricao" DataValueField="id" 
                                Height="20px" OnSelectedIndexChanged="ddlarea_SelectedIndexChangedcli3" 
                                Width="330px" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_area1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceArea_Selectingcli" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                                <SelectParameters>
                                    <asp:Parameter Name="id" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label191" runat="server" Text="subdivisão"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label192" runat="server" Text="subdivisão2"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label205" runat="server" Text="subdivisão3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                             <asp:DropDownList ID="busca_cli_dropsubdivisao" runat="server" 
                                AutoPostBack="true" DataSourceID="busca_cli_subdivisao" 
                                DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_subdivisao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubdivisao_Selectingcli" 
                                SelectCommand="sp_vw_busca_cli_subdivisao" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_droparea" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </td>
                        <td class="style15" colspan="2">
                            <asp:DropDownList ID="busca_cli_dropsubdivisao2" runat="server" 
                                AutoPostBack="true" DataSourceID="busca_cli_subdivisao2" 
                                DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_subdivisao2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubdivisao_Selectingcli2" 
                                SelectCommand="sp_vw_busca_cli_subdivisao" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_droparea2" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="busca_cli_dropsubdivisao3" runat="server" 
                                AutoPostBack="true" DataSourceID="busca_cli_subdivisao3" 
                                DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_subdivisao3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubdivisao_Selectingcli3" 
                                SelectCommand="sp_vw_busca_cli_subdivisao" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_droparea3" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label105" runat="server" Text="segmento"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label131" runat="server" Text="segmento2"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label206" runat="server" Text="segmento3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            
                           <asp:DropDownList ID="busca_cli_dropsegmento" runat="server" 
                                AppendDataBoundItems="True" 
                                DataSourceID="busca_cli_segmento" DataTextField="descricao" 
                                DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_segmento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT DISTINCT [id], [descricao] FROM [vw_cli_segmento]">

                            </asp:SqlDataSource>
                            
                        </td>
                        <td class="style15" colspan="2">
                            
                            <asp:DropDownList ID="busca_cli_dropsegmento2" runat="server" 
                                AppendDataBoundItems="True" 
                                DataSourceID="busca_cli_segmento2" DataTextField="descricao" DataValueField="id" 
                                Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_segmento2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT DISTINCT [id], [descricao] FROM [vw_cli_segmento]">
                            </asp:SqlDataSource>
                            
                        </td>
                        <td colspan="4">                           
                                                        
                            <asp:DropDownList ID="busca_cli_dropsegmento3" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="busca_cli_segmento3" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_segmento3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT DISTINCT [id], [descricao] FROM [vw_cli_segmento]">
                            </asp:SqlDataSource>                            
                                                        
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label115" runat="server" Text="status"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label137" runat="server" Text="status2"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label138" runat="server" Text="status3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:DropDownList ID="busca_cli_dropstatus" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="busca_cli_status" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedcli" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_status]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:DropDownList ID="busca_cli_dropstatus2" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="busca_cli_status2" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedcli2" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_status2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_status]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="busca_cli_dropstatus3" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="busca_cli_status3" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChangedcli3" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_status3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_status]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label119" runat="server" Text="substatus"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label139" runat="server" Text="substatus2"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label140" runat="server" Text="substatus3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:DropDownList ID="busca_cli_dropsubstatus" runat="server" 
                                AutoPostBack="True" DataSourceID="busca_cli_substatus" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_substatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"                                 
                                SelectCommand="sp_vw_busca_cli_substatus"
                                OnSelecting="SqlDataSourceSubstatus_Selectingcli" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_dropstatus" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>    
                             </asp:SqlDataSource>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:DropDownList ID="busca_cli_dropsubstatus2" runat="server" 
                                AutoPostBack="True" DataSourceID="busca_cli_substatus2" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_substatus2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubstatus_Selectingcli2" 
                                SelectCommand="sp_vw_busca_cli_substatus" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_dropstatus2" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="busca_cli_dropsubstatus3" runat="server" 
                                AutoPostBack="True" DataSourceID="busca_cli_substatus3" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_substatus3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceSubstatus_Selectingcli3" 
                                SelectCommand="sp_vw_busca_cli_substatus" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="busca_cli_dropstatus3" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label109" runat="server" Text="cargo"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label141" runat="server" Text="cargo2"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label142" runat="server" Text="cargo3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:DropDownList ID="busca_cli_dropcargo" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="busca_cli_cargo" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_cargo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_cargo]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:DropDownList ID="busca_cli_dropcargo2" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="busca_cli_cargo2" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_cargo2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_cargo]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="busca_cli_dropcargo3" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="busca_cli_cargo3" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_cargo3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_cargo]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label118" runat="server" Text="empresa"></asp:Label>
                        </td>
                        <td class="style16">
                            <asp:Label ID="Label108" runat="server" Text="idade inicial"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label195" runat="server" Text="idade final"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label201" runat="server" Text="sexo"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textempresa" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style16">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textidade_inicial" runat="server" 
                                Width="160px"></asp:TextBox>
                        </td>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textidade_final" runat="server" Width="160px"></asp:TextBox>
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="cli_busca_dropsexo" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="busca_cli_sexo" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="320px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_sexo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_sexo]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label122" runat="server" Text="projeto"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label114" runat="server" Text="escolaridade"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="Label117" runat="server" Text="idioma"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label143" runat="server" Text="nível"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textprojeto" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:DropDownList ID="cli_busca_dropescolaridade" runat="server" 
                                AppendDataBoundItems="True" Height="20px" Width="330px" 
                                DataSourceID="busca_cli_escolaridade" DataTextField="descricao" 
                                DataValueField="id">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="busca_cli_escolaridade" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [descricao], [id] FROM [vw_cli_escolaridade]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="3">
                            
                            <asp:DropDownList ID="cli_busca_dropidiomas" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_busca_idioma" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="170px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_busca_idioma" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [descricao], [id] FROM [vw_proj_idiomas]">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="cli_busca_nota" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_proj_notas]">
                            </asp:SqlDataSource>
                            
                        </td>
                        <td>
                            <asp:DropDownList ID="cli_busca_dropnivel" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_busca_nota" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="70px">
                                <asp:ListItem Value="0">Nota</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label125" runat="server" Text="projeto2"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label116" runat="server" Text="graduação"></asp:Label>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textprojeto2" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textcurso" runat="server" Width="330px"></asp:TextBox>
                            <ajax:AutoCompleteExtender ID="AutoCompleteExtender" runat="server" 
                                CompletionInterval="300" CompletionSetCount="5" EnableCaching="true" 
                                Enabled="true" MinimumPrefixLength="2" 
                                ServiceMethod="GetCompletionListGraduacao" ServicePath="PWebService.asmx" 
                                ShowOnlyCurrentWordInCompletionListItem="true" 
                                TargetControlID="cli_busca_textcurso" UseContextKey="True">
                            </ajax:AutoCompleteExtender>
                        </td>
                        <td colspan="2">
                            
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label128" runat="server" Text="projeto3"></asp:Label>
                        </td>
                        <td class="style16">
                            <asp:Label ID="Label120" runat="server" Text="salário inicial"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label196" runat="server" Text="salário final"></asp:Label>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textprojeto3" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style16">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textsalario_inicial" runat="server" Width="160px"></asp:TextBox>
                        </td>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textsalario_final" runat="server" Width="160px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label123" runat="server" Text="realizações (mini C.V.)"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label124" runat="server" Text="palavra chave (C.V.)"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label202" runat="server" Text="curso/certificação"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textrealiza" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textpalavrachave" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td colspan="4">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_text_curso" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label126" runat="server" Text="realizações (mini C.V.)"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label127" runat="server" Text="palavra chave (C.V.)"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label204" runat="server" Text="curso/certificação2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textrealiza2" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textpalavrachave_2" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td colspan="4">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_text_curso2" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label129" runat="server" Text="realizações (mini C.V.)"></asp:Label>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:Label ID="Label130" runat="server" Text="palavra chave (C.V.)"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="Label198" runat="server" Text="curso/certificação3"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textrealiza3" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style15" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_textpalavrachave_3" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td colspan="4">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_busca_text_curso3" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style15" colspan="2">
                            &nbsp;</td>
                        <td colspan="4">
                            <asp:Button ID="busca_cliente2" runat="server" Height="20px" onclick="Button46_Click" 
                                Text="buscar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style15" colspan="2">
                            &nbsp;</td>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13" colspan="7">
                            
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </body>
</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {            margin-left: 40px;
        }
        .style5
        {
            width: 701px;
            height: 21px;
        }
        .style6
        {
            height: 21px;
        }
        .style7
        {
            width: 1020px;
        }
        .style11
        {            margin-left: 40px;
        }
        .style13
        {
            width: 709px;
        }
        .style14
        {
        }
        .style15
        {
            width: 670px;
            margin-left: 40px;
        }
        .style16
        {
            width: 766px;
        }
        </style>
</asp:Content>

