﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vagas_Abertas.aspx.cs" Inherits="HavikTeste.Relatorios.Vagas_Abertas" %>

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
        <asp:GridView ID="grid_relatorio_vagas_abertas" runat="server" 
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
                <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" SortExpression="id_projeto">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="projeto" HeaderText="projeto" SortExpression="projeto">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="empresa" HeaderText="empresa" SortExpression="empresa">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="quem_captou" HeaderText="quem captou" SortExpression="quem_captou">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="equipe_entrega" HeaderText="equipe entrega" SortExpression="equipe_entrega">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="responsavel_entrega" HeaderText="responsavel entrega" SortExpression="responsavel_entrega">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="status_acao" HeaderText="último status" SortExpression="status_acao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="salario" HeaderText="salario da oferta" SortExpression="salario" DataFormatString="{0:C2}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="dt_inicio" HeaderText="data início" SortExpression="dt_inicio" DataFormatString="{0:dd/MM/yyyy hh:mm}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>                 
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>