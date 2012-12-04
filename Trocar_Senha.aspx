<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trocar_Senha.aspx.cs" Inherits="HavikTeste.Trocar_Senha" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 414px;
        }
        .style4
        {
        }
        .style5
        {
            width: 220px;
        }
        div.menuEmpresa
{
    padding: 0px 0px 0px 0px;
    width: 100%;
    background-color:#767676
}

div.menuEmpresa ul
{
    list-style: none;
    margin: 0px;
    padding: 0px;
    width: 100%;
}

div.menuEmpresa ul li a
{
    background-color: #767676;
    border: 1px #868686 solid;
    color: #dde4ec;
    display: inherit;
    line-height: 1.35em;
    padding: 4px 20px;
    text-decoration: none;
    white-space: nowrap;
}

div.menuEmpresa ul li a:visited
{
    background-color: #767676;
}

div.menuEmpresa ul li a:hover
{
    background-color: #bfcbd6;
    color: #465c71;
    text-decoration: none;
}

div.menuEmpresa ul li a:active
{
    background-color: #ffffff;
    color: #cfdbe6;
    text-decoration: none;
}

div.menuEmpresa.staticSelectedStyle
{
    background-color: #FFFFFF;
}
    </style>
</head>
<body style="background-image: url('Styles/city1.jpg');">
    <form id="form1" runat="server">
    <div class="title">
                <img src="Styles/Logoteste.png" style="height: 50px; width: 140px" />
         </div>         
      <div>           
             <table class="style1">
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style2" colspan="3">
                         <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Preencha os campos abaixo para efetuar sua troca de senha"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         <asp:TextBox ID="senha_antiga" runat="server" Width="190px" TextMode="Password" autocomplete="off"></asp:TextBox>
                     </td>
                     <td class="style3">
        
                         <asp:Label ID="Label2" runat="server" ForeColor="White" Text="senha antiga"></asp:Label>
        
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         <asp:TextBox ID="senha_nova1" runat="server" Width="190px" TextMode="Password"></asp:TextBox>
                     </td>
                     <td class="style3">
                         <asp:Label ID="Label3" runat="server" ForeColor="White" Text="senha nova"></asp:Label>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         <asp:TextBox ID="senha_nova2" runat="server" Width="190px" TextMode="Password"></asp:TextBox>
                     </td>
                     <td class="style3">
                         <asp:Label ID="Label4" runat="server" ForeColor="White" Text="digite novamente sua senha"></asp:Label>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style5">
                         &nbsp;</td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style4" colspan="3">
                                    <asp:Label ID="label_erro" runat="server" ForeColor="#FF3300"></asp:Label>
                                </td>
                 </tr>
                 <tr>
                     <td class="style5">
                                    <asp:Button ID="Button1" runat="server" Height="20px" Text="registrar" 
                                        Width="120px" onclick="Button1_Click"/>
                                </td>
                     <td class="style3">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
    </div>
    </form>
</body>
</html>
