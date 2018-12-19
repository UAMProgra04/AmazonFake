<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="UserPerfil.aspx.cs" Inherits="AmazonFake_SITE.www.Usuario.UserPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="SectionForm">
        <asp:Label ID="Label1" runat="server" Text="Actualizar informacion del Perfil del Usuario"></asp:Label>
        <br />
        <asp:Label ID="lbl_Error" runat="server" ></asp:Label>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Correo" runat="server" Text="Correo Electronico: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Correo" runat="server" type="email" required="required"
                    pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" MaxLength="80"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Nombre" runat="server" Text="Nombre Completo: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Nombre" runat="server" 
            pattern="[a-zA-ZñÑ\s]{2,100}" MaxLength="100"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Identificacion" runat="server" Text="Numero de Identificacion: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Identificacion" runat="server" required="required"
            pattern="[0-9]{1,9}(\.[0-9]{0,2})?$" MaxLength="9"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Direccion" runat="server" Text="Direccion Exacta para entregas: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Direccion" runat="server" MaxLength="150" required="required"></asp:TextBox>
        <hr />
        <asp:Label class="labelsForm" ID="lbl_Telefono" runat="server" Text="Telefono: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Telefono" runat="server" required="required"
            pattern="^[+-]?\d+(\.\d+)?$"  MaxLength="15"></asp:TextBox>
        <hr />
        <asp:Button class="BotonSingIn" ID="btn_ActualizarDatos_Cliente" runat="server" Height="40" 
            Font-Size="15" ForeColor="White" Text="Actualizar" OnClick="btn_ActualizarDatos_Cliente_Click" />
    </div>
</asp:Content>
