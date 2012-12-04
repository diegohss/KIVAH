<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorio_Contatos.aspx.cs" Inherits="HavikTeste.Relatorios.Relatorio_Contatos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                RELATÓRIO DE CONTATOS NO PERÍODO - 
    &nbsp;<asp:Label ID="label_periodo" runat="server" Text=""></asp:Label>
    </div>   
    <div>    
        <asp:GridView ID="grid_relatorio_contatos" runat="server" 
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
                <asp:BoundField DataField="funcao" HeaderText="funcao" SortExpression="funcao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="nome_usuario" HeaderText="nome_usuario" SortExpression="nome_usuario">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="contato_entrevista_havik_mes" HeaderText="contato_entrevista_havik_mes" SortExpression="contato_entrevista_havik_mes">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="contato_entrevista_havik_dia" HeaderText="contato_entrevista_havik_dia" SortExpression="contato_entrevista_havik_dia">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="contato_sem_perfil_para_o_projeto_mes" HeaderText="contato_sem_perfil_para_o_projeto_mes" SortExpression="contato_sem_perfil_para_o_projeto_mes">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="contato_sem_perfil_para_o_projeto_dia" HeaderText="contato_sem_perfil_para_o_projeto_dia" SortExpression="contato_sem_perfil_para_o_projeto_dia">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>  
                <asp:BoundField DataField="contato_nao_tem_interesse_mes" HeaderText="contato_nao_tem_interesse_mes" SortExpression="contato_nao_tem_interesse_mes">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="contato_nao_tem_interesse_dia" HeaderText="contato_nao_tem_interesse_dia" SortExpression="contato_nao_tem_interesse_dia">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="contato_offlimits_mes" HeaderText="contato_offlimits_mes" SortExpression="contato_offlimits_mes">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="contato_offlimits_dia" HeaderText="contato_offlimits_dia" SortExpression="contato_offlimits_dia">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="contato_outro_processo_na_empresa_mes" HeaderText="contato_outro_processo_na_empresa_mes" SortExpression="contato_outro_processo_na_empresa_mes">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="contato_outro_processo_na_empresa_dia" HeaderText="contato_outro_processo_na_empresa_dia" SortExpression="contato_outro_processo_na_empresa_dia">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="contato_possivel_perfil_mes" HeaderText="contato_possivel_perfil_mes" SortExpression="contato_possivel_perfil_mes">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>     
                <asp:BoundField DataField="contato_possivel_perfil_dia" HeaderText="contato_possivel_perfil_dia" SortExpression="contato_possivel_perfil_dia">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="total_mes" HeaderText="total_mes" SortExpression="total_mes">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="total_dia" HeaderText="total_dia" SortExpression="total_dia">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>          
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>

</html>
