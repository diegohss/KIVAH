<%@ Page MaintainScrollPositionOnPostback="true" Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="HavikTeste._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    &nbsp;<asp:MultiView ID="home_views" runat="server" ActiveViewIndex="0" >
        <asp:View ID="researcher1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Informações de Cliente"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="researcher1_1" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_researcher_grid_1" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            DataSourceID="grid_researcher1_1" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_researcher_grid_1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                    SortExpression="id_cliente" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="cliente" HeaderText="cliente" 
                                    SortExpression="cliente" />
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="data" HeaderText="data" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="data" />
                                <asp:BoundField DataField="hora" HeaderText="hora" ReadOnly="True" 
                                    SortExpression="hora" />
                                <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" 
                                    SortExpression="entrevistador" />
                                <asp:BoundField DataField="follow" HeaderText="follow" 
                                    SortExpression="follow" />
                                <asp:BoundField DataField="criador_status" HeaderText="criador_status" 
                                    SortExpression="criador_status" />
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
                        <asp:SqlDataSource ID="grid_researcher1_1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_r1_1" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Informações de Projeto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="researcher1_2" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_researcher_grid_2" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_projeto" 
                            DataSourceID="grid_researcher1_2" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_researcher_grid_2_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                    SortExpression="id_empresa" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_projeto" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                                    SortExpression="ultimo_status" />
                                <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                                    SortExpression="ultimo_substatus" />
                                <asp:BoundField DataField="dt_ini" HeaderText="dt_ini" DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_ini" ReadOnly="True" />
                                <asp:BoundField DataField="dt_prevista_shortlist" HeaderText="dt_prevista_shortlist"  DataFormatString="{0:dd/MM/yyyy}" 
                                    SortExpression="dt_prevista_shortlist" ReadOnly="True" />
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
                        <asp:SqlDataSource ID="grid_researcher1_2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_r1_2" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="researcher2" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Informações de Cliente"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="researcher2_1" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_researcher2_grid_1" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            DataSourceID="home_grid_r2_1" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_researcher2_grid_1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                    SortExpression="id_cliente" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="cliente" HeaderText="cliente" 
                                    SortExpression="cliente" />
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="data" HeaderText="data" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}" 
                                    SortExpression="data" />
                                <asp:BoundField DataField="hora" HeaderText="hora" ReadOnly="True" 
                                    SortExpression="hora" />
                                <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" 
                                    SortExpression="entrevistador" />
                                <asp:BoundField DataField="follow" HeaderText="follow" 
                                    SortExpression="follow" />
                                <asp:BoundField DataField="criador_status" HeaderText="criador_status" 
                                    SortExpression="criador_status" />
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
                        <asp:SqlDataSource ID="home_grid_r2_1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_r2_1" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Informações de Projeto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="researcher2_2" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_researcher2_grid_2" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_projeto" 
                            DataSourceID="home_grid_r2_2" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_researcher2_grid_2_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Exibir" />
                                <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                    SortExpression="id_empresa" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_projeto" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                                    SortExpression="ultimo_status" />
                                <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                                    SortExpression="ultimo_substatus" />
                                <asp:BoundField DataField="dt_ini" HeaderText="dt_ini"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_ini" ReadOnly="True" />
                                <asp:BoundField DataField="dt_prevista_shortlist" HeaderText="dt_prevista_shortlist"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_prevista_shortlist" ReadOnly="True" />
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
                        <asp:SqlDataSource ID="home_grid_r2_2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_r2_2" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="consultor" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Informações de Cliente"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="Panel5" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_consultor_grid_1" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            DataSourceID="home_consultor_grid1" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_consultor_grid_1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                    SortExpression="id_cliente" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="cliente" HeaderText="cliente" 
                                    SortExpression="cliente" />
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="data" HeaderText="data" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="data" />
                                <asp:BoundField DataField="hora" HeaderText="hora" ReadOnly="True" 
                                    SortExpression="hora" />
                                <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" 
                                    SortExpression="entrevistador" />
                                <asp:BoundField DataField="follow" HeaderText="follow" 
                                    SortExpression="follow" />
                                <asp:BoundField DataField="criador_status" HeaderText="criador_status" 
                                    SortExpression="criador_status" />
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
                        <asp:SqlDataSource ID="home_consultor_grid1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_consultor_1" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Informações de Projeto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="Panel4" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_consultor_grid_2" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_projeto" 
                            DataSourceID="home_consultor_grid2" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_consultor_grid_2_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                    SortExpression="id_empresa" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_projeto" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                                    SortExpression="ultimo_status" />
                                <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                                    SortExpression="ultimo_substatus" />
                                <asp:BoundField DataField="dt_ini" HeaderText="dt_ini"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_ini" ReadOnly="True" />
                                <asp:BoundField DataField="dt_prevista_shortlist" HeaderText="dt_prevista_shortlist"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_prevista_shortlist" ReadOnly="True" />
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
                        <asp:SqlDataSource ID="home_consultor_grid2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_consultor_2" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="partner" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Informações de Cliente"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="Panel3" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_partner_grid_1" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            DataSourceID="home_partner_grid1" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_partner_grid_1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                    SortExpression="id_cliente" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="cliente" HeaderText="cliente" 
                                    SortExpression="cliente" />
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="data" HeaderText="data" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="data" />
                                <asp:BoundField DataField="hora" HeaderText="hora" 
                                    SortExpression="hora" ReadOnly="True" />
                                <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" 
                                    SortExpression="entrevistador" />
                                <asp:BoundField DataField="follow" HeaderText="follow" 
                                    SortExpression="follow" />
                                <asp:BoundField DataField="criador_status" HeaderText="criador_status" 
                                    SortExpression="criador_status" />
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
                        <asp:SqlDataSource ID="home_partner_grid1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_partner_1" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Informações de Projeto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="Panel2" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_partner_grid_2" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_projeto" 
                            DataSourceID="home_partner_grid2" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_partner_grid_2_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                    SortExpression="id_empresa" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_projeto" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                                    SortExpression="ultimo_status" />
                                <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                                    SortExpression="ultimo_substatus" />
                                <asp:BoundField DataField="dt_ini" HeaderText="dt_ini"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_ini" ReadOnly="True" />
                                <asp:BoundField DataField="dt_prevista_shortlist" HeaderText="dt_prevista_shortlist"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_prevista_shortlist" ReadOnly="True" />
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
                        <asp:SqlDataSource ID="home_partner_grid2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_partner_2" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="coordenador" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Informações de Cliente"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="coordenador_1" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_coordenador_grid_1" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            DataSourceID="home_grid_coordenador1" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_coordenador_grid_1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Exibir" />
                                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                    SortExpression="id_cliente" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="cliente" HeaderText="cliente" 
                                    SortExpression="cliente" />
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="data" HeaderText="data" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="data" />
                                <asp:BoundField DataField="hora" HeaderText="hora" ReadOnly="True" 
                                    SortExpression="hora" />
                                <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" 
                                    SortExpression="entrevistador" />
                                <asp:BoundField DataField="follow" HeaderText="follow" 
                                    SortExpression="follow" />
                                <asp:BoundField DataField="criador_status" HeaderText="criador_status" 
                                    SortExpression="criador_status" />
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
                        <asp:SqlDataSource ID="home_grid_coordenador1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_coordenador_1" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Informações de Projeto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="Panel1" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_coordendor_grid_2" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_projeto" 
                            DataSourceID="home_coordenador_grid2" ForeColor="Black" 
                            GridLines="Vertical" 
                            onselectedindexchanged="home_coordendor_grid_2_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Exibir" />
                                <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                    SortExpression="id_empresa" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_projeto" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="responsavel_entrega" 
                                    HeaderText="responsavel_entrega" SortExpression="responsavel_entrega" />
                                <asp:BoundField DataField="colaborador_responsavel" 
                                    HeaderText="colaborador_responsavel" SortExpression="colaborador_responsavel" />
                                <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                                    SortExpression="ultimo_status" />
                                <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                                    SortExpression="ultimo_substatus" />
                                <asp:BoundField DataField="dt_ini" HeaderText="dt_ini"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_ini" ReadOnly="True" />
                                <asp:BoundField DataField="dt_prevista_shortlist" HeaderText="dt_prevista_shortlist"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_prevista_shortlist" ReadOnly="True" />
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
                        <asp:SqlDataSource ID="home_coordenador_grid2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_coordenador_2" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="assistente_operacional" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Informações de Cliente"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="assistente_1" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_assistente_grid_1" runat="server" 
                            AutoGenerateColumns="False" DataSourceID="home_assistente_1" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True" 
                            onselectedindexchanged="home_assistente_grid_1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" 
                                    SortExpression="id_cliente" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    SortExpression="id_projeto" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="cliente" HeaderText="cliente" 
                                    SortExpression="cliente" />
                                <asp:BoundField DataField="status" HeaderText="status" 
                                    SortExpression="status" />
                                <asp:BoundField DataField="substatus" HeaderText="substatus" 
                                    SortExpression="substatus" />
                                <asp:BoundField DataField="data" HeaderText="data" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="data" />
                                <asp:BoundField DataField="hora" HeaderText="hora" ReadOnly="True" 
                                    SortExpression="hora" />
                                <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" 
                                    SortExpression="entrevistador" />
                                <asp:BoundField DataField="follow" HeaderText="follow" 
                                    SortExpression="follow" />
                                <asp:BoundField DataField="criador_status" HeaderText="criador_status" 
                                    SortExpression="criador_status" />
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
                        <asp:SqlDataSource ID="home_assistente_1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_asssitente_1" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="Informações de Projeto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Panel ID="asssitente2" runat="server" Height="220px" 
                        style="overflow:auto" Width="1020px">
                        <asp:GridView ID="home_assistente_grid_2" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_projeto" 
                            DataSourceID="home_assistente_2" ForeColor="Black" GridLines="Vertical" 
                            onselectedindexchanged="home_assistente_grid_2_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Exibir" ShowSelectButton="True" />
                                <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                                    SortExpression="id_empresa" />
                                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_projeto" />
                                <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                    SortExpression="empresa" />
                                <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                    SortExpression="projeto" />
                                <asp:BoundField DataField="ultimo_status" HeaderText="ultimo_status" 
                                    SortExpression="ultimo_status" />
                                <asp:BoundField DataField="ultimo_substatus" HeaderText="ultimo_substatus" 
                                    SortExpression="ultimo_substatus" />
                                <asp:BoundField DataField="dt_ini" HeaderText="dt_ini" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}"
                                    SortExpression="dt_ini" />
                                <asp:BoundField DataField="dt_prevista_shortlist" DataFormatString="{0:dd/MM/yyyy}"
                                    HeaderText="dt_prevista_shortlist" ReadOnly="True" 
                                    SortExpression="dt_prevista_shortlist" />
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
                        <asp:SqlDataSource ID="home_assistente_2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:havikConnectionString %>" 
                            SelectCommand="sp_vw_home_asssitente_2" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="IDusuario" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <br />
&nbsp;
    
</asp:Content>
