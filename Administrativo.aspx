<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administrativo.aspx.cs" Inherits="HavikTeste.Administrativo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="clear">
        <asp:Menu ID="menuAdministrativo" runat="server" CssClass="menuEmpresa" 
        IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" 
            BorderWidth="1px" Width="100%" 
            onmenuitemclick="menuAdministrativo_MenuItemClick">
        <Items>            
            <asp:MenuItem Text="trocar senha" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="relatórios" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="graduação" Value="2"></asp:MenuItem>
        </Items>
        </asp:Menu>            
         </div> 
         <asp:MultiView ID="adm" runat="server" ActiveViewIndex="0">
            <asp:View ID="adm_troca_senha" runat="server">
            <table class="style1">
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style2" colspan="3">
                         <asp:Label ID="Label1" runat="server" ForeColor="Black" 
                             Text="Preencha os campos abaixo para efetuar sua troca de senha"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         <asp:TextBox ID="senha_antiga" runat="server" Width="190px" TextMode="Password" autocomplete="off"></asp:TextBox>
                     </td>
                     <td class="style3">
        
                         <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="senha antiga"></asp:Label>
        
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         <asp:TextBox ID="senha_nova1" runat="server" Width="190px" TextMode="Password"></asp:TextBox>
                     </td>
                     <td class="style3">
                         <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="senha nova"></asp:Label>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         <asp:TextBox ID="senha_nova2" runat="server" Width="190px" TextMode="Password"></asp:TextBox>
                     </td>
                     <td class="style3">
                         <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="digite novamente sua senha"></asp:Label>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style4" colspan="3">
                                    <asp:Label ID="label_erro" runat="server" ForeColor="#FF3300"></asp:Label>
                                </td>
                 </tr>
                 <tr>
                     <td class="style5">
                                    <asp:Button ID="Button1" runat="server" Height="20px" Text="registrar" 
                                        Width="120px" onclick="Button1_Click"/>
                                </td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
            </asp:View>
            <asp:View ID="adm_relatorios_1" runat="server">
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="mensagem_erro_relatorios" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
                            <asp:Label ID="parametros_substatus" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label110" runat="server" Text="tipo de relatório"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="adm_drop_tipo_relat" runat="server" 
                                AppendDataBoundItems="True" Height="20px" Width="330px" 
                                DataSourceID="adm_source_tipo_relat" DataTextField="descricao" 
                                DataValueField="id" AutoPostBack="True" 
                                onselectedindexchanged="adm_drop_tipo_relat_SelectedIndexChanged">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="adm_source_tipo_relat" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [descricao] FROM [vw_relat_tipos]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="adm_label_descricao_relatorio" runat="server" Font-Bold="True" 
                                ForeColor="#FA9E43" Height="44px" Width="650px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="adm_radio_projetos" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="adm_radio_projetos_SelectedIndexChanged" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">meus projetos</asp:ListItem>
                                <asp:ListItem Value="3">proj. havik</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="adm_radio_tipos_projetos" runat="server" 
                                AutoPostBack="True"
                                RepeatDirection="Horizontal" 
                                onselectedindexchanged="adm_radio_tipos_projetos_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="1">todos</asp:ListItem>
                                <asp:ListItem Value="2">abertos</asp:ListItem>
                                <asp:ListItem Value="3">fechados</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:Label ID="Label108" runat="server" Text="lista de status"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label109" runat="server" Text="lista de substatus"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="adm_list_projetos" runat="server" Height="132px" 
                                SelectionMode="Multiple" Width="300px"
                                DataSourceID="adm_source_list_projetos" DataTextField="projeto" 
                                DataValueField="id_projeto" AutoPostBack="True" 
                                onselectedindexchanged="adm_list_projetos_SelectedIndexChanged">
                            </asp:ListBox>
                            <asp:SqlDataSource ID="adm_source_list_projetos" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_relat_proj_cliente_cb" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="adm_radio_projetos" Name="tipo" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="adm_radio_tipos_projetos" Name="subtipo" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:ListBox ID="adm_list_status" runat="server" 
                                DataSourceID="adm_source_list_status" DataTextField="descricao" 
                                DataValueField="id" Height="132px" 
                                onselectedindexchanged="adm_list_status_SelectedIndexChanged" 
                                SelectionMode="Multiple" Width="221px" AutoPostBack="True"></asp:ListBox>
                            <asp:SqlDataSource ID="adm_source_list_status" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="sp_vw_relat_status" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:ListBox ID="adm_list_substatus" Height="132px" Width="221px" runat="server"
                            DataTextField="substatus" DataValueField="id_substatus" 
                                SelectionMode="Multiple"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label113" runat="server" Text="lista de empresas"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="responsável captação"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label111" runat="server" Text="data de início"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label112" runat="server" Text="data de término"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="5">
                            <asp:ListBox ID="adm_list_empresas" runat="server" DataTextField="empresa" 
                                DataValueField="id_empresa" Height="150px" SelectionMode="Multiple" 
                                Width="300px"></asp:ListBox>
                        </td>
                        <td>
                            <asp:DropDownList ID="adm_drop_captacao" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="adm_source_drop_captacao" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="adm_source_drop_captacao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_relat_responsavel]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <script src="js/mascara.js" type="text/javascript"></script>
                            <asp:TextBox ID="adm_text_dt_inicio" runat="server" onkeyup="formataData (this,event);" 
                                Height="20px" onkeydown="return (event.keyCode!=13);" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            <script src="js/mascara.js" type="text/javascript"></script>
                            <asp:TextBox ID="adm_text_dt_fim" runat="server" onkeyup="formataData (this,event);"
                                Height="20px" onkeydown="return (event.keyCode!=13);" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label107" runat="server" Text="responsável entrega"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label116" runat="server" Text="pré-entrevista"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="adm_drop_entrega" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="adm_source_drop_entrega" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="adm_source_drop_entrega" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_relat_colaborador]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            <asp:RadioButtonList ID="adm_radiolist_pre_entrevista" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">existente</asp:ListItem>
                                <asp:ListItem Value="2">no período</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">não-verifica</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label114" runat="server" Text="colaborador responsável"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="Label115" runat="server" Text="usuário"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="adm_drop_colaborador" runat="server" 
                                AppendDataBoundItems="True" Height="20px" Width="330px" 
                                DataSourceID="adm_source_drop_entrega" DataTextField="nome_usuario" 
                                DataValueField="id">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="adm_drop_usuario" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="adm_source_drop_usuario" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="adm_source_drop_usuario" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_relat_usuarios]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
                            <asp:Label ID="Label118" runat="server" Text="equipe"></asp:Label>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="adm_button_relatorio" runat="server" Height="20px" Text="emitir relatório" 
                                Width="140px" onclick="adm_button_relatorio_Click" />
                        </td>
                        <td>
                            <asp:DropDownList ID="adm_drop_equipe" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="adm_source_drop_equipe" 
                                DataTextField="nome_usuario" DataValueField="id" Height="20px" Width="330px">
                                <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="adm_source_drop_equipe" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                SelectCommand="SELECT [id], [nome_usuario] FROM [vw_relat_equipe]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:View>
             <asp:View ID="registros_graduacao" runat="server">
                 <table class="style1">
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label117" runat="server" Text="descrição"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="adm_registro_textgraduacao" runat="server" Width="330px"></asp:TextBox>
                         </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Button ID="adm_registro_button_graduacao" runat="server" Height="20px" 
                             Text="cadastrar" Width="120px" onclick="adm_registro_button_graduacao_Click" />
                         </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                         <asp:Panel ID="Panel12" runat="server" Height="400px" style="overflow:auto" Width="500px">
                             <asp:GridView ID="adm_registro_grid_graduacao" runat="server" AutoGenerateColumns="False" 
                                 BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                 CellPadding="4" DataKeyNames="id" DataSourceID="adm_registro_graduacao" 
                                 ForeColor="Black" GridLines="Vertical" AllowSorting="True">
                                 <AlternatingRowStyle BackColor="White" />
                                 <Columns>
                                     <asp:BoundField DataField="id" HeaderText="id" 
                                         ReadOnly="True" SortExpression="id" />
                                     <asp:BoundField DataField="descricao" HeaderText="descricao" 
                                         SortExpression="descricao" />
                                     <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                         SortExpression="nome_usuario" />
                                     <asp:BoundField DataField="dt_criacao" HeaderText="dt_criacao" 
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
                             </asp:Panel>
                             <asp:SqlDataSource ID="adm_registro_graduacao" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT * FROM [vw_adm_graduacao]"></asp:SqlDataSource>
                         </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                 </table>
             </asp:View>
         </asp:MultiView>
</asp:Content>
