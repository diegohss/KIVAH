<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Visitas_Realizadas.aspx.cs" Inherits="HavikTeste.Relatorios.Visitas_Realizadas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                VISITAS REALIZADAS
    </div>   
    <div>    
        <asp:GridView ID="grid_relatorio_visitas_realizadas" runat="server" 
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
                <asp:BoundField DataField="empresa" HeaderText="empresa" SortExpression="empresa">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="segmento" HeaderText="segmento" SortExpression="segmento">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="colaborador_status" HeaderText="visitas feita por" SortExpression="colaborador_status">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="data_status" HeaderText="data do status" SortExpression="data_status">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="result_obtidos_esperados" HeaderText="resultados obtidos e esperados" SortExpression="result_obtidos_esperados">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>     
                <asp:BoundField DataField="quando" HeaderText="próxima ação em" SortExpression="quando">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>                        
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
