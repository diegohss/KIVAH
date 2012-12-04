<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorio_Inconsistencias.aspx.cs" Inherits="HavikTeste.Relatorio_Inconsistencias" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                RELATÓRIO DE INCONSISTÊNCIAS NO PERÍODO - 
    &nbsp;<asp:Label ID="label_periodo" runat="server" Text=""></asp:Label>
    </div>   
    <div>
    
        <asp:GridView ID="grid_relatorio_inconsistencias" runat="server" 
            BackImageUrl="logoteste.png" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            <Columns>
                <asp:BoundField DataField="equipe" HeaderText="equipe" SortExpression="equipe">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" SortExpression="id_cliente">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="usuario_obs" HeaderText="usuario_obs" SortExpression="usuario_obs">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="data_obs" HeaderText="data_obs" SortExpression="data_obs">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="resp_agendamento" HeaderText="resp_agendamento" SortExpression="resp_agendamento">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="data_agendamento" HeaderText="data_agendamento" SortExpression="data_agendamento">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>    
                <asp:BoundField DataField="resp_aprovacao" HeaderText="resp_aprovacao" SortExpression="resp_aprovacao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="data_aprovacao" HeaderText="data_aprovacao" SortExpression="data_aprovacao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>          
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
