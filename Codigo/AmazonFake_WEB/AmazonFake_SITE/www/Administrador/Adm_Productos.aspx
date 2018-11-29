<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Productos.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:Label ID="lbl_Proveedores" runat="server" Text="Lista de Productos"></asp:Label>
            <br />
            <asp:GridView ID="GV_ALL_PRODUCT" runat="server" ></asp:GridView>
        </center>
    </div>
    <div>
        <br />
        <center>
            <asp:Button ID="btn_CargarProductos" runat="server" Text="Ver Clientes" onclick="btn_CargarProductos_Click"/>
        </center>
    </div>
</asp:Content>
