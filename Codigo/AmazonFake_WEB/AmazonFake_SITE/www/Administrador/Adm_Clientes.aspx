<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Clientes.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:Label ID="Label1" runat="server" Text="Buscar Cliente por : "></asp:Label>
            <asp:DropDownList ID="SeleccionBusqueda" runat="server">
                <asp:ListItem Value="1">Correo</asp:ListItem>
                <asp:ListItem Value="2">Nombre</asp:ListItem>
                <asp:ListItem Value="3">Identificacion</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="lbl_Error" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="txt_Buscar" runat="server" OnTextChanged="txt_Buscar_TextChanged"></asp:TextBox>
            <br />
            <asp:Button ID="btn_CargarClientes" runat="server" Text="Buscar" onclick="btn_CargarClientes_Click"/>
            <asp:Button ID="btn_Limpir" runat="server" Text="Limpiar" OnClick="btn_Limpir_Click"></asp:Button>
        </center>
    </div>
    <div>
        <br />
        <center>
            
            <asp:Label ID="lbl_Clientes" runat="server" Text="Lista de Clientes"></asp:Label>
            <br />
            <asp:GridView ID="GV_ALL_CLIENT" runat="server" ></asp:GridView>
        </center>
    </div>
</asp:Content>
