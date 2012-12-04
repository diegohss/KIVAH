<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empresa.aspx.cs" Inherits="HavikTeste.Empresa" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<script runat="server">
    
    protected void menuEmpresa_MenuItemClick(object sender, MenuEventArgs e)
    {
        int index = Int32.Parse(e.Item.Value);
        MultiView1.ActiveViewIndex = index;
        
        menuEmpresa.SelectedItem.Selected = true;
        /*menuEmpresa.SelectedItem.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");*/
        
    }
</script>

<asp:Content ID="EmpresaMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="title">
    <asp:Panel ID="resumoEmpresa" runat="server" Height="128px" Width="100%" 
        BackColor="#FFA079">
                    <asp:Panel ID="grid_empresa" runat="server" BackColor="#FFA079" Height="126px" 
                        style="overflow:auto" Width="100%">
                        <asp:GridView ID="grid_busca_empresa" runat="server" 
                            AutoGenerateColumns="false" 
                            onselectedindexchanged="grid_busca_empresa_SelectedIndexChanged" 
                            DataKeyNames="id_empresa">
                            <Columns>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" SortExpression="id_empresa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_segmento" HeaderText="id_segmento" SortExpression="id_segmento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="segmento" HeaderText="segmento" SortExpression="segmento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_cidade" HeaderText="id_cidade" SortExpression="id_cidade">
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
    </asp:Panel>
    </div>
    <div class="clear">
    <asp:Menu ID="menuEmpresa" runat="server" CssClass="menuEmpresa" OnMenuItemClick="menuEmpresa_MenuItemClick"    
        IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" BorderWidth="1px" Width="100%">
        <Items>
            <asp:MenuItem Text="dados cadastrais" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="projeto" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="status" Value="2"></asp:MenuItem>
            <asp:MenuItem Text="contato" Value="3"></asp:MenuItem>
            <asp:MenuItem Text="filiais" Value="4"></asp:MenuItem>
            <asp:MenuItem Text="mercado" Value="5"></asp:MenuItem>
            <asp:MenuItem Text="IMPORTANTE" Value="6"></asp:MenuItem>
            <asp:MenuItem Text="financeiro" Value="7"></asp:MenuItem>
            <asp:MenuItem Text="relatório" Value="8"></asp:MenuItem>
        </Items>
     </asp:Menu>
     </div>
     <body>
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
         <asp:MultiView runat="server" ID="MultiView1" ActiveViewIndex="0">
            <asp:View runat="server" ID="emp_dadoscadastrais">
                <br />
                <ajax:ToolkitScriptManager ID="ScriptManager1" runat="server"/>
                <table cellspacing="3" class="style1" width="100%">
                    <tr>
                        <td class="style12">
                            <asp:Label ID="mensagem_emp_dadoscadastrais" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style12">
                            &nbsp;</td>
                        <td align="left">
                            <asp:Label ID="emp_dadoscadastrasi_label_id" runat="server" Font-Bold="True" Font-Italic="True" 
                                Text=""></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label139" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em dados cadastrais"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label15" runat="server" Text="nome*"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="emp_dadoscadastrais_nometext" ErrorMessage="preencher campo" 
                                ValidationGroup="validadadoscadastrais"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style12">
                            <asp:Label ID="Label25" runat="server" Text="razão social*"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label33" runat="server" Text="offlimits*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_nometext" runat="server" Width="330px" AutoComplete="off"></asp:TextBox>
                            <ajax:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="emp_dadoscadastrais_nometext" Enabled="true"
                            ServicePath="PWebService.asmx" ServiceMethod="GetCompletionList" EnableCaching="true" UseContextKey="True" MinimumPrefixLength="2"
                            CompletionInterval="300" CompletionSetCount="5" ShowOnlyCurrentWordInCompletionListItem="true" ></ajax:AutoCompleteExtender>
                        </td>
                        <td class="style12">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_razaosocial" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td style="margin-left: 40px" colspan="2">
                            <asp:RadioButtonList ID="emp_dadoscadastrais_radioofflimits" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="2">Total</asp:ListItem>
                                <asp:ListItem Value="1">Parcial</asp:ListItem>
                                <asp:ListItem Selected="True" Value="3">Nenhum</asp:ListItem>
                            </asp:RadioButtonList>
                            </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label16" runat="server" Text="CNPJ"></asp:Label>&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="emp_dadoscadastrais_cnpj" ErrorMessage="digite um CNPJ válido" 
                                    ValidationExpression="^\d{14}$" ValidationGroup="validadadoscadastrais"></asp:RegularExpressionValidator>                        </td>
                        <td class="style12">
                            <asp:Label ID="Label26" runat="server" Text="segmento*"></asp:Label>
                        </td>
                        <td colspan="2">
                        <asp:Label ID="Label102" runat="server" Text="data de início"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label103" runat="server" Text="data de término"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="style17">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_cnpj" runat="server" Width="180px" MaxLength="14"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MascaraEmpresaCNPJ" runat="server" Mask="99,999,999/9999-99" TargetControlID="emp_dadoscadastrais_cnpj"></ajax:MaskedEditExtender>
                        </td>
                        <td class="style17">
                            <asp:DropDownList ID="emp_dadoscadastrais_segmento" runat="server" 
                                Height="20px" Width="330px" AutoPostBack="true"
                                DataSourceID="Emp_segmento" DataTextField="descricao" DataValueField="id" 
                                AppendDataBoundItems="True" OnSelectedIndexChanged="ddlsegmento_SelectedIndexChanged">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_segmento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_segmento]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style19">
                            
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_data_ini" runat="server" Visible="False"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MascaraClienteDataCadastro" runat="server" Mask="99/99/9999" TargetControlID="emp_dadoscadastrais_data_ini"></ajax:MaskedEditExtender>
                            
                        </td>
                        <td class="style19">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_data_fim" runat="server" Visible="False"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" TargetControlID="emp_dadoscadastrais_data_fim"></ajax:MaskedEditExtender>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label21" runat="server" Text="endereço"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label28" runat="server" Text="país"></asp:Label>
                        </td>
                        <td class="style10" colspan="2">
                            <asp:Label ID="Label74" runat="server" Text="key account"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_endereco" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style14">
                            <asp:DropDownList ID="emp_dadoscadastrais_pais" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="Emp_pais" 
                                DataTextField="nome" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_pais" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome] FROM [vw_emp_paises]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style10" colspan="2">
                            <asp:DropDownList ID="emp_financeiro_dropkeyaccount" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="emp_dadoscadastrais_keyaccount" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_dadoscadastrais_keyaccount" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_keyaccount]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label18" runat="server" Text="CEP"></asp:Label>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="validator_cep" runat="server" 
                                ControlToValidate="emp_dadoscadastrais_cep" 
                                ErrorMessage="  digite um CEP válido" ValidationExpression="^\d{8}$" 
                                ValidationGroup="validadadoscadastrais"></asp:RegularExpressionValidator>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label22" runat="server" Text="número"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label29" runat="server" Text="cidade"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label30" 
                                runat="server" Text="estado"></asp:Label>
                        </td>
                        <td class="style10" colspan="2">
                            <asp:Label ID="Label126" runat="server" Text="área offlimits parcial*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_cep" runat="server" MaxLength="8" 
                                Width="90px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MascaraEmpresaCEP" runat="server" Mask="99999-999" 
                                TargetControlID="emp_dadoscadastrais_cep"></ajax:MaskedEditExtender>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_numero" 
                                runat="server" Width="120px"></asp:TextBox>
                        </td>
                        <td class="style14">
                            <asp:DropDownList ID="emp_dadoscadastrais_dropcidade" runat="server" 
                                AutoPostBack="True" DataSourceID="emp_dadoscadastrais_cidades" 
                                DataTextField="munnome" DataValueField="muncod" Height="19px" 
                                Width="198px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_dadoscadastrais_cidades" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                OnSelecting="SqlDataSourceDadosCadastraisCidade_Selecting" 
                                SelectCommand="sp_vw_emp_cidade" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="emp_dadoscadastrais_estado" Name="ufcod" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="emp_dadoscadastrais_estado" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="emp_filiaisestado" DataTextField="ufsigla" DataValueField="ufcod" 
                                Height="22px" 
                                OnSelectedIndexChanged="ddldadoscadastrais_estado_SelectedIndexChanged" 
                                Width="72px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style10" colspan="2">
                            <asp:DropDownList ID="emp_dadoscadastrais_areaofflimits" runat="server" 
                                AutoPostBack="true" DataSourceID="Emp_OffParcial" DataTextField="descricao" 
                                DataValueField="id" Height="20px" Width="330px" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emp_OffParcial" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"
                                SelectCommand="SELECT [id], [descricao] FROM [vw_area]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label19" runat="server" Text="cod. país"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label23" runat="server" Text="DDD"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label24" runat="server" Text="telefone"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label31" runat="server" Text="complemento"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label32" runat="server" Text="bairro"></asp:Label>
                        </td>
                        <td class="style10" colspan="2">
                            <asp:Button ID="emp_dadoscad_offlimits" runat="server" Height="20px" onclick="Button2_Click" 
                                Text="adicionar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_codpais" runat="server" Width="95px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;<asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_ddd" runat="server" Width="65px"></asp:TextBox>
                            &nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_telefone" runat="server" Width="120px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClipboardEnabled="true" 
                                Mask="9999999999" TargetControlID="emp_dadoscadastrais_telefone"></ajax:MaskedEditExtender>
                        </td>
                        <td class="style17">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_complemento" runat="server" Width="97px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_bairro" runat="server" Width="190px"></asp:TextBox>
                            </td>
                        <td rowspan="6" colspan="2">
                        <asp:Panel ID="Panel4" runat="server"  Height="200px" Width="320px"  style="overflow:auto">
                            <asp:GridView ID="emp_grid_offlimits" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="emp_dadoscadastrais_gridofflimits" Width="335px" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True" 
                                onselectedindexchanged="emp_grid_offlimits_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" 
                                        SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                        SortExpression="id_empresa" Visible="False" />
                                    <asp:BoundField DataField="id_offlimits" HeaderText="id_offlimits" 
                                        SortExpression="id_offlimits" Visible="False" />
                                    <asp:BoundField DataField="offlimits" HeaderText="offlimits" 
                                        SortExpression="offlimits" />
                                    <asp:BoundField DataField="id_area" HeaderText="id_area" 
                                        SortExpression="id_area" Visible="False" />
                                    <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                                    <asp:BoundField DataField="keyaccount" HeaderText="keyaccount" 
                                        SortExpression="keyaccount" />
                                    <asp:BoundField DataField="dt_inicio" HeaderText="dt_inicio" ReadOnly="True" 
                                        SortExpression="dt_inicio" />
                                    <asp:BoundField DataField="dt_encerramento" HeaderText="dt_encerramento" 
                                        ReadOnly="True" SortExpression="dt_encerramento" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" ReadOnly="True" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#FFA079" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                            </asp:Panel>
                            <asp:SqlDataSource ID="emp_dadoscadastrais_gridofflimits" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_offlimits" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style20">
                            
                            <asp:Label ID="Label20" runat="server" Text="email"></asp:Label>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="emp_dadoscadastrais_email" ErrorMessage="e-mail inválido" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="validadadoscadastrais" Width="131px"></asp:RegularExpressionValidator>
                            
                        </td>
                        <td class="style20">
                            <asp:Label ID="Label125" runat="server" Text="site"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_email" runat="server" Width="330px"></asp:TextBox>
                            </td>
                        <td class="style15">
                            
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_dadoscadastrais_site" runat="server" Width="330px"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label127" runat="server" Text="grupo"></asp:Label>
                            </td>
                        <td class="style12">
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:DropDownList ID="emp_dadoscadastrais_dropgrupo" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" 
                                DataSourceID="emp_dadoscadastrais_grupo" DataTextField="nome" 
                                DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_dadoscadastrais_grupo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome] FROM [vw_emp_grupo]"></asp:SqlDataSource>
                            </td>
                        <td class="style15">
                            <asp:Button ID="emp_dadoscadastrais_cadastrar" runat="server" 
                                AutoPostBack="true" Height="20px" onclick="Button3_Click" Text="cadastrar" 
                                ValidationGroup="validadadoscadastrais" Width="120px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                                ID="emp_dadoscadastrais_limpar" runat="server" AutoPostBack="true" 
                                Height="20px" onclick="emp_dadoscadastrais_limpar_Click" Text="novo cadastro" 
                                Width="120px" />
                            </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Button ID="Button4" runat="server" Height="20px" Text="atualizar" Width="120px" 
                                onclick="Button4_Click" Visible="False" />
                            </td>
                        <td class="style12">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style12">
                            </td>
                        <td class="style12">
                            &nbsp;</td>
                        <td colspan="2">
                        </td>
                    </tr>
                </table>
                <br />
            </asp:View>
            <asp:View runat=server ID="emp_projeto">
                <table class="style27">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="Label140" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em projeto"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="Panel3" runat="server" Width="1020" Height="280px" style="overflow:auto">
                <asp:GridView ID="emp_projeto_grid_projetos" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="id_projeto" 
                    DataSourceID="emp_projeto_gridprojetos"
                    onrowdatabound="emp_projeto_grid_projetos_RowDataBound" 
                    onselectedindexchanged="emp_projeto_grid_projetos_SelectedIndexChanged" 
                        AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Exibir" ShowSelectButton="True" Visible="False" />
                        <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_projeto" 
                            Visible="true" />
                        <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                            SortExpression="id_empresa" Visible="False" />
                        <asp:BoundField DataField="projeto" HeaderText="projeto" 
                            SortExpression="projeto" />
                        <asp:BoundField DataField="produto" HeaderText="produto" 
                            SortExpression="produto" />
                        <asp:BoundField DataField="segmento" HeaderText="segmento" 
                            SortExpression="segmento" />
                        <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                        <asp:BoundField DataField="subdivisao" HeaderText="subdivisao" 
                            SortExpression="subdivisao" />
                        <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
                        <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                            SortExpression="dt_cadastro" />
                        <asp:BoundField DataField="qtd_clientes_vinculados" 
                            HeaderText="qtd_clientes_vinculados" ReadOnly="True" 
                            SortExpression="qtd_clientes_vinculados" />
                        <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                            SortExpression="ultimo_status" />
                        <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                            SortExpression="ultimo_substatus" />
                        <asp:BoundField DataField="responsavel_captacao" 
                            HeaderText="responsavel_captacao" SortExpression="responsavel_captacao" />
                        <asp:BoundField DataField="responsavel_entrega" 
                            HeaderText="responsavel_entrega" SortExpression="responsavel_entrega" />
                        <asp:BoundField DataField="colaborador_responsavel" 
                            HeaderText="colaborador_responsavel" SortExpression="colaborador_responsavel" />
                        <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                            SortExpression="nome_usuario" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#FFA079" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                </asp:Panel>
                
                <asp:SqlDataSource ID="emp_projeto_gridprojetos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                    SelectCommand="sp_vw_emp_projeto" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <br />
            </asp:View>
            <asp:View runat=server ID="emp_havik">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style14">
                            <asp:Label ID="mensagem_emp_havik" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style10" align="right">
                            <asp:Label ID="Label141" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em status"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label42" runat="server" Text="status*"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="emp_havik_dropstatus" ErrorMessage="preencher o campo" 
                                InitialValue="Escolha a Opção" ValidationGroup="validastatus"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style14">
                        </td>
                        <td class="style10">
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:DropDownList ID="emp_havik_dropstatus" runat="server" Height="20px" 
                                Width="330px" DataSourceID="emp_havik_status" DataTextField="descricao" 
                                DataValueField="id" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChanged" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_havik_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_status]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2" rowspan="7">
                        <asp:Panel ID="Panel_Status" runat="server" Width="660" Height="420px" style="overflow:auto">
                            <asp:GridView ID="emp_havik_grid_status" runat="server" 
                                DataKeyNames="id" DataSourceID="emp_status_grid" Height="370px" 
                                Width="671px" AllowPaging="True" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True" 
                                PageSize="5">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" 
                                        SortExpression="id" InsertVisible="False" ReadOnly="True" 
                                        Visible="False" />
                                    <asp:BoundField DataField="id_status" HeaderText="id_status" 
                                        SortExpression="id_status" Visible="False" />
                                    <asp:BoundField DataField="status" HeaderText="status" 
                                        SortExpression="status" />
                                    <asp:BoundField DataField="id_substatus" HeaderText="id_substatus" 
                                        SortExpression="id_substatus" Visible="False" />
                                    <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                        SortExpression="substatus" />
                                    <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
                                    <asp:BoundField DataField="dt_agendada" HeaderText="dt_agendada" 
                                        ReadOnly="True" SortExpression="dt_agendada" />
                                    <asp:BoundField DataField="dt_alteracao" HeaderText="dt_alteracao" 
                                        ReadOnly="True" SortExpression="dt_alteracao" />
                                    <asp:BoundField DataField="obs" HeaderText="obs" SortExpression="obs" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        ReadOnly="True" SortExpression="dt_cadastro" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#FFA079" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </asp:Panel>
                            <asp:SqlDataSource ID="emp_status_grid" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_status" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label110" runat="server" Text="data de follow up"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <asp:Label ID="Label149" runat="server" Text="hora"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                             
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_havik_textdata" 
                                runat="server" Height="20px" 
                                MaxLength="10" Width="135px" Enabled="False"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <ajax:MaskedEditExtender ID="MascaraCliHavikData" runat="server" 
                                Mask="99/99/9999" TargetControlID="emp_havik_textdata"></ajax:MaskedEditExtender>
                            <script src="js/mascara.js" type="text/javascript">

