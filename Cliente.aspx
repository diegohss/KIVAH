<%@ Page SmartNavigation="true" MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="HavikTeste.Cliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<script runat="server">

    protected void menuResearcher_MenuItemClick(object sender, MenuEventArgs e)
    {
        int index = Int32.Parse(e.Item.Value);
        MultiView3.ActiveViewIndex = index;
    }
</script>
<script runat="server">

    protected void menuConsultor_MenuItemClick(object sender, MenuEventArgs e)
    {
        int index = Int32.Parse(e.Item.Value);
        MultiView4.ActiveViewIndex = index;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {            margin-left: 40px;
        }
        .style16
        {
            width: 335px;
            height: 21px;
        }
        .style17
        {
    }
        .style21
        {
        }
        .style25
        {
        }
        .style28
        {
        }
        .style29
        {
            width: 387px;
        }
        .style30
        {
        }
        .style33
        {
            margin-left: 40px;
        }
        .style35
        {
            margin-left: 40px;
        }
        .style37
        {
            margin-left: 40px;
        }
        .style39
        {
            width: 336px;
            height: 21px;
        }
        .style40
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="title" BackColor="#C7E2FF">
    <asp:Panel ID="resumoCliente" runat="server" Height="128px" Width="100%" 
        BackColor="#C7E2FF">
                    <asp:Panel ID="grid_cliente" runat="server" BackColor="#C7E2FF" Height="126px" 
                        style="overflow:auto" Width="100%">
                        <asp:GridView ID="grid_busca_cliente" runat="server" 
                            AutoGenerateColumns="False" 
                            onselectedindexchanged="grid_busca_cliente_SelectedIndexChanged" 
                            Width="330px" DataKeyNames="id_cliente,hexa">
                            <Columns>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Idade" HeaderText="Idade" SortExpression="Idade">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                        SortExpression="id_empresa" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultima_Empresa" HeaderText="Ultima_Empresa" 
                                        SortExpression="Ultima_Empresa">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="filial" HeaderText="filial" SortExpression="filial">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Qtd_Projetos_Participou" 
                                        HeaderText="Qtd_Projetos_Participou" SortExpression="Qtd_Projetos_Participou">
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
                                    <asp:BoundField DataField="Ultimo_Segmento" HeaderText="Ultimo_Segmento" 
                                        SortExpression="Ultimo_Segmento">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_cargo" HeaderText="id_cargo" 
                                        SortExpression="id_cargo" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ultimo_Cargo" HeaderText="Ultimo_Cargo" 
                                        SortExpression="Ultimo_Cargo">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="salario" HeaderText="salario" 
                                        SortExpression="salario">
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
                                        SortExpression="cicatriz" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="hexa" HeaderText="hexa" 
                                        SortExpression="hexa" Visible="False">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                        SortExpression="id_cliente">
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                        </asp:GridView>
                    </asp:Panel>
    </asp:Panel>
    </div>
    <div class="clear">
    <asp:Menu ID="menuCliente" runat="server" CssClass="menuEmpresa" OnMenuItemClick="menuCliente_MenuItemClick"
        IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" BorderWidth="1px" Width="100%">
        <Items>
            <asp:MenuItem Text="dados cadastrais" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="profissional" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="acadêmico" Value="2"></asp:MenuItem>            
            <asp:MenuItem Text="hierarquia" Value="7"></asp:MenuItem>                       
            <asp:MenuItem Text="pré-entrevista" Value="5"></asp:MenuItem>
            <asp:MenuItem Text="entrevista" Value="6"></asp:MenuItem>
            <asp:MenuItem Text="status" Value="4"></asp:MenuItem>
            <asp:MenuItem Text="projeto" Value="3"></asp:MenuItem> 
        </Items>
    </asp:Menu>
    </div>
    <body>
        <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>        
        <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
            <asp:View ID="cli_dadoscadastrais" runat="server">
                <table class="style1" border="0">
                    <tr>
                        <td class="style33">
                            <asp:Label ID="mensagem_cli_dadoscadastrais" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style37" colspan="3">
                            &nbsp;</td>
                        <td class="style37" align="left">
                            <asp:Label ID="cli_dadoscadastrais_label_id" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                        </td>
                        <td align="right" class="style37">
                            <asp:Label ID="Label155" runat="server" Font-Bold="True" ForeColor="#0099CC" 
                                Text="você está em dados cadastrais"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:Label ID="Label1" runat="server" Text="nome*"></asp:Label>
                        </td>
                        <td class="style37">
                            <asp:Label ID="Label4" runat="server" Text="sexo*"></asp:Label>
                        </td>
                        <td class="style37" colspan="2" rowspan="4">                        
                        <img src="Foto.ashx" height="140px" width="120px" />                            
                            </td>
                        <td class="style37">
                            <asp:Label ID="Label6" runat="server" Text="email*"></asp:Label>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="cli_dadoscadastrais_textemail" 
                                ErrorMessage="e-mail inválido" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="validadadoscadastraisemail" Width="131px"></asp:RegularExpressionValidator>
                        </td>
                        <td class="style37">
                            <asp:Button ID="cli_dadoscadastrais_reporta_duplicidade" runat="server" 
                                Height="20px" Text="reportar duplicidade" Width="140px" 
                                onclick="cli_dadoscadastrais_reporta_duplicidade_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_dadoscadastrais_textnome" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style37">
                            <asp:DropDownList ID="cli_dadoscadastrais_dropsexo" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_dadoscadastrais_sexo" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="60px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_sexo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_sexo]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style37" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_dadoscadastrais_textemail" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:Label ID="Label25" runat="server" Text="endereço"></asp:Label>
                        </td>
                        <td class="style37">
                            <asp:Label ID="Label172" runat="server" Text="RG"></asp:Label>
                        </td>
                        <td class="style37" colspan="2">
                            <asp:Button ID="cli_dadoscadastrais_adiciona_email" runat="server" 
                                Height="20px" onclick="Button22_Click" 
                                Text="adicionar" Width="120px" 
                                ValidationGroup="validadadoscadastraisemail" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:TextBox ID="cli_dadoscadastrais_textendereco" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style37">
                            <asp:TextBox ID="cli_dadoscadastrais_textrg" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="100px"></asp:TextBox>
                        </td>
                        <td class="style37" rowspan="5" colspan="2">
                        <asp:Panel ID="Panel3" runat="server"  Height="120px" Width="320px"  style="overflow:auto">
                            <asp:GridView ID="cli_dadoscadastrais_grid_email" runat="server" 
                                AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="cli_dadoscadastrais_gridemail" PageSize="5"
                                onselectedindexchanged="cli_dadoscadastrais_grid_email_SelectedIndexChanged" 
                                AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
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
                            </asp:Panel>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_gridemail" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_email" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:Label ID="Label174" runat="server" Text="número"></asp:Label>
                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label178" runat="server" Text="complemento"></asp:Label>
                            </td>
                        <td class="style37" colspan="2">
                            <asp:Label ID="Label167" runat="server" Text="CPF"></asp:Label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                                ControlToValidate="cli_dadoscadastrais_textcpf" 
                                ErrorMessage="Digite um CPF válido" ValidationExpression="^\d{11}$">*</asp:RegularExpressionValidator>
                        </td>
                        <td class="style37">
                            <asp:Label ID="cli_dadoscadastrais_label_idade" runat="server" Text=""></asp:Label>
                         </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:TextBox ID="cli_dadoscadastrais_textnro" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="80px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="cli_dadoscadastrais_textcomplemento" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="130px"></asp:TextBox>
                            </td>
                        <td class="style37" colspan="2">
                             
                            <asp:TextBox ID="cli_dadoscadastrais_textcpf" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="100px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="cli_dadoscadastrais_textcpf_MaskedEditExtender" 
                                runat="server" Mask="999,999,999-99" 
                                TargetControlID="cli_dadoscadastrais_textcpf"></ajax:MaskedEditExtender>
                             
                        </td>
                        <td class="style37">
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" rowspan="2">
                            
                             
                            <asp:Label ID="Label26" runat="server" Text="CEP"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label28" runat="server" Text="bairro"></asp:Label>
                            
                             
                        </td>
                        <td class="style37" colspan="3">
                            <asp:Label ID="Label3" runat="server" Text="nascimento"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="estado civil"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style37" colspan="3">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="cli_dadoscadastrais_textnascimento" 
                                ErrorMessage="digite uma data válida" ValidationExpression="^\d{8}$" 
                                ValidationGroup="validacadastrocliente">
                            </asp:RegularExpressionValidator>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_estadocivil" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_estado_civil]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                        <script src="js/mascara.js" type="text/javascript"></script>    
                        <asp:TextBox ID="cli_dadoscadastrais_textcep" runat="server" onkeyup="formataCEP (this,event);"
                                onkeydown="return (event.keyCode!=13);" Width="80px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="cli_dadoscadastrais_textbairro" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="155px"></asp:TextBox>
                            </td>
                        <td class="style37" colspan="3">
                            <asp:TextBox ID="cli_dadoscadastrais_textnascimento" runat="server" 
                                Height="22px" onkeydown="return (event.keyCode!=13);" Width="80px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MascaraClienteDataCadastro" runat="server" 
                                Mask="99/99/9999" TargetControlID="cli_dadoscadastrais_textnascimento"></ajax:MaskedEditExtender>
                            &nbsp;&nbsp;&nbsp;<asp:DropDownList ID="cli_dadoscadastrais_dropestadocivil" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_dadoscadastrais_estadocivil" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="120px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style37" colspan="2">
                            <asp:Label ID="Label19" runat="server" Text="cod. país"></asp:Label>
                            &nbsp;<asp:Label ID="Label23" runat="server" Text="DDD"></asp:Label>
                            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label24" runat="server" Text="telefone*"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label127" runat="server" Text="tipo*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            
                            
                            <asp:Label ID="Label30" runat="server" Text="estado*"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label175" runat="server" 
                                Text="cidade*"></asp:Label>
                        </td>
                        <td class="style37" colspan="3">
                            <asp:Label ID="Label173" runat="server" Text="nome do pai"></asp:Label>
                        </td>
                        <td class="style37" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_dadoscadastrais_textcodpais" runat="server" Height="18px" 
                                Width="40px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="9999" 
                                TargetControlID="cli_dadoscadastrais_textcodpais"></ajax:MaskedEditExtender>
                            &nbsp;&nbsp;<asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_dadoscadastrais_textddd" runat="server" Height="18px" 
                                Width="40px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="9999" 
                                TargetControlID="cli_dadoscadastrais_textddd"></ajax:MaskedEditExtender>
                            &nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_dadoscadastrais_texttelefone" runat="server" Height="19px" 
                                Width="70px"></asp:TextBox>
                            &nbsp;<ajax:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                                Mask="9999999999" TargetControlID="cli_dadoscadastrais_texttelefone"></ajax:MaskedEditExtender>
                            <asp:DropDownList ID="cli_dadoscadastrais_drop_tipotel" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_dadoscadastrais_drop_tp_tel" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="80px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_drop_tp_tel" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_tp_telefone]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:DropDownList ID="cli_dadoscadastrais_dropestado" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="cli_dadoscadastrais_estado" DataTextField="ufsigla" 
                                DataValueField="ufcod" Height="23px" 
                                OnSelectedIndexChanged="ddldadoscadastrais_estado_SelectedIndexChanged" 
                                Width="80px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_estado" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [ufcod], [ufsigla] FROM [vw_cli_estados]">
                            </asp:SqlDataSource>
                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList 
                                ID="cli_dadoscadastrais_dropcidade" runat="server" 
                                DataSourceID="cli_dadoscadastrais_cidade" DataTextField="munnome" 
                                DataValueField="muncod" Height="23px" Width="180px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_cidade" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_cidade" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cli_dadoscadastrais_dropestado" Name="ufcod" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style37" colspan="3">
                            <asp:TextBox ID="cli_dadoscadastrais_textnomepai" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="330px"></asp:TextBox>
                        </td>
                        <td class="style37" colspan="2">
                            <asp:Button ID="cli_dadoscadastrais_adiciona_telefone" runat="server" Height="20px" onclick="Button23_Click" 
                                Text="adicionar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">         
                        <asp:Label ID="Label177" runat="server" Text="país"></asp:Label>
                        </td>
                        <td class="style37" colspan="3">
                            
                            <asp:Label ID="Label171" runat="server" Text="nome da mãe"></asp:Label>
                            
                        </td>
                        <td class="style37" rowspan="6" colspan="2">
                        <asp:Panel ID="Panel4" runat="server"  Height="160px" Width="320px"  style="overflow:auto">
                            <asp:GridView ID="cli_dadoscadastrais_gridtelefone" runat="server" 
                                AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="cli_dadoscadastrais_source_gridtelefone" Height="66px" 
                                PageSize="5" Width="330px"                                
                                onselectedindexchanged="cli_dadoscadastrais_gridtelefone_SelectedIndexChanged" 
                                AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" 
                                        SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="cod_pais" HeaderText="cod_pais" 
                                        SortExpression="cod_pais" Visible="False" />
                                    <asp:BoundField DataField="ddd" HeaderText="ddd" 
                                        SortExpression="ddd" />
                                    <asp:BoundField DataField="telefone" HeaderText="telefone" 
                                        SortExpression="telefone" />
                                    <asp:BoundField DataField="id_tp_telefone" HeaderText="id_tp_telefone" 
                                        SortExpression="id_tp_telefone" Visible="False" />
                                    <asp:BoundField DataField="tipo_telefone" HeaderText="tipo_telefone" 
                                        SortExpression="tipo_telefone" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
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
                            </asp:Panel>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_source_gridtelefone" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_telefone" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:DropDownList ID="cli_dadoscadastrais_droppais" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="ListaPaises1" DataTextField="nome" 
                                DataValueField="id" Height="22px" Width="155px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ListaPaises1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome] FROM [vw_cli_paises]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style37" colspan="3">
                            <asp:TextBox ID="cli_dadoscadastrais_textnomemae" runat="server" 
                                onkeydown="return (event.keyCode!=13);" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            
                            &nbsp;</td>
                        <td class="style37" colspan="3">
                            <asp:Label ID="Label183" runat="server" Text="UF"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label182" runat="server" Text="naturalidade"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            &nbsp;</td>
                        <td class="style37" colspan="3">
                            <asp:DropDownList ID="cli_dadoscadastrais_dropestadouf" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                datasourceid="cli_dadoscadastrais_estadouf" DataTextField="ufsigla" 
                                DataValueField="ufcod" Height="23px" 
                                OnSelectedIndexChanged="ddldadoscadastrais_estadouf_SelectedIndexChanged" 
                                Width="80px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_estadouf" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [ufcod], [ufsigla] FROM [vw_cli_estados]">
                            </asp:SqlDataSource>
                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="cli_dadoscadastrais_dropnaturalidade" 
                                runat="server" datasourceid="cli_dadoscadastrais_naturalidade" 
                                DataTextField="munnome" DataValueField="muncod" Height="23px" Width="180px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_naturalidade" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_cidade" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cli_dadoscadastrais_dropestadouf" Name="ufcod" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:Button ID="Button62" runat="server" Height="20px" onclick="Button46_Click" 
                                Text="atualizar" Width="120px" Visible="False" />
                        </td>
                        <td class="style37" colspan="3">
                            
                            <asp:Button ID="cli_dadoscadastrais_cadastrar" runat="server" Height="20px" 
                                onclick="Button35_Click" Text="cadastrar" 
                                ValidationGroup="validacadastrocliente" Width="120px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button60" runat="server" Height="20px" 
                                onclick="Button60_Click" Text="novo cadastro" Width="120px" />
                            
                            </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            &nbsp;</td>
                        <td class="style37" colspan="3">
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="cli_profissional" runat="server">
                <br />
                <table class="style1">
                    <tr>
                    <td class="style3" colspan="4">
                        <asp:Label ID="mensagem_cli_profissional" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                        </td>
                        <td align="right" class="style3" colspan="4">
                            <asp:Label ID="Label156" runat="server" ForeColor="#0099CC" 
                                Text="você está em profissional" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="6" rowspan="4">
                        <asp:Panel ID="Panel6" runat="server"  Height="280px" Width="660px"  style="overflow:auto">
                        <asp:GridView ID="cli_profissional_grid_cadastro" runat="server" AllowPaging="True" Height="200px" 
                                Width="670px" AutoGenerateColumns="False" 
                                DataSourceID="cli_profissional_gridcadastro" AllowSorting="True" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowDataBound="cli_profissional_grid_cadastro_RowDataBound"
                                
                                
                                
                                
                                
                                
                                onselectedindexchanged="cli_profissional_grid_cadastro_SelectedIndexChanged" 
                                DataKeyNames="id,id_filial,filial,id_empresa,empresa,dt_inicio,dt_saida,id_cargo,salario,bonus,id_tipo_contrato,variavel_mensal">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" 
                                        SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                        SortExpression="id_cliente" Visible="False" />
                                    <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                        SortExpression="id_empresa" Visible="False" />
                                    <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                        SortExpression="empresa" ReadOnly="True" />
                                    <asp:BoundField DataField="dt_inicio" HeaderText="dt_inicio"
                                        SortExpression="dt_inicio" DataFormatString="{0:dd/MM/yyyy hh:mm}"/>
                                    <asp:BoundField DataField="dt_saida" HeaderText="dt_saida"
                                        SortExpression="dt_saida" DataFormatString="{0:dd/MM/yyyy hh:mm}"/>
                                    <asp:BoundField DataField="id_cargo" HeaderText="id_cargo" 
                                        SortExpression="id_cargo" Visible="False" />
                                    <asp:BoundField DataField="cargo" HeaderText="cargo" 
                                        SortExpression="cargo" />
                                    <asp:BoundField DataField="salario" HeaderText="salario" DataFormatString="{0:C2}"
                                        SortExpression="salario" ReadOnly="True" ItemStyle-Wrap="False" >
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="bonus" HeaderText="bonus" DataFormatString="{0:C2}"
                                        SortExpression="bonus" ReadOnly="True" ItemStyle-Wrap="False" >
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="variavel_mensal" HeaderText="variavel_mensal" DataFormatString="{0:C2}"
                                        SortExpression="variavel_mensal" ReadOnly="True" ItemStyle-Wrap="False" >
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="total_cash" HeaderText="total_cash" DataFormatString="{0:C2}"
                                        SortExpression="total_cash" ReadOnly="True" />
                                    <asp:BoundField DataField="id_contato" HeaderText="id_contato" 
                                        SortExpression="id_contato" InsertVisible="False" ReadOnly="True" 
                                        Visible="False" />
                                    <asp:BoundField DataField="tipo_contato" HeaderText="tipo_contato" 
                                        SortExpression="tipo_contato" />
                                    <asp:BoundField DataField="id_filial" HeaderText="id_filial" 
                                        SortExpression="id_filial" InsertVisible="False" ReadOnly="True" 
                                        Visible="False" />
                                    <asp:BoundField DataField="filial" HeaderText="filial"
                                        SortExpression="filial" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" DataFormatString="{0:dd/MM/yyyy hh:mm}"/>
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                    <asp:BoundField DataField="id_tipo_contrato" HeaderText="id_tipo_contrato" 
                                        SortExpression="id_tipo_contrato" InsertVisible="False" ReadOnly="True" 
                                        Visible="False" />
                                    <asp:BoundField DataField="tipo_contrato" HeaderText="tipo_contrato" 
                                        SortExpression="tipo_contrato" />
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
                            <asp:SqlDataSource ID="cli_profissional_gridcadastro" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_profissional" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                            <td class="style30">
                                
                            </td>
                            <td class="style30">
                                <asp:Label ID="Label104" runat="server" Text="benefícios atuais"></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            <div ;="" style="position:relative; overflow:auto; height:180px; width:160px">
                                <asp:CheckBoxList ID="cli_profissional_checkboxlist_beneficios" runat="server" 
                                    DataSourceID="cli_profissional_beneficios" DataTextField="descricao" 
                                    DataValueField="id" Height="120px" Width="160px">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="cli_profissional_beneficios" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                    SelectCommand="SELECT [id], [descricao] FROM [vw_beneficios]">
                                </asp:SqlDataSource>
                            </div>
                            
                        </td>
                        <td class="style30">
                            
                            <asp:ListBox ID="cli_profissional_listabeneficios" runat="server" 
                                DataSourceID="cli_profissional_listbeneficios" DataTextField="beneficios" 
                                DataValueField="id_beneficios" Height="169px" Width="160px"></asp:ListBox>
                            <asp:SqlDataSource ID="cli_profissional_listbeneficios" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_beneficios" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            <asp:Button ID="cli_profissional_adiciona_beneficios0" runat="server" 
                                Height="20px" onclick="Button45_Click" Text="adicionar" Width="120px" />
                        </td>
                        <td class="style30">
                            <asp:Button ID="cli_profissional_exclui_beneficio" runat="server" Height="20px" 
                                onclick="Button55_Click" Text="excluir" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30" colspan="2">
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:Label ID="Label135" runat="server" Text="empresa*"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="Label186" runat="server" Text="área*"></asp:Label>
                        </td>
                        <td class="style30" colspan="2" 
                            style="border-top-style: dashed; border-right-style: dashed; border-left-style: dashed; border-width: thin; border-color: #000000">
                            <asp:Label ID="Label187" runat="server" Text="Inserir ou visualizar documento"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16" colspan="3">                            
                            <script language="javascript" type="text/javascript">
                                function GetCodeEmpresaCli(sender, e) {
                                    $get("<%=id_empresa.ClientID %>").value = e.get_value();
                                }
                            </script>
                            <asp:HiddenField ID="id_empresa" runat="server" />
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_profissional_empresatext" runat="server" 
                                AutoComplete="off" Width="190px"></asp:TextBox>
                            &nbsp;<asp:Button ID="cli_profissional_empresa" runat="server" Height="20px" 
                                    style="margin-bottom: 0px" Text="procurar" Width="120px" 
                                onclick="cli_profissional_empresa_Click" />                           
                            
                        </td>
                        <td class="style21" colspan="3">
                            <script src="js/mascara.js" type="text/javascript">
