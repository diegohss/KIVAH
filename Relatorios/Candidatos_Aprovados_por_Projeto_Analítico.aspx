<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Candidatos_Aprovados_por_Projeto_Analítico.aspx.cs" Inherits="HavikTeste.Candidatos_Aprovados_por_Projeto_Alanlítico" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                ANALÍTICO APROVADOS POR PROJETO NO PERÍODO - 
    &nbsp;<asp:Label ID="label_periodo" runat="server" Text=""></asp:Label>
    </div>   
    <div>
    
        <asp:GridView ID="candidatos_aprovados_por_projeto_analitico" runat="server" 
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
                <asp:BoundField DataField="equipe_usuario_obs" HeaderText="equipe_usuario_obs" SortExpression="equipe_usuario_obs">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" SortExpression="id_cliente">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="entrevistador" HeaderText="entrevistador" SortExpression="entrevistador">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>  
                <asp:BoundField DataField="projeto_cliente" HeaderText="projeto_cliente" SortExpression="projeto_cliente">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="nome_projeto" HeaderText="nome_projeto" SortExpression="nome_projeto">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>              
                <asp:BoundField DataField="candidato" HeaderText="candidato" SortExpression="candidato">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>                 
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
