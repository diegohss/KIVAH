<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Base_Comercial.aspx.cs" Inherits="HavikTeste.Relatorios.Base_Comercial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="title" style="font-size: x-large; font-weight: bold;">
                <img src="Styles/Logo Havik preto.jpg" style="height: 50px; width: 140px" />
                RELATÓRIO COMERCIAL
    </div>   
    <div>
    <asp:GridView ID="grid_relatorio_base_comercial" runat="server" 
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
                <asp:BoundField DataField="resp_captacao" HeaderText="resp_captacao" SortExpression="resp_captacao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="equipe_entrega" HeaderText="equipe_entrega" SortExpression="equipe_entrega">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="resp_entrega" HeaderText="resp_entrega" SortExpression="resp_entrega">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                <asp:BoundField DataField="researcher" HeaderText="researcher" SortExpression="researcher">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="cliente" HeaderText="cliente" SortExpression="cliente">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>                
                <asp:BoundField DataField="publicado" HeaderText="publicado" SortExpression="publicado">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="produto" HeaderText="produto" SortExpression="produto">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="projeto" HeaderText="projeto" SortExpression="projeto">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="ult_status_projeto" HeaderText="ult_status_projeto" SortExpression="ult_status_projeto">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="data_abertura" HeaderText="data_abertura" SortExpression="data_abertura" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="dias_vaga" HeaderText="dias_vaga" SortExpression="dias_vaga">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="salario" HeaderText="salario" SortExpression="salario" DataFormatString="{0:F2}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>   
                
                <asp:BoundField DataField="acao" HeaderText="acao" SortExpression="acao">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="fee" HeaderText="fee" SortExpression="fee" DataFormatString="{0:F2}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="valor_total" HeaderText="valor_total" SortExpression="valor_total" DataFormatString="{0:F2}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>      
                <asp:BoundField DataField="valor" HeaderText="valor total faturado" SortExpression="valor" DataFormatString="{0:F2}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                
                <asp:BoundField DataField="forecast" HeaderText="forecast" SortExpression="forecast" DataFormatString="{0:F2}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>  
                <asp:BoundField DataField="cdd_alocados" HeaderText="cdd_alocados" SortExpression="cdd_alocados">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField> 
                <asp:BoundField DataField="candidatos_shortlist" HeaderText="candidatos_shortlist" SortExpression="candidatos_shortlist">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="dt_ult_shortlist" HeaderText="data ultima shortlist" SortExpression="dt_ult_shortlist" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle Wrap="False" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