</script>
                            <asp:DropDownList ID="cli_profissional_droparea" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" 
                                DataSourceID="cli_profissional_area" DataTextField="descricao" 
                                DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlarea_SelectedIndexChanged" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_profissional_area" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT DISTINCT [id], [descricao] FROM [vw_area]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style30" colspan="2" 
                            style="border-color: #000000; border-right-style: dashed; border-left-style: dashed; z-index: auto; border-right-width: thin; border-left-width: thin;">
                                                       
                            <asp:FileUpload ID="Upload_Curriculum" runat="server" />                                                        
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:Label ID="filial" runat="server" Text="filial"></asp:Label>
                        </td>
                        <td colspan="3">
                            
                            
                            
                            <asp:Label ID="Label179" runat="server" Text="subdivisão*"></asp:Label>
                        </td>
                        <td class="style30" colspan="2" 
                            style="border-color: #000000; border-right-style: dashed; border-left-style: dashed; z-index: auto; border-right-width: thin; border-left-width: thin;">
                            <asp:DropDownList ID="cli_profissional_idioma_cv" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_dadoscadastrais_droptipo_anexo" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="218px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_dadoscadastrais_droptipo_anexo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_prof_anexo" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <script language="javascript" type="text/javascript">
                            
                            </script>
                            <asp:HiddenField ID="id_filial" runat="server" />
                            <asp:TextBox ID="txtPopupValue" Width="190px" runat="server"></asp:TextBox>
                            &nbsp;
                            <asp:Button ID="cli_profissional_filial" runat="server" Height="20px" 
                                style="margin-bottom: 0px" Text="procurar" Width="120px" onclick="Button63_Click"/>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="cli_profissional_dropsubdivisao" runat="server" 
                                AutoPostBack="true" DataSourceID="cli_profissional_subdivisao" 
                                DataTextField="subdivisao" DataValueField="id_subdivisao" Height="20px" 
                                Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_profissional_subdivisao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_subdivisao" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cli_profissional_droparea" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style30" 
                            style="border-bottom-style: dashed; border-left-style: dashed; border-width: thin; border-color: #000000">
                            <asp:Button ID="cli_profissional_salvar_cv" runat="server" Height="20px" 
                                onclick="Button52_Click" style="margin-bottom: 0px" Text="salvar" 
                                ValidationGroup="valida_cadastro_cv" Width="120px" />
                        </td>
                        <td class="style30" 
                            style="border-bottom-style: dashed; border-right-style: dashed; border-color: #000000; border-right-width: thin; border-bottom-width: thin; z-index: inherit;">
                            <asp:Button ID="Button53" runat="server" Height="20px" onclick="Button53_Click" 
                                style="margin-bottom: 0px" Text="abrir" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:Label ID="Label126" runat="server" Text="tipo de contato"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="Label180" runat="server" Text="segmento*"></asp:Label>
                        </td>
                        <td class="style30" colspan="2">
                            <asp:Label ID="Label165" runat="server" Text="anexos do cliente"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:DropDownList ID="cli_profissional_drop_tp_contato" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_profissional_tp_contato" 
                                DataTextField="descricao" DataValueField="id" Height="22px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_profissional_tp_contato" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_tp_contato]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="3">
                        
                           
                            <asp:DropDownList ID="cli_profissional_dropsegmento" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" 
                                DataSourceID="cli_profissional_segmento" DataTextField="descricao" 
                                DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_profissional_segmento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT DISTINCT [id], [descricao] FROM [vw_cli_segmento]">
                            </asp:SqlDataSource>
                        
                           
                        </td>
                        <td class="style30" colspan="2" rowspan="4">
                            <asp:Panel ID="Panel10" runat="server" Height="140px" style="overflow:auto" 
                                Width="300px">
                                <asp:GridView ID="cli_profissional_grid_anexos" runat="server" 
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                    DataSourceID="cli_profissional_anexos" ForeColor="Black" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                                        <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                            SortExpression="nome_usuario" />
                                        <asp:BoundField DataField="data_anexo" HeaderText="data_anexo" ReadOnly="True" 
                                            SortExpression="data_anexo" />
                                        <asp:BoundField DataField="qtd" HeaderText="qtd" ReadOnly="True" 
                                            SortExpression="qtd" />
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
                                SelectCommand="sp_vw_cli_anexos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:Label ID="Label136" runat="server" Text="cargo*"></asp:Label>
                        </td>
                        <td colspan="3">
                            
                            <asp:Button ID="cli_profissional_cadastrar_prof" runat="server" Height="20px"
                             style="margin-bottom: 0px" Text="cadastrar" Width="120px" 
                                onclick="cli_profissional_cadastrar_prof_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">                            
                            <asp:DropDownList ID="cli_profissional_dropcargo" runat="server" 
                                AppendDataBoundItems="True" 
                                DataSourceID="cli_profissional_cargo" DataTextField="descricao" 
                                DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_profissional_cargo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_cargo]">
                            </asp:SqlDataSource>                            
                        </td>
                        <td colspan="3" rowspan="5">
                        <asp:Panel ID="Panel12" runat="server" Height="160px" style="overflow:auto" Width="300px">                                              
                            <asp:GridView ID="cli_profissional_grid_codifica" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                DataKeyNames="id" DataSourceID="cli_profissional_codifica" ForeColor="Black" 
                                GridLines="Vertical" 
                                onselectedindexchanged="cli_profissional_grid_codifica_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="id_area" HeaderText="id_area" 
                                        SortExpression="id_area" Visible="False" />
                                    <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                                    <asp:BoundField DataField="id_subdivisao" HeaderText="id_subdivisao" 
                                        SortExpression="id_subdivisao" Visible="False" />
                                    <asp:BoundField DataField="subdivisao" HeaderText="subdivisao" 
                                        SortExpression="subdivisao" />
                                    <asp:BoundField DataField="id_segmento" HeaderText="id_segmento" 
                                        SortExpression="id_segmento" Visible="False" />
                                    <asp:BoundField DataField="segmento" HeaderText="segmento" 
                                        SortExpression="segmento" />
                                    <asp:BoundField DataField="usuario" HeaderText="usuario" 
                                        SortExpression="usuario" />
                                    <asp:BoundField DataField="dt_criacao" HeaderText="dt_criacao" ReadOnly="True" 
                                        SortExpression="dt_criacao" />
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
                            <asp:SqlDataSource ID="cli_profissional_codifica" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_codifica" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:Label ID="Label96" runat="server" Text="entrada"></asp:Label>
                            <asp:Label ID="Label108" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label97" runat="server" Text="saída"></asp:Label>
                            <asp:Label ID="Label107" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_profissional_dataentrada" runat="server" MaxLength="10" 
                                Width="120px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MascaraCliProfissionalDataEntrada" runat="server" 
                                Mask="99/99/9999" TargetControlID="cli_profissional_dataentrada"></ajax:MaskedEditExtender>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_profissional_datasaida" runat="server" 
                                MaxLength="10" Width="120px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MascaraCliProfissionalDataSaida" runat="server" 
                                Mask="99/99/9999" TargetControlID="cli_profissional_datasaida"></ajax:MaskedEditExtender>
                        </td>
                        <td class="style30" rowspan="8" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33">
                            
                            
                            <asp:Label ID="Label102" runat="server" Text="salário"></asp:Label>
                            </td>
                        <td class="style33">
                            <asp:Label ID="Label194" runat="server" Text="variável mensal"></asp:Label>
                        </td>
                        <td class="style33">
                            <asp:Label ID="Label103" runat="server" Text="bônus (qtde salários)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            
                            
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_profissional_textsalario" runat="server" 
                                onkeyup="formataValor (this,event);" Width="100px"></asp:TextBox>
                                                         
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="cli_profissional_textvariavel" runat="server" 
                                onkeydown="return (event.keyCode!=13);" onkeyup="formataValor (this,event);" 
                                Width="100px"></asp:TextBox>
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="cli_profissional_textbonus" runat="server" 
                                onkeydown="return (event.keyCode!=13);" onkeyup="formataDouble (this,event);" 
                                Width="40px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            
                            <asp:Label ID="Label188" runat="server" Text="modelo de contrato"></asp:Label>
                            
                        </td>
                        <td class="style6" colspan="3">
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:DropDownList ID="cli_profissional_dropmodelo_contrato" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_prof_modelocontrato" 
                                DataTextField="descricao" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_prof_modelocontrato" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_tp_contratacao]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style6" colspan="3" rowspan="4">
                        
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">                           
                                                        
                            <asp:Button ID="cli_profissional_cadastrar" runat="server" Height="20px" 
                                onclick="Button43_Click" style="margin-bottom: 0px" Text="cadastrar" 
                                ValidationGroup="valida_profissional" Width="120px" />                            
                                                        
                            &nbsp;<asp:Button ID="cli_profissional_novo_cadastro" runat="server" Height="20px" 
                                style="margin-bottom: 0px" Text="novo cadastro" Width="120px" 
                                onclick="cli_profissional_novo_cadastro_Click" />
                                                       
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidade="cli_profissional_idioma_cv" 
                                ControlToValidate="cli_profissional_idioma_cv" 
                                ErrorMessage="escolha o idioma do curriculum" InitialValue="Escolha a Opção" 
                                ValidationGroup="valida_cadastro_cv"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" colspan="3">
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" colspan="5">
                        <asp:Panel ID="Panel9" runat="server" CssClass="modalPopup" style="overflow:auto">
                            <asp:GridView ID="grid_popup_filial" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataSourceID="lista_filiais_popup" ForeColor="Black" 
                        GridLines="Vertical" AllowSorting="True" 
                        DataKeyNames="id,nome" OnSorting="GridView1_Sorting"
                                onselectedindexchanged="GridView1_SelectedIndexChanged" PageSize="6">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="id" Visible="False" />
                            <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                SortExpression="id_empresa" Visible="False" />
                            <asp:BoundField DataField="codigo" HeaderText="codigo" 
                                SortExpression="codigo" />
                            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                            <asp:BoundField DataField="cidade" HeaderText="cidade" 
                                SortExpression="cidade" />
                            <asp:BoundField DataField="telefone" HeaderText="telefone" 
                                SortExpression="telefone" />
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
                    <asp:SqlDataSource ID="lista_filiais_popup" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                        SelectCommand="sp_vw_cli_prof_filial" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="id_empresa" SessionField="id_empresa_popup" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnClose" runat="server" Text="Fechar" Width="50px" />
                    </asp:Panel>
                            <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
                            <ajax:ModalPopupExtender ID="Panel9_ModalPopupExtender" runat="server" 
                                DynamicServicePath="" Enabled="True" PopupControlID="Panel9"
                                TargetControlID="btnShowModalPopup" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></ajax:ModalPopupExtender>
                        </td>
                        <td class="style3" colspan="3">
                            <asp:Panel ID="Panel13" runat="server" CssClass="modalPopup" 
                                style="overflow:auto">
                                <asp:GridView ID="grid_popup_empresa" runat="server" 
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id,nome"
                                    ForeColor="Black" GridLines="Vertical" OnSorting="grid_popup_empresa_Sorting" 
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
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="cli_academico" runat="server">
                <br />
                <table class="style1">
                <tr>
                    <td class="style3" colspan="4">
                        <asp:Label ID="mensagem_cli_academico" runat="server" Font-Bold="True" 
                            ForeColor="Red"></asp:Label>
                        </td>
                    <td align="right" class="style3">
                        <asp:Label ID="Label157" runat="server" ForeColor="#0099CC" 
                            Text="você está em acadêmico" Font-Bold="True"></asp:Label>
                    </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <asp:Label ID="Label39" runat="server" Text="escolaridade"></asp:Label>
                        </td>
                        <td class="style3" rowspan="6">
                        <asp:Panel ID="Panel5" runat="server"  Height="140px" Width="320px"  style="overflow:auto">
                            <asp:GridView ID="cli_academico_grid_graduacao" runat="server" Width="330px" 
                                DataSourceID="cli_academico_gridgraduacao" AllowPaging="True" 
                                AutoGenerateColumns="False" DataKeyNames="id" AllowSorting="True" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                                onselectedindexchanged="cli_academico_grid_graduacao_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" 
                                        SortExpression="id" InsertVisible="False" ReadOnly="True" 
                                        Visible="False" />
                                    <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                        SortExpression="id_cliente" Visible="False" />
                                    <asp:BoundField DataField="id_escolaridade" HeaderText="id_escolaridade" 
                                        SortExpression="id_escolaridade" Visible="False" />
                                    <asp:BoundField DataField="escolaridade" HeaderText="escolaridade" 
                                        SortExpression="escolaridade" />
                                    <asp:BoundField DataField="instituicao" HeaderText="instituicao" 
                                        SortExpression="instituicao" />
                                    <asp:BoundField DataField="id_graduacao" HeaderText="id_graduacao" 
                                        SortExpression="id_graduacao" Visible="False" />
                                    <asp:BoundField DataField="graduacao" HeaderText="graduacao" 
                                        SortExpression="graduacao" />
                                    <asp:BoundField DataField="id_ano_formacao" HeaderText="id_ano_formacao" 
                                        SortExpression="id_ano_formacao" Visible="False" />
                                    <asp:BoundField DataField="ano_formacao" HeaderText="ano_formacao" 
                                        SortExpression="ano_formacao" />
                                    <asp:BoundField DataField="ano_conclusao" HeaderText="ano_conclusao" 
                                        SortExpression="ano_conclusao" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        SortExpression="dt_cadastro" ReadOnly="True" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
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
                            </asp:Panel>
                            
                            <asp:SqlDataSource ID="cli_academico_gridgraduacao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_academico" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label45" runat="server" Text="curso/certificação"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <asp:DropDownList ID="cli_academico_dropescolaridade" runat="server" Height="23px" 
                                Width="330px" DataSourceID="cli_academico_escolaridade" 
                                DataTextField="descricao" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_academico_escolaridade" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_escolaridade]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_academico_textcertificacao" runat="server" Width="330px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <asp:Label ID="Label40" runat="server" Text="nome da instituição"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Button ID="cli_profissional_adiciona_curso" runat="server" Height="20px" Text="adicionar" 
                                Width="120px" onclick="Button30_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_academico_textinstituicao" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td rowspan="10" colspan="2">
                            <asp:GridView ID="cli_academico_grid_cursos" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="cli_academico_gridcursos" Width="330px" AllowSorting="True" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                                onselectedindexchanged="cli_academico_grid_cursos_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" 
                                        InsertVisible="False" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                        SortExpression="id_cliente" Visible="False" />
                                    <asp:BoundField DataField="curso" HeaderText="curso" 
                                        SortExpression="curso" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        ReadOnly="True" SortExpression="dt_cadastro" />
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
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
                            <asp:SqlDataSource ID="cli_academico_gridcursos" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_cursos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <asp:Label ID="Label41" runat="server" Text="graduação*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <script type="text/javascript" language="javascript">
                                function GetValueGraduacao(sender, e) {
                                    $get("<%=id_graduacao.ClientID %>").value = e.get_value();
                                }
                            </script>
                            <asp:HiddenField ID="id_graduacao" runat="server"/>
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_academico_textcurso" runat="server" Width="330px"></asp:TextBox>
                            <ajax:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" TargetControlID="cli_academico_textcurso" Enabled="true" OnClientItemSelected="GetValueGraduacao"
                            ServicePath="PWebService.asmx" ServiceMethod="GetCompletionListClienteGraduacao" EnableCaching="true" UseContextKey="True" MinimumPrefixLength="2"
                            CompletionInterval="300" CompletionSetCount="5" ShowOnlyCurrentWordInCompletionListItem="true"></ajax:AutoCompleteExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style39" colspan="2">
                            <asp:Label ID="Label42" runat="server" Text="ano em que está cursando"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        <td class="style16">
                            <asp:Label ID="Label43" runat="server" Text="idioma"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label44" runat="server" Text="nível"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <asp:DropDownList ID="cli_academico_dropanocursando" runat="server" 
                                Height="20px" Width="160px" DataSourceID="cli_academico_anocursando" 
                                DataTextField="descricao" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_academico_anocursando" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_ano_formacao]">
                            </asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        <td class="style3" rowspan="2">
                            <asp:DropDownList ID="cli_academico_dropidioma" runat="server" Height="20px" 
                                Width="110px" AppendDataBoundItems="True" 
                                DataSourceID="cli_academico_idiomas" DataTextField="descricao" 
                                DataValueField="id">
                                <asp:ListItem Value="0">Escolha a Opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_academico_idiomas" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_idiomas]">
                            </asp:SqlDataSource>
                            &nbsp;
                            <asp:DropDownList ID="cli_academico_dropnivel" runat="server" Height="21px" 
                                Width="80px" AppendDataBoundItems="True" DataSourceID="cli_notas_idioma" 
                                DataTextField="descricao" DataValueField="id">
                                <asp:ListItem Value="0">Nota</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_notas_idioma" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_notas]">
                            </asp:SqlDataSource>
                            &nbsp;<asp:Button ID="cli_profissional_adiciona_idioma" runat="server" Height="20px" Text="adicionar" 
                                Width="120px" onclick="Button29_Click1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:Label ID="Label193" runat="server" Text="mês de conclusão"></asp:Label>
                        </td>
                        <td class="style35">
                            <asp:Label ID="Label192" runat="server" Text="ano de conclusão"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:DropDownList ID="cli_academico_drop_meses" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="cli_academico_source_meses" 
                                DataTextField="descricao" DataValueField="id" Width="120px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_academico_source_meses" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_meses]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style35">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_academico_text_ano_conclusao" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td class="style3" rowspan="4">
                            <asp:GridView ID="cli_academico_grid_idiomas" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="cli_academico_grididiomas" PageSize="5" Width="330px" 
                                AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                                onselectedindexchanged="cli_academico_grid_idiomas_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" 
                                        SortExpression="id" InsertVisible="False" ReadOnly="True" 
                                        Visible="False" />
                                    <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                        SortExpression="id_cliente" Visible="False" />
                                    <asp:BoundField DataField="id_idioma" HeaderText="id_idioma" 
                                        SortExpression="id_idioma" Visible="False" />
                                    <asp:BoundField DataField="idioma" HeaderText="idioma" 
                                        SortExpression="idioma" />
                                    <asp:BoundField DataField="nvl_idioma" HeaderText="nivel" 
                                        SortExpression="nvl_idioma" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                        ReadOnly="True" SortExpression="dt_cadastro" />
                                    <asp:BoundField DataField="usuario_criacao" HeaderText="usuario_criacao" 
                                        SortExpression="usuario_criacao" />
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
                            <asp:SqlDataSource ID="cli_academico_grididiomas" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_idiomas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            <asp:Button ID="cli_profissional_adiciona_graduacao" runat="server" 
                                Height="20px" onclick="Button28_Click" Text="adicionar" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="2">
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="cli_projeto" runat="server">
                <table class="style40">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label159" runat="server" ForeColor="#0099CC" 
                                Text="você está em projeto" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="Panel2" runat="server" Width="1024px" Height="280px" style="overflow:auto">
                <asp:GridView ID="cli_projetos_grid_projetos" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="cli_projetos_gridprojetos"
                        onrowdatabound="cli_projetos_grid_projetos_RowDataBound" 
                        onselectedindexchanged="cli_projetos_grid_projetos_SelectedIndexChanged" 
                        AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Exibir" ShowSelectButton="True" Visible="False" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="projeto" HeaderText="projeto" 
                            SortExpression="projeto" />
                        <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                            SortExpression="id_empresa" Visible="False" />
                        <asp:BoundField DataField="empresa" HeaderText="empresa" 
                            SortExpression="empresa" />
                        <asp:BoundField DataField="indicado_por" HeaderText="indicado_por" 
                            SortExpression="indicado_por" />
                        <asp:BoundField DataField="id_segmento" HeaderText="id_segmento" 
                            SortExpression="id_segmento" Visible="False" />
                        <asp:BoundField DataField="segmento" HeaderText="segmento" 
                            SortExpression="segmento" />
                        <asp:BoundField DataField="id_area" HeaderText="id_area" 
                            SortExpression="id_area" Visible="False" />
                        <asp:BoundField DataField="area" HeaderText="area" 
                            SortExpression="area" />
                        <asp:BoundField DataField="id_subdvisao" HeaderText="id_subdvisao" 
                            SortExpression="id_subdvisao" Visible="False" />
                        <asp:BoundField DataField="subdivisao" HeaderText="subdivisao" 
                            SortExpression="subdivisao" />
                        <asp:BoundField DataField="id_cargo" HeaderText="id_cargo" 
                            SortExpression="id_cargo" Visible="False" />
                        <asp:BoundField DataField="cargo" HeaderText="cargo" 
                            SortExpression="cargo" />
                        <asp:BoundField DataField="id_tp_produto" 
                            HeaderText="id_tp_produto" SortExpression="id_tp_produto" 
                            Visible="False" />
                        <asp:BoundField DataField="tipo_produto" 
                            HeaderText="tipo_produto" SortExpression="tipo_produto" />
                        <asp:BoundField DataField="id_responsavel_captacao" 
                            HeaderText="id_responsavel_captacao" SortExpression="id_responsavel_captacao" 
                            Visible="False" />
                        <asp:BoundField DataField="responsavel_captacao" 
                            HeaderText="responsavel_captacao" SortExpression="responsavel_captacao" />
                        <asp:BoundField DataField="id_responsavel_entrega" 
                            HeaderText="id_responsavel_entrega" 
                            SortExpression="id_responsavel_entrega" Visible="False" />
                        <asp:BoundField DataField="responsavel_entrega" 
                            HeaderText="responsavel_entrega" SortExpression="responsavel_entrega" />
                        <asp:BoundField DataField="id_colaborador_responsavel" HeaderText="id_colaborador_responsavel" 
                            SortExpression="id_colaborador_responsavel" Visible="False" />
                        <asp:BoundField DataField="colaborador_responsavel" HeaderText="colaborador_responsavel" 
                            SortExpression="colaborador_responsavel" />
                        <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                            ReadOnly="True" SortExpression="dt_cadastro" />
                        <asp:BoundField DataField="usuario_criacao" HeaderText="usuario_criacao" 
                            SortExpression="usuario_criacao" />
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
                </asp:Panel>
                <asp:SqlDataSource ID="cli_projetos_gridprojetos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                    SelectCommand="sp_vw_cli_proj_cliente" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="cli_havik" runat="server">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style30" colspan="3">
                            <asp:Label ID="mensagem_cli_havik" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style29" align="right">
                            <asp:Label ID="Label158" runat="server" ForeColor="#0099CC" 
                                Text="você está em status" Font-Bold="True"></asp:Label>
                           </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:RadioButtonList ID="cli_havik_radio_projetos" runat="server" 
                                AutoPostBack="True" 
                                onselectedindexchanged="busca_cli_radio_projetos_SelectedIndexChanged" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">meus projetos</asp:ListItem>
                                <asp:ListItem Value="2">proj. cliente</asp:ListItem>
                                <asp:ListItem Value="3">proj. havik</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="style28" colspan="2">
                            <asp:Label ID="Label185" runat="server" Text="indicado por"></asp:Label>
                        </td>
                        <td class="style29">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            
                            
                            <asp:Label ID="Label151" runat="server" Text="projeto*"></asp:Label>
                            
                            
                            
                        </td>
                        <td class="style28" colspan="3">
                            <asp:DropDownList ID="cli_havik_drop_indicadopor" runat="server" 
                                 Height="20px" Width="330px" DataSourceID="cli_havik_indicado" 
                                DataTextField="nome_usuario" DataValueField="id" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_havik_indicado" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_cli_indicado]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:DropDownList ID="cli_havik_drop_projeto" runat="server" 
                                AutoPostBack="True" DataSourceID="cli_havik_dropprojeto" 
                                DataTextField="projeto" DataValueField="id_projeto" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_havik_dropprojeto" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_proj_cliente_cb" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cli_havik_radio_projetos" Name="tipo" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                    <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style28" colspan="3">
                            <asp:Label ID="Label184" runat="server" Text="observações"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:Label ID="Label46" runat="server" Text="status*"></asp:Label>
                        </td>
                        <td class="style28" colspan="3" rowspan="9">
                            <asp:TextBox ID="cli_havik_textobservacoes" runat="server" Height="280px" 
                                TextMode="MultiLine" Width="620px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            <asp:DropDownList ID="cli_havik_dropstatus" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="true" DataSourceID="cli_havik_status" 
                                DataTextField="descricao" DataValueField="id" Height="20px" 
                                OnSelectedIndexChanged="ddlstatus_SelectedIndexChanged" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_havik_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_status]">
                            </asp:SqlDataSource>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            <asp:Label ID="Label139" runat="server" Text="substatus*"></asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            <asp:DropDownList ID="cli_havik_dropsubstatus" runat="server" DataSourceID="cli_havik_substatus" 
                                DataTextField="substatus" DataValueField="id_substatus" Height="20px" 
                                Width="330px" AutoPostBack="True" 
                                onselectedindexchanged="cli_havik_dropsubstatus_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_havik_substatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_substatus" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cli_havik_dropstatus" Name="id" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                            </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:Label ID="Label166" runat="server" Text="motivo"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:DropDownList ID="cli_havik_dropmotivo" runat="server" 
                                DataSourceID="cli_havik_motivo" DataTextField="motivo" 
                                DataValueField="id_motivo"  Height="20px" Width="330px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_havik_motivo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_motivo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cli_havik_dropsubstatus" Name="id" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:Label ID="Label110" runat="server" Text="data"></asp:Label>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" 
                                runat="server" ControlToValidate="cli_havik_textdata" 
                                ErrorMessage="digite uma data válida" ValidationExpression="^\d{8}$" 
                                ValidationGroup="havik_valida">
                            </asp:RegularExpressionValidator>
                            &nbsp;
                            <asp:Label ID="Label124" runat="server" Text="hora"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_havik_textdata" runat="server" Height="20px" 
                                MaxLength="10" Width="135px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <ajax:MaskedEditExtender ID="MascaraCliHavikData" runat="server" 
                                Mask="99/99/9999" TargetControlID="cli_havik_textdata"></ajax:MaskedEditExtender>
                            <script src="js/mascara.js" type="text/javascript">

