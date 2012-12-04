﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorio_Contatos_Analitico.aspx.cs" Inherits="HavikTeste.Relatorios.Relatorio_Contatos_Analitico" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                RELATÓRIO DE CONTATOS ANALÍTICO NO PERÍODO - 
    &nbsp;<asp:Label ID="label_periodo" runat="server" Text=""></asp:Label>
    </div>   
    <div>
    
        <asp:GridView ID="grid_relatorio_contatos_analitico" runat="server" 
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
                <asp:BoundField DataField="contato" HeaderText="contato" SortExpression="contato">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" SortExpression="id_cliente">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="dt_criacao" HeaderText="dt_criacao" SortExpression="dt_criacao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="nota" HeaderText="nota" SortExpression="nota">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="observacao" HeaderText="observacao" SortExpression="observacao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="academico" HeaderText="academico" SortExpression="academico">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="profissional" HeaderText="profissional" SortExpression="profissional">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>                
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>