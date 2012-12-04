<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Financeiro.aspx.cs" Inherits="HavikTeste.Financeiro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="clear">
        <asp:Menu ID="menuFinanceiro" runat="server" CssClass="menuEmpresa" 
        IncludeStyleBlock="False" Orientation="Horizontal" BorderStyle="Solid" 
            BorderWidth="1px" Width="100%" 
            onmenuitemclick="menuFinanceiro_MenuItemClick">
        <Items>
            <asp:MenuItem Text="início" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="informações do processo" Value="1"></asp:MenuItem>
        </Items>
        </asp:Menu>            
         </div> 
         <asp:MultiView ID="fin" runat="server" ActiveViewIndex="0">
             <asp:View ID="fin_home" runat="server">
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
                             <asp:Label ID="Label1" runat="server" Text="ação"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label2" runat="server" Text="status financeiro"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label3" runat="server" Text="responsável entrega"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:DropDownList ID="proj_financeiro_dropacao" runat="server" 
                                 AppendDataBoundItems="True" AutoPostBack="True" Height="20px" 
                                 Width="330px" DataSourceID="financeiro_inicio_acao" DataTextField="descricao" 
                                 DataValueField="id" 
                                 onselectedindexchanged="proj_financeiro_dropacao_SelectedIndexChanged">
                                 <asp:ListItem Value="0" Text="Escolha a opção" />
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="financeiro_inicio_acao" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT [id], [descricao] FROM [vw_proj_acao]">
                             </asp:SqlDataSource>
                         </td>
                         <td>
                             <asp:DropDownList ID="proj_financeiro_dropstatus" runat="server" 
                                 AppendDataBoundItems="True" AutoPostBack="True" Height="20px" 
                                 Width="330px" DataSourceID="financeiro_inicio_source_status" 
                                 DataTextField="descricao" DataValueField="id" 
                                 onselectedindexchanged="proj_financeiro_dropstatus_SelectedIndexChanged">
                                 <asp:ListItem Value="0" Text="Escolha a opção" />
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="financeiro_inicio_source_status" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT [id], [descricao] FROM [vw_fin_status]">
                             </asp:SqlDataSource>
                         </td>
                         <td>
                             <asp:DropDownList ID="proj_financeiro_dropresponsavel_entrega" runat="server" 
                                 AppendDataBoundItems="True" AutoPostBack="True" Height="20px" 
                                 Width="330px" DataSourceID="financeiro_inicio_responsavel" 
                                 DataTextField="nome_usuario" DataValueField="id" 
                                 onselectedindexchanged="proj_financeiro_dropresponsavel_entrega_SelectedIndexChanged">
                                 <asp:ListItem Value="0" Text="Escolha a opção" />
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="financeiro_inicio_responsavel" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT [id], [nome_usuario] FROM [vw_fin_responsavel]">
                             </asp:SqlDataSource>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label6" runat="server" Text="produto"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label5" runat="server" Text="período"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label4" runat="server" Text="responsável captação"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:DropDownList ID="proj_financeiro_dropproduto" runat="server" 
                                 AppendDataBoundItems="True" AutoPostBack="True" Height="20px" 
                                 Width="330px" DataSourceID="financeiro_inicio_produto" 
                                 DataTextField="descricao" DataValueField="id" 
                                 onselectedindexchanged="proj_financeiro_dropproduto_SelectedIndexChanged">
                                 <asp:ListItem Value="0" Text="Escolha a opção" />
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="financeiro_inicio_produto" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT [id], [descricao] FROM [vw_proj_tp_produto]">
                             </asp:SqlDataSource>
                         </td>
                         <td>
                             <asp:DropDownList ID="proj_financeiro_dropperiodo" runat="server" 
                                 AppendDataBoundItems="True" AutoPostBack="True" Height="20px" 
                                 Width="330px" DataSourceID="financeiro_inicio_periodo" 
                                 DataTextField="descricao" DataValueField="id" 
                                 onselectedindexchanged="proj_financeiro_dropperiodo_SelectedIndexChanged">
                                 <asp:ListItem Value="0" Text="Escolha a opção" />
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="financeiro_inicio_periodo" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT [descricao], [id] FROM [vw_fin_periodo]">
                             </asp:SqlDataSource>
                         </td>
                         <td>
                             <asp:DropDownList ID="proj_financeiro_dropresponsavel_captacao" runat="server" 
                                 AppendDataBoundItems="True" AutoPostBack="True" Height="20px" 
                                 Width="330px" DataSourceID="financeiro_inicio_responsavel" 
                                 DataTextField="nome_usuario" DataValueField="id" 
                                 onselectedindexchanged="proj_financeiro_dropresponsavel_captacao_SelectedIndexChanged">
                                 <asp:ListItem Value="0" Text="Escolha a opção" />
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label7" runat="server" Text="empresa"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:DropDownList ID="proj_financeiro_dropempresa" runat="server" 
                                 AppendDataBoundItems="True" AutoPostBack="True" Height="20px" 
                                 Width="330px" DataSourceID="financeiro_inicio_source_empresa" 
                                 DataTextField="empresa" DataValueField="id_empresa" 
                                 onselectedindexchanged="proj_financeiro_dropempresa_SelectedIndexChanged">
                                 <asp:ListItem Value="0" Text="Escolha a opção" />
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="financeiro_inicio_source_empresa" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="sp_vw_fin_empresa" SelectCommandType="StoredProcedure">
                             </asp:SqlDataSource>
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
                         <td colspan="3">
                          <asp:Panel ID="Panel2" runat="server" Width="1000px" Height="220px" style="overflow:auto">
                             <asp:GridView ID="proj_fin_grid_financeiro" runat="server" BackColor="White" 
                                 BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                 ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" 
                                 DataSourceID="fin_ini_source_financeiro" 
                                  onselectedindexchanged="proj_fin_grid_financeiro_SelectedIndexChanged" 
                                  DataKeyNames="id_projeto,id_acao">
                                 <AlternatingRowStyle BackColor="White" />
                                 <Columns>
                                     <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                     <asp:BoundField DataField="id_acao" HeaderText="id_acao" InsertVisible="False" 
                                         ReadOnly="True" SortExpression="id_acao" />
                                     <asp:BoundField DataField="cod_acao" HeaderText="cod_acao" 
                                         SortExpression="cod_acao" InsertVisible="False" ReadOnly="True" />
                                     <asp:BoundField DataField="acao" HeaderText="acao" 
                                         SortExpression="acao" />
                                     <asp:BoundField DataField="produto" HeaderText="produto" 
                                         SortExpression="produto" />
                                     <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                         SortExpression="empresa" />
                                     <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                         SortExpression="id_projeto" InsertVisible="False" ReadOnly="True" />
                                     <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                         SortExpression="projeto" />
                                     <asp:BoundField DataField="dt_faturamento" HeaderText="dt_faturamento" 
                                         SortExpression="dt_faturamento" DataFormatString="{0:dd/MM/yyyy hh:mm}" />
                                     <asp:BoundField DataField="equipe" HeaderText="equipe" 
                                         SortExpression="equipe" />
                                     <asp:BoundField DataField="resp_captacao" HeaderText="resp_captacao" 
                                         SortExpression="resp_captacao" />
                                     <asp:BoundField DataField="resp_entrega" HeaderText="resp_entrega" 
                                         SortExpression="resp_entrega" />
                                     <asp:BoundField DataField="colaborador_resp" HeaderText="colaborador_resp" 
                                         SortExpression="colaborador_resp" />
                                     <asp:BoundField DataField="fee" HeaderText="fee" 
                                         SortExpression="fee"/>
                                     <asp:BoundField DataField="imposto" HeaderText="imposto" 
                                         SortExpression="imposto" />
                                     <asp:BoundField DataField="valor_nota" HeaderText="valor_nota" 
                                         SortExpression="valor_nota" />
                                     <asp:BoundField DataField="particularidades" HeaderText="particularidades" 
                                         SortExpression="particularidades" />
                                     <asp:BoundField DataField="fee1" HeaderText="fee1" 
                                         SortExpression="fee1" />
                                     <asp:BoundField DataField="id_candidato" HeaderText="id_candidato" 
                                         SortExpression="id_candidato" InsertVisible="False" ReadOnly="True"/>
                                     <asp:BoundField DataField="candidato" HeaderText="candidato" 
                                         SortExpression="candidato"/>
                                     <asp:BoundField DataField="base_faturamento" HeaderText="base_faturamento" 
                                         SortExpression="base_faturamento" />
                                     <asp:BoundField DataField="salario_final" HeaderText="salario_final" 
                                         SortExpression="salario_final"/>
                                     <asp:BoundField DataField="modo_pagamento" HeaderText="modo_pagamento" 
                                         SortExpression="modo_pagamento" />
                                     <asp:BoundField DataField="data_vencimento" HeaderText="data_vencimento" 
                                         SortExpression="data_vencimento" DataFormatString="{0:dd/MM/yyyy hh:mm}"/>
                                     <asp:BoundField DataField="email_contato" HeaderText="email_contato" 
                                         SortExpression="email_contato" />
                                     <asp:BoundField DataField="numero_vagas" HeaderText="numero_vagas" 
                                         SortExpression="numero_vagas" />
                                     <asp:BoundField DataField="requisicao_vagas" HeaderText="requisicao_vagas" 
                                         SortExpression="requisicao_vagas" />
                                     <asp:BoundField DataField="qtd_parcelas" HeaderText="qtd_parcelas" 
                                         SortExpression="qtd_parcelas" />
                                     <asp:BoundField DataField="mult_salario" HeaderText="mult_salario" 
                                         SortExpression="mult_salario" />
                                     <asp:BoundField DataField="valor_total" HeaderText="valor_total" 
                                         SortExpression="valor_total" />
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
                             <asp:SqlDataSource ID="fin_ini_source_financeiro" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="sp_vw_fin_inicio" SelectCommandType="StoredProcedure">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="proj_financeiro_dropacao" Name="acao" 
                                         PropertyName="SelectedValue" DefaultValue="" Type="String" />
                                     <asp:ControlParameter ControlID="proj_financeiro_dropstatus" 
                                         Name="st_financeiro" PropertyName="SelectedValue" 
                                         DefaultValue="" Type="String" />
                                     <asp:ControlParameter ControlID="proj_financeiro_dropresponsavel_entrega" 
                                         Name="resp_entrega" PropertyName="SelectedValue" 
                                         DefaultValue="" Type="String" />
                                     <asp:ControlParameter ControlID="proj_financeiro_dropproduto" Name="produto" 
                                         PropertyName="SelectedValue" DefaultValue="" Type="String" />
                                     <asp:ControlParameter ControlID="proj_financeiro_dropperiodo" Name="periodo" 
                                         PropertyName="SelectedValue" DefaultValue="" Type="String" />
                                     <asp:ControlParameter ControlID="proj_financeiro_dropresponsavel_captacao" 
                                         Name="resp_captacao" PropertyName="SelectedValue" 
                                         DefaultValue="" Type="String" />
                                     <asp:ControlParameter ControlID="proj_financeiro_dropempresa" Name="empresa" 
                                         PropertyName="SelectedValue" DefaultValue="" Type="String" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                         </td>
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
                 <br />
             </asp:View>
             <asp:View ID="fin_info" runat="server">
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
                             <asp:Label ID="label_msg_fin_info" runat="server" Font-Bold="True" 
                                 ForeColor="Red"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label8" runat="server" Text="status financeiro*"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label9" runat="server" Text="status nota"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label10" runat="server" Text="observações financeiras"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:DropDownList ID="fin_info_drop_status_financeiro" runat="server" 
                                 AppendDataBoundItems="True" Height="20px" 
                                 Width="320px" DataSourceID="fin_info_source_stauts_financeiro" 
                                 DataTextField="descricao" DataValueField="id">
                                 <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="fin_info_source_stauts_financeiro" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT [id], [descricao] FROM [vw_fin_status]">
                             </asp:SqlDataSource>
                         </td>
                         <td>
                             <asp:DropDownList ID="fin_info_drop_status_nota" runat="server" 
                                 AppendDataBoundItems="True" Height="20px" 
                                 Width="320px" DataSourceID="fin_info_source_status_nota" 
                                 DataTextField="descricao" DataValueField="id">
                                 <asp:ListItem Value="0">Escolha a opção</asp:ListItem>
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="fin_info_source_status_nota" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="SELECT [id], [descricao] FROM [vw_fin_nota]">
                             </asp:SqlDataSource>
                         </td>
                         <td rowspan="4">
                             <asp:TextBox ID="fin_info_text_observacoes" Height="80px" Width="320px" 
                                 runat="server" TextMode="MultiLine"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label35" runat="server" Text="código da nota fiscal"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_cod_nota" runat="server" 
                                 Height="20px" Width="320px"></asp:TextBox>
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Button ID="proj_observacoes_adicionar" runat="server" Height="20px" 
                                 onclick="proj_observacoes_adicionar_Click" Text="cadastrar" Width="120px" />
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label34" runat="server" Text="Informações da Ação"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td colspan="3">                             
                             <hr style="border-style: none none dashed none" /></td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label11" runat="server" Text="ação"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label12" runat="server" Text="produto"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label13" runat="server" Text="empresa"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_acao" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_produto" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_empresa" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label14" runat="server" Text="projeto"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label15" runat="server" Text="responsável entrega"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label16" runat="server" Text="responsável captação"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_projeto" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_entrega" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_captacao" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label32" runat="server" Text="data liberação para faturamento"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label18" runat="server" Text="equipe entrega"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label19" runat="server" 
                                 Text="researcher ou analista responsável"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_data_liberacao_faturamento" runat="server" 
                                 Enabled="False" Height="20px" Width="320px"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_equipe_entrega" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_analista_responsavel" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label20" runat="server" Text="imposto"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label21" runat="server" Text="valor bruto"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label17" runat="server" Text="fee"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_imposto" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_valordanota" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_fee" runat="server" Enabled="False" 
                                 Height="20px" Width="320px"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label23" runat="server" Text="candidato"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label24" runat="server" Text="salario inicial/base faturamento"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label25" runat="server" Text="salario final"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_candidato" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_salario_ini" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_salario_fim" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label26" runat="server" Text="mult. salarios"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label27" runat="server" Text="data de vencimento"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label28" runat="server" Text="e-mail do contato"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_mult_salario" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_data_vencimento" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_email_contato" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label29" runat="server" Text="número no vagas"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label30" runat="server" Text="requisição no vagas"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label31" runat="server" Text="quantidade de parcelas"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_nro_vagas" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_req_vagas" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_quantidade_parcelas" runat="server" Height="20px" 
                                 Width="320px" Enabled="False"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label36" runat="server" Text="valor total"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label37" runat="server" Text="percentual"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_valor_total" runat="server" Enabled="False" 
                                 Height="20px" Width="320px"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox ID="fin_info_text_percentual" runat="server" Enabled="False" 
                                 Height="20px" Width="320px"></asp:TextBox>
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label22" runat="server" Text="particularidades da negociação"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label33" runat="server" Text="despesas"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox ID="fin_info_text_particularidades" runat="server" Enabled="False" 
                                 Height="160px" TextMode="MultiLine" Width="320px"></asp:TextBox>
                         </td>
                         <td>
                         <asp:Panel ID="Panel1" runat="server" Width="320px" Height="180px" style="overflow:auto">
                             <asp:GridView ID="fin_info_grid_despesas" runat="server" BackColor="White" 
                                 BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                 ForeColor="Black" GridLines="Vertical" AllowPaging="False" 
                                 AutoGenerateColumns="False" DataKeyNames="id" 
                                 DataSourceID="fin_ini_source_despesas" PageSize="5">
                                 <AlternatingRowStyle BackColor="White" />
                                 <Columns>
                                     <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                         ReadOnly="True" SortExpression="id" Visible="False" />
                                     <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                         SortExpression="id_projeto" Visible="False" />
                                     <asp:BoundField DataField="id_despesa" HeaderText="id_despesa" 
                                         SortExpression="id_despesa" Visible="False" />
                                     <asp:BoundField DataField="descricao" HeaderText="descricao" 
                                         SortExpression="descricao" />
                                     <asp:BoundField DataField="vl_despesa" HeaderText="vl_despesa" 
                                         SortExpression="vl_despesa" DataFormatString="{0:C2}"/>
                                     <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" 
                                         SortExpression="nome_usuario" />
                                     <asp:BoundField DataField="dt_cadastro" HeaderText="dt_cadastro" 
                                         ReadOnly="True" SortExpression="dt_cadastro" />
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
                             <asp:SqlDataSource ID="fin_ini_source_despesas" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                                 SelectCommand="sp_vw_fin_proj_despesas" SelectCommandType="StoredProcedure">
                                 <SelectParameters>
                                     <asp:SessionParameter Name="id_projeto" SessionField="IDprojeto" Type="Int32" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                         </td>
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
