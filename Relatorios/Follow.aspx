<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Follow.aspx.cs" Inherits="HavikTeste.Relatorios.Follow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                VAGAS ABERTAS
    </div>   
    <div>    
        <asp:GridView ID="grid_relatorio_follow" runat="server" 
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
                <asp:BoundField DataField="id_cliente" HeaderText="id cliente" SortExpression="id_cliente">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="nome_cliente" HeaderText="nome cliente" SortExpression="nome_cliente">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="dt_agendada" HeaderText="data agendada" SortExpression="dt_agendada" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="responsavel_follow" HeaderText="responsavel follow" SortExpression="responsavel_follow">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="classificacao" HeaderText="classificacao" SortExpression="classificacao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>                  
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
