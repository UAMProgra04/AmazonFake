<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="UserPerfil.aspx.cs" Inherits="AmazonFake_SITE.www.Usuario.UserPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="SectionForm">
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Correo" runat="server" Text="Correo Electronico: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Correo" runat="server"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Nombre" runat="server" Text="Nombre Completo: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Nombre" runat="server"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Identificacion" runat="server" Text="Numero de Identificacion: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Identificacion" runat="server"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Direccion" runat="server" Text="Direccion Exacta para entregas: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Direccion" runat="server"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Telefono" runat="server" Text="Telefono: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Telefono" runat="server"></asp:TextBox>
        <hr />
        <asp:Button class="BotonSingIn" ID="btn_ActualizarDatos_Cliente" runat="server" Height="40" Font-Size="15" ForeColor="White" Text="Actualizar" />
    </div>
</asp:Content>
