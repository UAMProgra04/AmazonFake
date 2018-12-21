<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Ventas.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
<center>
    <br />
    <asp:Label ID="lbl_Error" runat="server"></asp:Label>
    <br />
    <asp:Label ID="lbl_Clientes" runat="server" Text="Lista de Clientes"></asp:Label>
    <br />
    <asp:GridView ID="GV_ALL_Ventas" runat="server" ></asp:GridView>
</center>
</div>
</asp:Content>