</script>
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_havik_texthora" runat="server" 
                                onkeyup="formataHora (this,event);"></asp:TextBox>

                            </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label138" runat="server" Text="responsável"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:DropDownList ID="emp_havik_drop_entrevistador" runat="server" 
                                AutoPostBack="True" datasourceid="emp_havik_entrevistador" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" 
                                Width="330px" Enabled="False">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_havik_entrevistador" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_proj_colaborador]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label44" runat="server" Text="observações"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:TextBox ID="emp_havik_observacoes" runat="server" Height="220px" 
                                Width="330px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Button ID="emp_havik_adicionar" runat="server" Height="20px" Text="Adicionar" 
                                Width="120px" onclick="Button7_Click" ValidationGroup="validastatus" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        <td class="style12">
                            <asp:SqlDataSource ID="emp_havik_substatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_substatus" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="emp_havik_dropstatus" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="emp_havik_dropsubstatus0" runat="server" 
                                AutoPostBack="True" DataSourceID="emp_havik_substatus" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Visible="False" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label148" runat="server" Text="substatus" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View runat=server ID="emp_contato">
                <table class="style27">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="Label142" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em contato"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="emp_contato_grid_contatos" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="id_cliente" 
                    DataSourceID="emp_contato_gridcontatos" 
                    onselectedindexchanged="emp_contato_grid_contatos_SelectedIndexChanged" 
                    Width="580px" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                    GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Exibir" />
                        <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_cliente" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                        <asp:BoundField DataField="cod_pais" HeaderText="cod_pais" 
                            SortExpression="cod_pais" />
                        <asp:BoundField DataField="ddd" HeaderText="ddd" SortExpression="ddd" />
                        <asp:BoundField DataField="telefone" HeaderText="telefone" 
                            SortExpression="telefone" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#FFA079" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="emp_contato_gridcontatos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                    SelectCommand="sp_vw_emp_contato" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                
            </asp:View>
            <asp:View runat=server ID="emp_filiais">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style14">
                            <asp:Label ID="mensagem_emp_filiais" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="Label143" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em filiais"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label54" runat="server" Text="nome*"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="emp_filiais_nome" ErrorMessage="preencher campo" 
                                ValidationGroup="emp_filiais_cadastrar"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label147" runat="server" Text="código*"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label58" runat="server" Text="endereço"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label65" runat="server" Text="filiais cadastradas"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_nome" runat="server" Width="230px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_cod" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_endereco" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td rowspan="7">
                        <asp:Panel ID="Panel2" runat="server"  Height="220px" Width="330px"  style="overflow:auto">
                            <asp:GridView ID="emp_filiais_gridfiliais" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataSourceID="emp_gridfiliais" Width="330px" 
                                onselectedindexchanged="emp_filiais_gridfiliais_SelectedIndexChanged" 
                                AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                                
                                
                                DataKeyNames="id,filial,cep,endereco,numero,complemento,bairro,pais,estado,cidade,cod_pais,ddd,telefone,email,site,codigo">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" SelectText="Exibir" />
                                    <asp:BoundField DataField="codigo" HeaderText="codigo" 
                                        SortExpression="codigo" />
                                    <asp:BoundField DataField="id" HeaderText="id" 
                                        SortExpression="id" InsertVisible="False" ReadOnly="True" 
                                        Visible="False" />
                                    <asp:BoundField DataField="filial" HeaderText="filial" 
                                        SortExpression="filial" />
                                    <asp:BoundField DataField="cep" HeaderText="cep" 
                                        SortExpression="cep" />
                                    <asp:BoundField DataField="endereco" HeaderText="endereco" 
                                        SortExpression="endereco" />
                                    <asp:BoundField DataField="numero" HeaderText="numero" 
                                        SortExpression="numero" />
                                    <asp:BoundField DataField="complemento" HeaderText="complemento" 
                                        SortExpression="complemento" />
                                    <asp:BoundField DataField="bairro" HeaderText="bairro" 
                                        SortExpression="bairro" />
                                    <asp:BoundField DataField="pais" HeaderText="pais" 
                                        SortExpression="pais" />
                                    <asp:BoundField DataField="estado" HeaderText="estado" 
                                        SortExpression="estado" />
                                    <asp:BoundField DataField="cidade" HeaderText="cidade" 
                                        SortExpression="cidade" />
                                    <asp:BoundField DataField="cod_pais" HeaderText="cod_pais" 
                                        SortExpression="cod_pais" />
                                    <asp:BoundField DataField="ddd" HeaderText="ddd" 
                                        SortExpression="ddd" />
                                    <asp:BoundField DataField="telefone" HeaderText="telefone" 
                                        SortExpression="telefone" />
                                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                                        Visible="False" />
                                    <asp:BoundField DataField="site" HeaderText="site" 
                                        SortExpression="site" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" ReadOnly="True" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#FFA079" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                       </asp:Panel>
                            <asp:SqlDataSource ID="emp_gridfiliais" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_filiais" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label55" runat="server" Text="país"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label59" runat="server" Text="cidade*"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label64" runat="server" Text="estado*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:DropDownList ID="emp_filiais_droppais" runat="server" Height="20px" 
                                Width="330px" DataSourceID="emp_filiais_pais" DataTextField="nome" 
                                DataValueField="id" AppendDataBoundItems="True" AutoPostBack="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_filiais_pais" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome] FROM [vw_emp_paises]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style14">
                            <asp:DropDownList ID="emp_filiais_cidade" runat="server" Width="220px" 
                                DataSourceID="emp_filiais_cidades" DataTextField="munnome" 
                                DataValueField="muncod">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_filiais_cidades" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>"                                 
                                SelectCommand="sp_vw_emp_cidade"
                                OnSelecting="SqlDataSourceCidade_Selecting" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="emp_filiais_dropestado" Name="ufcod" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>    
                             </asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="emp_filiais_dropestado" runat="server" Height="19px" Width="49px" 
                                DataSourceID="emp_filiaisestado" DataTextField="ufsigla" DataValueField="ufcod" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlestado_SelectedIndexChanged">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_filiaisestado" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [ufcod], [ufsigla], [nome] FROM [vw_emp_estados]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label56" runat="server" Text="cód. país"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label66" runat="server" Text="DDD"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label67" runat="server" Text="telefone*"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label60" runat="server" Text="CEP"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label63" runat="server" Text="número"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_codpais" runat="server" Width="95px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_ddd" runat="server" Width="65px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_telefone" runat="server" Width="110px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="9999999999" TargetControlID="emp_filiais_telefone"></ajax:MaskedEditExtender>
                        </td>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_cep" runat="server" Width="170px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtenderCEP" runat="server" Mask="99999-999" TargetControlID="emp_filiais_cep"></ajax:MaskedEditExtender>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_numero" runat="server" Width="106px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label57" runat="server" Text="endereço eletrônico"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label61" runat="server" Text="complemento"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label62" runat="server" Text="bairro*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_site" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style14">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_complemento" runat="server" Width="106px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_filiais_bairro" runat="server" Width="170px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Button ID="emp_filiais_cadastrar" runat="server" Height="20px" Text="cadastrar" 
                                Width="120px" onclick="Button13_Click" 
                                ValidationGroup="emp_filiais_cadastrar" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button14" runat="server" Height="20px" Text="atualizar" 
                                Width="120px" onclick="Button14_Click" Visible="False" />
                        </td>
                        <td class="style14">
                            <asp:Button ID="emp_filial_nova_filial" runat="server" Height="20px" 
                                Text="nova filial" Visible="True" Width="120px" onclick="Button29_Click" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View runat=server ID="emp_mercado">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style14" colspan="2">
                            <asp:Label ID="mensagem_emp_mercado" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style14">
                            
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="Label144" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em mercado"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                            <asp:Label ID="Label68" runat="server" Text="número de funcionários"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Label ID="Label70" runat="server" Text="empresas para abordagem"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label124" runat="server" Text="notícia"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                            <asp:DropDownList ID="emp_mercado_dropnrodefuncionarios" runat="server" Height="20px" 
                                Width="330px" AppendDataBoundItems="True" 
                                DataSourceID="emp_mercado_funcionários" DataTextField="descricao" 
                                DataValueField="id">
                                <asp:ListItem Value="0">Ecolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_mercado_funcionários" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_funcionarios]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style14">
                            <script type="text/javascript" language="javascript">
                                function GetCode(sender, e) {
                                    $get("<%=id_concorrente.ClientID %>").value = e.get_value();
                                }
                            </script>
                            <asp:HiddenField ID="id_concorrente" runat="server" />
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_mercado_textconcorrentes" runat="server" Width="330px"></asp:TextBox>
                            <ajax:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" TargetControlID="emp_mercado_textconcorrentes" Enabled="true"
                            ServicePath="PWebService.asmx" ServiceMethod="GetCompletionListProjeto" EnableCaching="true" UseContextKey="True" MinimumPrefixLength="2"
                            CompletionInterval="300" CompletionSetCount="5" ShowOnlyCurrentWordInCompletionListItem="true" OnClientItemSelected="GetCode" ></ajax:AutoCompleteExtender>
                            </td>
                        <td rowspan="3">
                            
                            <asp:TextBox ID="emp_mercado_textnoticias" runat="server" Height="130px" 
                                TextMode="MultiLine" Width="330px"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                            <asp:Label ID="Label69" runat="server" Text="faturamento"></asp:Label>
                        </td>
                        <td class="style14">
                            <asp:Button ID="emp_mercado_abordagem" runat="server" Height="20px" onclick="Button15_Click" 
                                Text="adicionar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                            <asp:DropDownList ID="emp_mercado_dropfaturamento" runat="server" Height="20px" 
                                Width="330px" DataSourceID="emp_faturamento" DataTextField="descricao" 
                                DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_faturamento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_faturamento]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style14" rowspan="4">
                            <asp:ListBox ID="emp_mercado_listconcorrentes" runat="server" 
                                DataSourceID="emp_mercado_concorrentes" DataTextField="concorrente" 
                                DataValueField="id" Width="330px" Height="90px"></asp:ListBox>
                            <asp:SqlDataSource ID="emp_mercado_concorrentes" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_concorrentes" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                        <asp:Label ID="Label71" runat="server" Text="origem*"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="emp_mercado_droporigem" ErrorMessage="preencher o campo" 
                                InitialValue="Escolha a Opção" ValidationGroup="emp_mercado_cadastro"></asp:RequiredFieldValidator>                        
                            
                        </td>
                        <td>
                            <asp:Button ID="emp_mercado_noticia" runat="server" Height="20px" onclick="Button17_Click" 
                                Text="incluir" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                            
                            <asp:DropDownList ID="emp_mercado_droporigem" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="Emp_pais" DataTextField="nome" 
                                DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            
                        </td>
                        <td rowspan="2">
                            <asp:Label ID="Label128" runat="server" Text="notícias anteriores"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Button ID="emp_mercado_cadastrar" runat="server" Height="20px" onclick="Button25_Click" 
                                Text="cadastrar" ValidationGroup="emp_mercado_cadastro" Width="120px" />
                        </td>
                        <td class="style14">
                            <asp:Button ID="Button1" runat="server" Height="20px" onclick="Button1_Click" 
                                Text="atualizar" ValidationGroup="emp_mercado_cadastro" Visible="False" 
                                Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        <td class="style14">
                            &nbsp;</td>
                        <td>
                        <asp:Panel ID="Panel5" runat="server"  Height="220px" Width="330px"  style="overflow:auto">
                            <asp:GridView ID="emp_mercado_gridnoticias" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataKeyNames="news" DataSourceID="emp_gridnoticias" 
                                onselectedindexchanged="emp_mercado_gridnoticias_SelectedIndexChanged" 
                                PageSize="3" Width="330px" BackColor="White" BorderColor="#DEDFDE" 
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                                GridLines="Vertical" AllowSorting="True">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="news" HeaderText="news" SortExpression="news" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#FFA079" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                            </asp:Panel>
                            <asp:SqlDataSource ID="emp_gridnoticias" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_news" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View runat=server ID="emp_observacoes">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style21">
                            <asp:Label ID="mensagem_emp_observacoes" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style21" align="right">
                            <asp:Label ID="Label145" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em importante"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Label ID="Label129" runat="server" Text="observações anteriores"></asp:Label>
                        </td>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style21">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="3">
                            <asp:GridView ID="emp_gridobs" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                DataKeyNames="obs" DataSourceID="emp_obs_gridobs" ForeColor="Black" 
                                GridLines="Vertical" onrowdatabound="emp_gridobs_RowDataBound" 
                                onselectedindexchanged="GridView3_SelectedIndexChanged" PageSize="8" 
                                Width="1010px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" Visible="False" />
                                    <asp:BoundField DataField="mini_obs" HeaderText="mini_obs" ReadOnly="True" 
                                        SortExpression="mini_obs" Visible="False" />
                                    <asp:BoundField DataField="obs" HeaderText="obs" ReadOnly="True" 
                                        SortExpression="obs" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#FFA079" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="emp_obs_gridobs" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_obs" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="2">
                            <asp:Label ID="Label73" runat="server" Text="observações"></asp:Label>
                        </td>
                        <td class="style21">
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="3">
                            <asp:TextBox ID="emp_observacoes_textobs" runat="server" Height="202px" 
                                TextMode="MultiLine" Width="1010px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Button ID="emp_observacao_adicionar" runat="server" Height="20px" onclick="Button19_Click" 
                                Text="adicionar" Width="120px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button20" runat="server" Height="20px" onclick="Button20_Click" 
                                Text="limpar" Width="120px" />
                        </td>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style21">
                            <asp:Button ID="Button18" runat="server" Height="20px" Text="exibir" 
                                Width="120px" Visible="False" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View runat=server ID="emp_financeiro">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style21">
                            <asp:Label ID="mensagem_emp_financeiro" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                            </td>
                        <td colspan="2">
                            &nbsp;</td>
                        <td class="style21" align="right">
                            <asp:Label ID="Label146" runat="server" Font-Bold="True" ForeColor="#FF6666" 
                                Text="você está em financeiro"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label81" runat="server" Text="sucesso"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label82" runat="server" Text="retainer"></asp:Label>
                        </td>
                        <td class="style21">
                            <asp:Label ID="Label76" runat="server" Text="particularidades"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            
                        </td>
                        <td colspan="2">
                            <script src="js/mascara.js" type=text/javascript></script>
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_financeiro_textsucesso" runat="server" Width="95px" onkeyup="formataValor (this,event);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_financeiro_textretainer" runat="server" Width="95px" onkeyup="formataValor (this,event);"></asp:TextBox>
                        </td>
                        <td class="style21" rowspan="6">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_financeiro_textparticularidades" runat="server" Height="124px" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Label ID="Label75" runat="server" Text="impostos"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label83" runat="server" Text="%1 parcela"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label ID="Label84" runat="server" Text="%2 parcela"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label ID="Label85" runat="server" Text="%3 parcela"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:DropDownList ID="emp_financeiro_dropimpostos" runat="server" Height="20px" 
                                Width="330px" AppendDataBoundItems="True" 
                                DataSourceID="emp_financeiro_impostos" DataTextField="descricao" 
                                DataValueField="id">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_financeiro_impostos" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao], [aliquota] FROM [vw_emp_impostos]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_financeiro_textprimeiraparcela" runat="server" 
                                Width="65px" MaxLength="3"></asp:TextBox>
                            &nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_financeiro_textsegundaparcela" runat="server" Width="65px" 
                                MaxLength="3"></asp:TextBox>
                            &nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="emp_financeiro_texterceiraparcela" runat="server" Width="65px" 
                                MaxLength="3"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Button ID="emp_financeiro_cadastra_imposto" runat="server" Height="20px" Text="incluir" 
                                Width="120px" onclick="Button21_Click" />
                        </td>
                        <td class="style24">
                            <asp:Label ID="Label87" runat="server" Text="vencimento"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label86" runat="server" Text="modo de pagamento"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Label ID="Label91" runat="server" Text="lista de impostos"></asp:Label>
                        </td>
                        <td class="style24">
                            <asp:DropDownList ID="emp_financeiro_dropvencimento" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="emp_financeiro_vencimento" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="66px" 
                                AutoPostBack="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="emp_financeiro_vencimento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_emp_dias]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="emp_financeiro_radiopagamento" runat="server">
                                <asp:ListItem Value="1">Boleto</asp:ListItem>
                                <asp:ListItem Value="2">Crédito em Conta</asp:ListItem>
                                <asp:ListItem Selected="True" Value="3">À definir</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21" rowspan="6">
                            <asp:ListBox ID="emp_financeiro_listimpostos" runat="server" Height="146px" Width="330px" 
                                DataSourceID="emp_financeiro_listaimpostos" DataTextField="imposto" 
                                DataValueField="id">
                            </asp:ListBox>
                            <asp:SqlDataSource ID="emp_financeiro_listaimpostos" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_emp_fin_impostos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="IDempresa" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2" 
                            style="border-top-style: dashed; border-right-style: dashed; border-left-style: dashed; border-color: #000000; border-width: thin">
                            <asp:Label ID="Label123" runat="server" Text="Inserir ou visualizar contrato"></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2" 
                            style="border-width: thin; border-style: none dashed none dashed; border-color: #000000;">
                            <asp:FileUpload ID="Upload_Contrato" runat="server" Height="22px" 
                                Width="230px" />
                        </td>
                        <td class="style21">
                            <asp:Button ID="Button22" runat="server" Height="20px" Text="salvar" 
                                Width="120px" onclick="Button22_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" 
                            style="border-width: thin; border-color: #000000; border-right-style: dashed; border-left-style: dashed">
                            <asp:DropDownList ID="emp_financeiro_contrato" runat="server" Height="22px" 
                                Width="163px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                                <asp:ListItem Value="1">Português</asp:ListItem>
                                <asp:ListItem Value="2">Inglês</asp:ListItem>
                                <asp:ListItem Value="3">Espanhol</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style21" rowspan="4">
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="style25" 
                            style="border-bottom-style: dashed; border-left-style: dashed; border-width: thin; border-color: #000000">
                            <asp:Button ID="emp_financeiro_salvar_contrato" runat="server" Height="20px" onclick="Button23_Click" 
                                Text="salvar contrato" Width="120px" />
                        </td>
                        <td class="style25" 
                            style="border-bottom-style: dashed; border-right-style: dashed; border-width: thin; border-color: #000000">
                            <asp:Button ID="emp_financeiro_abrir_contrato" runat="server" Height="20px" onclick="Button24_Click" 
                                Text="abrir contrato" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="emp_financeiro_cadastrar" runat="server" Height="20px" Text="cadastrar" 
                                Width="120px" onclick="Button26_Click" 
                                ValidationGroup="emp_financeiro_cadastro" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View runat=server ID="emp_relatorio">                
                <table class="style27">
                    <tr>
                        <td><asp:Panel ID="Panel1" runat="server"  Height="126px" Width="507px"  style="overflow:auto">
                <asp:GridView ID="retorno_empresa" runat="server" 
                    AutoGenerateColumns="False" Visible="False">
                    <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cnpj" HeaderText="cnpj" SortExpression="cnpj">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="razao_social" HeaderText="razao_social" 
                                SortExpression="razao_social">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="segmento" HeaderText="segmento" 
                                SortExpression="segmento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="endereco" HeaderText="endereco" 
                                SortExpression="endereco">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="numero" HeaderText="numero" SortExpression="numero">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="complemento" HeaderText="complemento" 
                                SortExpression="complemento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bairro" HeaderText="bairro" SortExpression="bairro">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cidade" HeaderText="cidade" SortExpression="cidade">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="offlimits" HeaderText="offlimits" 
                                SortExpression="offlimits">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cep" HeaderText="cep" SortExpression="cep">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="site" HeaderText="site" SortExpression="site">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cod_pais" HeaderText="cod_pais" 
                                SortExpression="cod_pais">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ddd" HeaderText="ddd" SortExpression="ddd">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tipo_tel" HeaderText="tipo_tel" 
                                SortExpression="tipo_tel">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="telefone" HeaderText="telefone" 
                                SortExpression="telefone">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dt_criacao" HeaderText="dt_criacao" 
                                SortExpression="dt_criacao">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dt_ult_alteracao" HeaderText="dt_ult_alteracao" 
                                SortExpression="dt_ult_alteracao">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pais" HeaderText="pais" SortExpression="pais">
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
                            <asp:BoundField DataField="funcionarios" HeaderText="funcionarios" 
                                SortExpression="funcionarios">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="faturamento" HeaderText="faturamento" 
                                SortExpression="faturamento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="origem" HeaderText="origem" 
                                SortExpression="origem">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="id_grupo" HeaderText="id_grupo" 
                                SortExpression="id_grupo">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="grupo" HeaderText="grupo" 
                                SortExpression="grupo">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                </asp:GridView>
                </asp:Panel></td>
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
        .style10
        {
            height: 21px;
        }
        .style12
        {
            width: 335px;
            margin-left: 40px;
        }
        .style14
        {
        }
        .style15
        {
            width: 335px;
            height: 27px;
        }
        .style17
        {
            width: 335px;
            height: 30px;
        }
        .style19
        {
            height: 30px;
        }
        .style20
        {
            width: 335px;
            height: 22px;
        }
        .style21
        {
            width: 335px;
        }
        .style24
        {
            width: 147px;
        }
        .style25
        {
            height: 26px;
        }
        .style27
        {
            width: 100%;
        }
        </style>
</asp:Content>