</script>
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_havik_texthora" runat="server" 
                                onkeyup="formataHora (this,event);"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:Label ID="Label138" runat="server" Text="entrevistador"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            
                            <asp:DropDownList ID="cli_havik_drop_entrevistador" runat="server" 
                                datasourceid="cli_havik_entrevistador" DataTextField="nome_usuario" 
                                DataValueField="id" Height="20px" Width="330px" AutoPostBack="True">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_havik_entrevistador" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_drop_havik" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="follow" SessionField="IDfollow" Type="Int32" />
                                    <asp:SessionParameter Name="entrevistador" SessionField="IDentrevistador" 
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </td>
                        <td class="style28">
                            <asp:Button ID="cli_havik_adicionar_status" runat="server" Height="20px" onclick="Button32_Click" 
                                Text="adicionar" Width="120px" />
                        </td>
                        <td class="style28">
                            <asp:Button ID="Button31" runat="server" Height="20px" onclick="Button31_Click" 
                                Text="vincular ao projeto" Width="120px" Visible="False" />
                        </td>
                        <td class="style29">
                            <asp:Button ID="Button61" runat="server" Height="20px"
                                Text="buscar projeto" Width="120px" onclick="Button61_Click" 
                                Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style28" colspan="2">
                            &nbsp;</td>
                        <td class="style29">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style25" colspan="4">
                        <asp:Panel ID="Panel11" runat="server" Width="1010px" Height="280px" style="overflow:auto">
                            <asp:GridView ID="cli_havik_grid_status" runat="server" Height="212px" 
                                Width="1000px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="cli_havik_gridstatus" PageSize="5" AllowSorting="True" 
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                                onselectedindexchanged="cli_havik_grid_status_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField SelectText="Excluir" ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                        SortExpression="id_cliente" Visible="False" />
                                    <asp:BoundField DataField="id_status" HeaderText="id_status" 
                                        SortExpression="id_status" Visible="False" />
                                    <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                        SortExpression="id_projeto" />
                                    <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                        SortExpression="projeto" />
                                    <asp:BoundField DataField="status" HeaderText="status" 
                                        SortExpression="status" />
                                    <asp:BoundField DataField="id_substatus" HeaderText="id_substatus" 
                                        SortExpression="id_substatus" Visible="False" />
                                    <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                        SortExpression="substatus" />
                                    <asp:BoundField DataField="motivo" HeaderText="motivo" 
                                        SortExpression="motivo" />
                                    <asp:BoundField DataField="follow" HeaderText="follow" 
                                        SortExpression="follow" />
                                    <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" 
                                        SortExpression="entrevistador" />
                                    <asp:BoundField DataField="dt_agendada" HeaderText="dt_agendada" DataFormatString="{0:dd/MM/yyyy}"
                                        SortExpression="dt_agendada" ReadOnly="True" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" DataFormatString="{0:T}"
                                        ReadOnly="True" />
                                    <asp:BoundField DataField="obs" HeaderText="obs" 
                                        SortExpression="obs" />
                                    <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" DataFormatString="{0:dd/MM/yyyy}"
                                        SortExpression="dt_cadastro" ReadOnly="True"/>
                                    <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                        SortExpression="nome_usuario" />
                                    <asp:BoundField DataField="exibir" HeaderText="exibir" 
                                        SortExpression="exibir" Visible="False" />
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
                         </asp:Panel>
                            <asp:SqlDataSource ID="cli_havik_gridstatus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_cli_status" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <asp:GridView ID="retorno_follow_entrevistador" runat="server" Visible="False">
                            <Columns>
                            <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" SortExpression="entrevistador">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="follow" HeaderText="follow" SortExpression="follow">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>                                     
                        </Columns>
                            </asp:GridView>
                        </td>
                        <td class="style28" colspan="2">
                            &nbsp;</td>
                        <td class="style29">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style28" colspan="2">
                            &nbsp;</td>
                        <td class="style29">
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="cli_researcher" runat="server">
            <div class="clear">
            <asp:Menu ID="menu1" runat="server" CssClass="menuCliente" OnMenuItemClick="menuResearcher_MenuItemClick"
                IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" BorderWidth="1px" Width="100%">
            <Items>
            <asp:MenuItem Text="avaliação" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="relatório" Value="1"></asp:MenuItem>            
            </Items>
            </asp:Menu>
            </div>
                <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                    <asp:View ID="cli_researcher_comunicacao" runat="server">
                        <br />
                        <table class="style1">
                            <tr>
                                <td class="style17" colspan="4">
                                    <asp:Label ID="mensagem_cli_researcher_preentrevista" runat="server" 
                                        Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td align="right">
                                    <asp:Label ID="Label160" runat="server" ForeColor="#0099CC" 
                                        Text="você está em pré-entrevista" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label115" runat="server" Font-Bold="True" Text="comunicação"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label54" runat="server" Text="senso comercial"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_comunicacao_senso" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="cli_notas_relatorio" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="SELECT [id], [descricao] FROM [vw_cli_notas]">
                                    </asp:SqlDataSource>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label57" runat="server" Text="nível de energia"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_comunicacao_energia" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label60" runat="server" Text="credibilidade"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cli_researcher_comunicacao_credibilidade" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label55" runat="server" Text="eloquência"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_comunicacao_eloquencia" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label58" runat="server" Text="bom ouvinte"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_comunicacao_ouvinte" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label61" runat="server" Text="estruturado"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cli_researcher_comunicacao_estruturado" runat="server" 
                                        DataSourceID="cli_notas_relatorio" DataTextField="descricao" 
                                        DataValueField="id" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label56" runat="server" Text="objetivo"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_comunicacao_objetivo" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label59" runat="server" Text="marketing pessoal"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_comunicacao_mkt" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Button ID="Button34" runat="server" Height="20px" Text="registrar" 
                                        Width="120px" onclick="Button34_Click" Visible="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <hr width=100% />
                        <table class="style1">
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label116" runat="server" Text="potencial" Font-Bold="True"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label62" runat="server" Text="inteligência"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_potencial_inteligencia" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label63" runat="server" Text="passa confiança"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_potencial_confianca" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label64" runat="server" Text="punch"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cli_researcher_potencial_punch" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label65" runat="server" Text="maturidade"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_potencial_maturidade" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label66" runat="server" Text="honestidade"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_potencial_honestidade" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label67" runat="server" Text="carisma"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cli_researcher_potencial_carisma" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label68" runat="server" Text="visão empreendedora"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_researcher_potencial_visao" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    <asp:Button ID="cli_researcher_entrevista_registrar" runat="server" 
                                        Height="20px" onclick="Button36_Click" 
                                        Text="registrar" Width="120px" Visible="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <hr width=100% />
                        <table class="style1">
                            <tr>
                                <td class="style21">
                                    &nbsp;</td>
                                <td class="style14" colspan="2">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style21">
                                    <asp:Label ID="Label120" runat="server" Font-Bold="True" Text="observações"></asp:Label>
                                </td>
                                <td class="style14" colspan="2">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style21">
                                    &nbsp;</td>
                                <td class="style14" colspan="2">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style21">
                                    <asp:Label ID="Label150" runat="server" Text="observações anteriores"></asp:Label>
                                </td>
                                <td class="style14" colspan="2">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="4">
                                    <asp:GridView ID="cli_researcher_gridobs" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                        DataKeyNames="obs,id,mini_obs,usuario_alteracao" 
                                        DataSourceID="cli_researcher_obs_gridobs" ForeColor="Black" 
                                        GridLines="Vertical" onrowdatabound="cli_researcher_gridobs_RowDataBound" 
                                        onselectedindexchanged="GridView4_SelectedIndexChanged" PageSize="8" 
                                        Width="1010px">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField SelectText="Exibir" ShowSelectButton="True" Visible="False" />
                                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                                                SortExpression="id" Visible="False" InsertVisible="False" />
                                            <asp:BoundField DataField="mini_obs" HeaderText="mini_obs" ReadOnly="True" 
                                                SortExpression="mini_obs" />
                                            <asp:BoundField DataField="obs" HeaderText="obs" 
                                                SortExpression="obs" />
                                            <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                                SortExpression="dt_cadastro" ReadOnly="True" />
                                            <asp:BoundField DataField="usuario_alteracao" HeaderText="usuario_alteracao" 
                                                SortExpression="usuario_alteracao" Visible="False" />
                                            <asp:BoundField DataField="dt_alteracao" HeaderText="dt_alteracao" 
                                                SortExpression="dt_alteracao" ReadOnly="True" />
                                            <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                                SortExpression="nome_usuario" />
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
                                    <asp:SqlDataSource ID="cli_researcher_obs_gridobs" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="sp_vw_cli_researcher_obs" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int64" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="4">
                                    <asp:Label ID="Label121" runat="server" Text="observação"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="2" rowspan="4">
                                    <asp:TextBox ID="cli_researcher_textobs" runat="server" Height="202px" 
                                        TextMode="MultiLine" Width="660px"></asp:TextBox>
                                </td>
                                <td class="style14" colspan="2">
                                    <asp:Label ID="Label189" runat="server" Text="enquete do mes"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="2">
                                    <asp:Label ID="pergunta_do_mes" runat="server" 
                                        Text="" 
                                        Width="330px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="2">  
                                    <asp:GridView ID="cli_grid_resposta" runat="server" AllowSorting="True" 
                                        AutoGenerateColumns="False" DataKeyNames="id_resposta" 
                                        DataSourceID="cli_researcher_enquete" ShowHeader="False" Width="280px">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cli_check" runat="server" Width="20px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="id_resposta" HeaderText="id_resposta" 
                                                SortExpression="id_resposta" Visible="False" />
                                            <asp:BoundField DataField="resposta" HeaderText="resposta" 
                                                SortExpression="resposta" />
                                        </Columns>
                                    </asp:GridView>
                                <asp:SqlDataSource ID="cli_researcher_enquete" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="sp_vw_cli_resposta" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="id_pergunta_do_mes" Name="id_pergunta" 
                                                PropertyName="Value" Type="Int32" />
                                            <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="2">
                                    <asp:HiddenField ID="id_pergunta_do_mes" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:130px;">
                                    <asp:Button ID="cli_researcher_adiciona_obs" runat="server" Height="20px" Text="registrar pré-entrevista" 
                                        Width="150px" onclick="Button50_Click" />
                                    <asp:Button ID="Button51" runat="server" Height="20px" onclick="Button51_Click" 
                                        Text="limpar" Width="150px" />
                                </td>
                                <td class="style14" colspan="2">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <asp:View ID="cli_researcher_relatorio" runat="server">
                        <br />
                        <table class="style1">
                            <tr>
                        <td class="style30" colspan="3">
                            <asp:Label ID="mensagem_cli_researcher_relatorio" runat="server" 
                                Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style29" align="right" width="450px">
                            <asp:Label ID="Label161" runat="server" ForeColor="#0099CC" 
                                Text="você está em pré-entrevista relatório" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label69" runat="server" Text="salário desejado*"></asp:Label>
                                </td>
                                <td class="style17">
                                    <script src="js/mascara.js" type=text/javascript></script>
                                    <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_researcher_relatorio_textsalario" runat="server" Width="141px" onkeyup="formataValor (this,event);"></asp:TextBox>
                                </td>
                                <td rowspan="7">
                                    <asp:Label ID="Label9" runat="server" Text="média geral"></asp:Label>
                                    <asp:GridView ID="cli_researcher_grid_media_geral" runat="server" Height="47px" 
                                        AutoGenerateColumns="False" DataKeyNames="id" 
                                        DataSourceID="cli_researcher_gridmedia_geral" BackColor="White" 
                                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                        ForeColor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="media_comunicacao" HeaderText="media_comunicacao" 
                                                ReadOnly="True" SortExpression="media_comunicacao" />
                                            <asp:BoundField DataField="media_potencial" HeaderText="media_potencial" 
                                                ReadOnly="True" SortExpression="media_potencial" />
                                            <asp:BoundField DataField="salario" HeaderText="salario"  DataFormatString="{0:C2}"
                                                SortExpression="salario" ReadOnly="True" />
                                            <asp:BoundField DataField="movimento" HeaderText="movimento" 
                                                SortExpression="movimento" />
                                            <asp:BoundField DataField="mudanca" HeaderText="mudanca" 
                                                SortExpression="mudanca" />
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
                                    <asp:SqlDataSource ID="cli_researcher_gridmedia_geral" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="sp_vw_cli_researcher_mg" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="" Name="id_cliente" 
                                                SessionField="IDcliente" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="Label10" runat="server" Text="média por análise"></asp:Label>
                                    <asp:Panel ID="Panel7" runat="server"  Height="200px" Width="520px"  style="overflow:auto">
                                    <asp:GridView ID="cli_researcher_grid_relatorio" runat="server" 
                                        AutoGenerateColumns="False" DataKeyNames="id" 
                                        DataSourceID="cli_researcher_gridrelatorio" Width="764px" 
                                        AllowPaging="True" PageSize="8" AllowSorting="True" BackColor="White" 
                                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                        ForeColor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="credibilidade" HeaderText="credibilidade" 
                                                SortExpression="credibilidade" />
                                            <asp:BoundField DataField="eloquencia" HeaderText="eloquencia" 
                                                SortExpression="eloquencia" />
                                            <asp:BoundField DataField="energia" HeaderText="energia" 
                                                SortExpression="energia" />
                                            <asp:BoundField DataField="estruturado" HeaderText="estruturado" 
                                                SortExpression="estruturado" />
                                            <asp:BoundField DataField="mkt_pessoal" HeaderText="mkt_pessoal" 
                                                SortExpression="mkt_pessoal" />
                                            <asp:BoundField DataField="objetivo" HeaderText="objetivo" 
                                                SortExpression="objetivo" />
                                            <asp:BoundField DataField="senso_comercial" HeaderText="senso_comercial" 
                                                SortExpression="senso_comercial" />
                                            <asp:BoundField DataField="carisma" HeaderText="carisma" 
                                                SortExpression="carisma" />
                                            <asp:BoundField DataField="confianca" HeaderText="confianca" 
                                                SortExpression="confianca" />
                                            <asp:BoundField DataField="honestidade" HeaderText="honestidade" 
                                                SortExpression="honestidade" />
                                            <asp:BoundField DataField="inteligencia" HeaderText="inteligencia" 
                                                SortExpression="inteligencia" />
                                            <asp:BoundField DataField="maturidade" HeaderText="maturidade" 
                                                SortExpression="maturidade" />
                                            <asp:BoundField DataField="p_punch" HeaderText="p_punch" 
                                                SortExpression="p_punch" />
                                            <asp:BoundField DataField="empreendedorismo" HeaderText="empreendedorismo" 
                                                SortExpression="empreendedorismo" />
                                            <asp:BoundField DataField="salario" HeaderText="salario" ReadOnly="True" 
                                                SortExpression="salario" />
                                            <asp:BoundField DataField="movimento" HeaderText="movimento" 
                                                SortExpression="movimento" />
                                            <asp:BoundField DataField="mudanca" HeaderText="mudanca" 
                                                SortExpression="mudanca" />
                                            <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                                SortExpression="nome_usuario" />
                                            <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                                ReadOnly="True" SortExpression="dt_cadastro" />
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
                                    </asp:Panel>
                                    <asp:SqlDataSource ID="cli_researcher_gridrelatorio" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="sp_vw_cli_researcher" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17" rowspan="3">
                                    <asp:RadioButtonList ID="cli_researcher_relatorio_drive" runat="server" 
                                        Width="145px">
                                        <asp:ListItem Value="1">financeiro</asp:ListItem>
                                        <asp:ListItem Value="2">cargo</asp:ListItem>
                                        <asp:ListItem Value="3">desafio</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label70" runat="server" Text="drive para movimento"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label71" runat="server" Text="avalia mudança"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17" rowspan="2">
                                <asp:RadioButtonList ID="cli_researcher_relatorio_radio_mudanca" 
                                        runat="server">
                                        <asp:ListItem Value="1">Sim</asp:ListItem>
                                        <asp:ListItem Value="0">Não</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Button ID="cli_researcher_registra_relatorio" runat="server" Height="20px" Text="registrar" 
                                        Width="120px" onclick="Button37_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </asp:View>
            <asp:View ID="cli_consultor" runat="server">
             <div class="clear">
                <asp:Menu ID="menu2" runat="server" CssClass="menuCliente" OnMenuItemClick="menuConsultor_MenuItemClick"
                IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" BorderWidth="1px" Width="100%">
                    <Items>
                        <asp:MenuItem Text="avaliação" Value="0"></asp:MenuItem>
                        <asp:MenuItem Text="relatório" Value="1"></asp:MenuItem>            
                    </Items>
                </asp:Menu>
             </div>
                <asp:MultiView ID="MultiView4" runat="server" ActiveViewIndex="0">
                    <asp:View ID="cli_consultor_apresentacao" runat="server">
                        <br />
                        <table class="style1">
                            <tr>
                                <td class="style17" colspan="3">
                                    <asp:Label ID="mensagem_cli_consultor_entrevista" runat="server" 
                                        Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="right">
                                    <asp:Label ID="Label162" runat="server" ForeColor="#0099CC" 
                                        Text="você está em entrevista" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label112" runat="server" Font-Bold="True" Text="apresentação"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label152" runat="server" Text="primeira impressão"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_apresentacao_impressao" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label93" runat="server" Text="levantou-se"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_apresentacao_levantou" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label91" runat="server" Text="saudação"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_apresentacao_saudacao" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label94" runat="server" Text="profissionalismo"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_apresentacao_profissionalismo" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <hr width=100% />
                        <table class="style1">
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label113" runat="server" Text="comunicação" Font-Bold="True"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label72" runat="server" Text="senso comercial"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_comunicacao_senso" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label73" runat="server" Text="nível de energia"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_comunicacao_energia" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label74" runat="server" Text="credibilidade"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cli_consultor_comunicacao_credibilidade" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label75" runat="server" Text="eloquência"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_comunicacao_eloquencia" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label76" runat="server" Text="bom ouvinte"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_comunicacao_ouvinte" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label106" runat="server" Text="estruturado"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_comunicacao_estruturado" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label78" runat="server" Text="objetivo"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_comunicacao_objetivo" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label79" runat="server" Text="marketing pessoal"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_comunicacao_mkt" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <hr width=100% />
                        <table class="style1">
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label114" runat="server" Text="potencial" Font-Bold="True"></asp:Label>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label80" runat="server" Text="inteligência"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_potencial_inteligencia" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label81" runat="server" Text="passa confiança"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_potencial_confianca" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label82" runat="server" Text="punch"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cli_consultor_potencial_punch" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label83" runat="server" Text="maturidade"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_potencial_maturidade" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label84" runat="server" Text="honestidade"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_potencial_honestidade" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    <asp:Label ID="Label85" runat="server" Text="carisma"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cli_consultor_potencial_carisma" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label86" runat="server" Text="visão empreendedora"></asp:Label>
                                </td>
                                <td class="style17">
                                    <asp:DropDownList ID="cli_consultor_potencial_visao" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="cli_notas_relatorio" 
                                        DataTextField="descricao" DataValueField="id">
                                        <asp:ListItem Value="0">Nota</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    <asp:Button ID="cli_consultor_entrevista_registrar" runat="server" 
                                        Height="20px" onclick="Button39_Click" 
                                        Text="registrar" Width="120px" Visible="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <hr width=100% />
                        <table class="style1">
                            <tr>
                                <td class="style21">
                                    &nbsp;</td>
                                <td class="style14">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style21">
                                    <asp:Label ID="Label119" runat="server" Text="observações" Font-Bold="True"></asp:Label>
                                </td>
                                <td class="style14">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style21">
                                    &nbsp;</td>
                                <td class="style14">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style21">
                                    <asp:Label ID="Label118" runat="server" Text="observações anteriores"></asp:Label>
                                </td>
                                <td class="style14">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="3">
                                    <asp:GridView ID="cli_consultor_gridobs" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="obs,id,mini_obs,dt_cadastro,usuario_alteracao,dt_alteracao,nome_usuario" 
                                        DataSourceID="cli_consultor_obs_gridobs" ForeColor="Black" GridLines="Vertical" 
                                        onrowdatabound="cli_consultor_gridobs_RowDataBound" 
                                        onselectedindexchanged="GridView3_SelectedIndexChanged" PageSize="8" 
                                        Width="1010px">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" Visible="False" />
                                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                                                SortExpression="id" Visible="False" InsertVisible="False" />
                                            <asp:BoundField DataField="mini_obs" HeaderText="mini_obs" ReadOnly="True" 
                                                SortExpression="mini_obs" />
                                            <asp:BoundField DataField="obs" HeaderText="obs" 
                                                SortExpression="obs" />
                                            <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                                SortExpression="dt_cadastro" ReadOnly="True" />
                                            <asp:BoundField DataField="usuario_alteracao" HeaderText="usuario_alteracao" 
                                                SortExpression="usuario_alteracao" Visible="False" />
                                            <asp:BoundField DataField="dt_alteracao" HeaderText="dt_alteracao" 
                                                SortExpression="dt_alteracao" ReadOnly="True" />
                                            <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                                SortExpression="nome_usuario" />
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
                                    <asp:SqlDataSource ID="cli_consultor_obs_gridobs" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="sp_vw_cli_consultor_obs" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int64" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="2">
                                    <asp:Label ID="Label117" runat="server" Text="observação"></asp:Label>
                                </td>
                                <td class="style21">
                                    
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style14" colspan="3">
                                    <asp:TextBox ID="cli_consultor_textobs" runat="server" Height="202px" 
                                        TextMode="MultiLine" Width="1010px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:130px;">
                                <asp:Button ID="Button48" runat="server" Height="20px" Text="registrar entrevista" 
                                        Width="120px" onclick="Button48_Click" />
                                </td>
                                <td class="style14">
                                    <asp:Button ID="Button49" runat="server" Height="20px" Text="limpar" 
                                        Width="120px" onclick="Button49_Click" />
                                </td>
                                <td class="style21">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>                    
                    <asp:View ID="cli_consultor_relatorio" runat="server">
                        <br />
                        <table class="style1">
                            <tr>
                            <td class="style30" colspan="2">
                                <asp:Label ID="mensagem_cli_consultor_relatorio" runat="server" 
                                    Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                                <td align="right" class="style30" colspan="2">
                                    <asp:Label ID="Label163" runat="server" ForeColor="#0099CC" 
                                        Text="você está em entrevista relatório" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label87" runat="server" Text="salário desejado*"></asp:Label>
                                </td>
                                <td class="style17" colspan="2">
                                    <script src="js/mascara.js" type=text/javascript></script>
                                    <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_consultor_relatorio_textsalario" runat="server" Width="141px" onkeyup="formataValor (this,event);"></asp:TextBox>
                                </td>
                                <td rowspan="7">
                                    <asp:Label ID="Label7" runat="server" Text="média geral"></asp:Label>
                                    <asp:GridView ID="cli_consultor_grid_media_geral" runat="server" Height="52px" 
                                        AutoGenerateColumns="False" DataKeyNames="id" 
                                        DataSourceID="cli_consultor_gridmedia_geral" AllowSorting="True" 
                                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                        CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="media_apresentacao" HeaderText="media_apresentacao" 
                                                ReadOnly="True" SortExpression="media_apresentacao" />
                                            <asp:BoundField DataField="media_comunicacao" HeaderText="media_comunicacao" 
                                                ReadOnly="True" SortExpression="media_comunicacao" />
                                            <asp:BoundField DataField="media_potencial" HeaderText="media_potencial" 
                                                ReadOnly="True" SortExpression="media_potencial" />
                                            <asp:BoundField DataField="salario" HeaderText="salario" DataFormatString="{0:C2}"
                                                SortExpression="salario" ReadOnly="True" />
                                            <asp:BoundField DataField="movimento" HeaderText="movimento" 
                                                SortExpression="movimento" />
                                            <asp:BoundField DataField="mudanca" HeaderText="mudanca" 
                                                SortExpression="mudanca" />
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
                                    <asp:SqlDataSource ID="cli_consultor_gridmedia_geral" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="sp_vw_cli_consultor_mg" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="Label8" runat="server" Text="média por análise"></asp:Label>
                                    <asp:Panel ID="Panel8" runat="server"  Height="200px" Width="620px"  style="overflow:auto">
                                    <asp:GridView ID="cli_consultor_grid_relatorio" runat="server" 
                                        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                        DataSourceID="cli_consultor_gridrelatorio" PageSize="8" 
                                        AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                                        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="ap_saudacao" HeaderText="ap_saudacao" 
                                                SortExpression="ap_saudacao" />
                                            <asp:BoundField DataField="ap_impressao" HeaderText="ap_impressao" 
                                                SortExpression="ap_impressao" />
                                            <asp:BoundField DataField="ap_levantou" HeaderText="ap_levantou" 
                                                SortExpression="ap_levantou" />
                                            <asp:BoundField DataField="ap_profissionalismo" HeaderText="ap_profissionalismo" 
                                                SortExpression="ap_profissionalismo" />
                                            <asp:BoundField DataField="com_senso" HeaderText="com_senso" 
                                                SortExpression="com_senso" />
                                            <asp:BoundField DataField="com_eloquencia" HeaderText="com_eloquencia" 
                                                SortExpression="com_eloquencia" />
                                            <asp:BoundField DataField="com_objetivo" HeaderText="com_objetivo" 
                                                SortExpression="com_objetivo" />
                                            <asp:BoundField DataField="com_energia" HeaderText="com_energia" 
                                                SortExpression="com_energia" />
                                            <asp:BoundField DataField="com_ouvinte" HeaderText="com_ouvinte" 
                                                SortExpression="com_ouvinte" />
                                            <asp:BoundField DataField="com_mkt_pessoal" HeaderText="com_mkt_pessoal" 
                                                SortExpression="com_mkt_pessoal" />
                                            <asp:BoundField DataField="com_credibilidade" HeaderText="com_credibilidade" 
                                                SortExpression="com_credibilidade" />
                                            <asp:BoundField DataField="com_estruturado" HeaderText="com_estruturado" 
                                                SortExpression="com_estruturado" />
                                            <asp:BoundField DataField="pot_inteligencia" HeaderText="pot_inteligencia" 
                                                SortExpression="pot_inteligencia" />
                                            <asp:BoundField DataField="pot_maturidade" HeaderText="pot_maturidade" 
                                                SortExpression="pot_maturidade" />
                                            <asp:BoundField DataField="pot_visao" HeaderText="pot_visao" 
                                                SortExpression="pot_visao" />
                                            <asp:BoundField DataField="pot_confianca" HeaderText="pot_confianca" 
                                                SortExpression="pot_confianca" />
                                            <asp:BoundField DataField="pot_honestidade" HeaderText="pot_honestidade" 
                                                SortExpression="pot_honestidade" />
                                            <asp:BoundField DataField="pot_punch" HeaderText="pot_punch" 
                                                SortExpression="pot_punch" />
                                            <asp:BoundField DataField="pot_carisma" HeaderText="pot_carisma" 
                                                SortExpression="pot_carisma" />
                                            <asp:BoundField DataField="salario" HeaderText="salario" 
                                                SortExpression="salario" ReadOnly="True" />
                                            <asp:BoundField DataField="movimento" HeaderText="movimento" 
                                                SortExpression="movimento" />
                                            <asp:BoundField DataField="mudanca" HeaderText="mudanca" 
                                                SortExpression="mudanca" />
                                            <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                                SortExpression="nome_usuario" />
                                            <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                                SortExpression="dt_cadastro" ReadOnly="True" />
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
                                    </asp:Panel>
                                    <asp:SqlDataSource ID="cli_consultor_gridrelatorio" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                        SelectCommand="sp_vw_cli_consultor" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_cliente" SessionField="IDcliente" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                                <td class="style17" rowspan="3" colspan="2">
                                    <asp:RadioButtonList ID="cli_consultor_relatorio_drive" runat="server" Width="145px">
                                        <asp:ListItem Value="1">financeiro</asp:ListItem>
                                        <asp:ListItem Value="2">cargo</asp:ListItem>
                                        <asp:ListItem Value="3">desafio</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label88" runat="server" Text="drive para movimento"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <asp:Label ID="Label89" runat="server" Text="avalia mudança"></asp:Label>
                                </td>
                                <td class="style17" colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17" rowspan="2">
                                    <asp:RadioButtonList ID="cli_consultor_relatorio_radio_mudanca" runat="server">
                                        <asp:ListItem Value="1">Sim</asp:ListItem>
                                        <asp:ListItem Value="0">Não</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="style17" colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17" colspan="2">
                                    <asp:Button ID="cli_consultor_registra_relatorio" runat="server" Height="20px" Text="registrar" 
                                        Width="120px" onclick="Button40_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </asp:View>
            <asp:View ID="cli_hierarquia" runat="server">
                <br />
                <table class="style1">
                    <tr>
                        <td class="style35">
                            <asp:Label ID="mensagem_cli_hierarquia" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30" align="right">
                            <asp:Label ID="Label164" runat="server" ForeColor="#0099CC" 
                                Text="você está em hierarquia" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:Label ID="Label50" runat="server" Text="a quem se reporta"></asp:Label>
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:DropDownList ID="cli_hierarquia_drop_reporta" runat="server" Height="20px" 
                                Width="330px" AppendDataBoundItems="True" 
                                DataSourceID="cli_hierarquia_a_quem_reporta" DataTextField="descricao" 
                                DataValueField="id">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_hierarquia_a_quem_reporta" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_cargo]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:Label ID="Label51" runat="server" Text="quem se reporta a ele"></asp:Label>
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:DropDownList ID="cli_hierarquia_drop_reporta_a_quem" runat="server" Height="20px" 
                                Width="330px" AppendDataBoundItems="True" 
                                DataSourceID="cli_hierarquia_reportase" DataTextField="descricao" 
                                DataValueField="id">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="cli_hierarquia_reportase" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_cli_cargo]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:Label ID="Label52" runat="server" Text="subordinados"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label53" runat="server" Text="subordinados diretos"></asp:Label>
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_hierarquia_text_nro_subordinados" runat="server" Width="70px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtender4" runat="server" 
                                Mask="9999999999" TargetControlID="cli_hierarquia_text_nro_subordinados"></ajax:MaskedEditExtender>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox onkeydown = "return (event.keyCode!=13);" ID="cli_hierarquia_text_subordinados_diretos" runat="server" Width="120px"></asp:TextBox>
                            <ajax:MaskedEditExtender ID="MaskedEditExtender5" runat="server" 
                                Mask="9999999999" TargetControlID="cli_hierarquia_text_subordinados_diretos"></ajax:MaskedEditExtender>
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            <asp:Button ID="cli_hierarquia_registrar" runat="server" Height="20px" Text="registrar" 
                                Width="120px" onclick="Button47_Click" />
                        </td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35" colspan="3">
                            <asp:Panel ID="Panel1" runat="server"  Height="126px" Width="507px"  style="overflow:auto">
                        <asp:GridView ID="retorno_cliente" runat="server" Visible="False" 
                                    onselectedindexchanged="retorno_cliente_SelectedIndexChanged" >
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cpf" HeaderText="cpf" 
                                SortExpression="cpf">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dt_nascimento" HeaderText="dt_nascimento" SortExpression="dt_nascimento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="id_estado_civil" HeaderText="id_estado_civil" 
                                SortExpression="id_estado_civil">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="id_sexo" HeaderText="id_sexo" 
                                SortExpression="id_sexo">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="endereco" HeaderText="endereco" SortExpression="endereco">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="numero" HeaderText="numero" 
                                SortExpression="numero">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>     
                            <asp:BoundField DataField="complemento" HeaderText="complemento" 
                                SortExpression="complemento">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="cep" HeaderText="cep" 
                                SortExpression="cep">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="bairro" HeaderText="bairro" 
                                SortExpression="bairro">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>     
                            <asp:BoundField DataField="id_cidade" HeaderText="id_cidade" 
                                SortExpression="id_cidade">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="id_estado" HeaderText="id_estado" 
                                SortExpression="id_estado">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="id_pais" HeaderText="id_pais" 
                                SortExpression="id_pais">
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
                            <asp:BoundField DataField="reportados" HeaderText="reportados" 
                                SortExpression="reportados">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="reportase" HeaderText="reportase" 
                                SortExpression="reportase">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="qtd_subordinados" HeaderText="qtd_subordinados" 
                                SortExpression="qtd_subordinados">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="qtd_subordinados_diretos" HeaderText="qtd_subordinados_diretos" 
                                SortExpression="qtd_subordinados_diretos">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>      
                            <asp:BoundField DataField="nome_mae" HeaderText="nome_mae" 
                                SortExpression="nome_mae">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="nome_pai" HeaderText="nome_pai" 
                                SortExpression="nome_pai">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="rg" HeaderText="rg" 
                                SortExpression="rg">
                            </asp:BoundField> 
                            <asp:BoundField DataField="idade" HeaderText="idade" 
                                SortExpression="idade">
                            </asp:BoundField> 
                            <asp:BoundField DataField="id_uf_natural" HeaderText="id_uf_natural" 
                                SortExpression="id_uf_natural">
                            </asp:BoundField> 
                            <asp:BoundField DataField="id_natural" HeaderText="id_natural" 
                                SortExpression="id_natural">
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
