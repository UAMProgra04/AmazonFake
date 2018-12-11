<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Clientes.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:Label ID="lbl_Error" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Buscar Cliente: "></asp:Label>
            <br />
            <asp:TextBox ID="txt_Buscar" runat="server" OnTextChanged="txt_Buscar_TextChanged"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_Clientes" runat="server" Text="Lista de Clientes"></asp:Label>
            <br />
            <asp:GridView ID="GV_ALL_CLIENT" runat="server" ></asp:GridView>
        </center>
    </div>
    <div>
        <br />
        <center>
            <asp:Button ID="btn_CargarClientes" runat="server" Text="Ver Clientes" onclick="btn_CargarClientes_Click"/>
        </center>
    </div>
</asp:Content>
