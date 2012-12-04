<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Visitas_Agendadas.aspx.cs" Inherits="HavikTeste.Relatorios.Visitas_Agendadas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                VISITAS AGENDADAS
    </div>   
    <div>    
        <asp:GridView ID="grid_relatorio_visitas_agendadas" runat="server" 
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
                <asp:BoundField DataField="quando" HeaderText="quando" SortExpression="quando" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" DataFormatString="{0:t}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="result_esperados" HeaderText="resultados esperados" SortExpression="result_esperados" ItemStyle-Width="200px">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="com_quem" HeaderText="com quem" SortExpression="com_quem">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>                                
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
