<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="UserChangePassword.aspx.cs" Inherits="AmazonFake_SITE.www.Usuario.UserChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="SectionForm">
        <hr />
        <asp:Label class="labelsForm" ID="lbl_email" for="txt_email"  runat="server" Text="Confirme su correo Electronico"></asp:Label>
                <asp:TextBox class="input_Formulario" type="email" ID="txt_email" runat="server" 
                    pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" MaxLength="80"></asp:TextBox>

        <asp:Label class="labelsForm" ID="lbl_Old_Password" runat="server" Text="Ingrese su contrasena actual: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_Old_Password" type="password" required="required" runat="server"
            pattern="[a-zA-Z0-9]{4,12}" MaxLength="12"></asp:TextBox>
        <asp:Label class="labelsForm" ID="lbl_New_Password" runat="server" Text="Ingrese su nueva contrasena: "></asp:Label>
        <asp:TextBox class="input_Formulario" ID="txt_New_Password" type="password" required="required" runat="server"
            pattern="[a-zA-Z0-9]{4,12}" MaxLength="12"></asp:TextBox>
        <hr />
         <asp:Button class="BotonSingIn" ID="btn_Cambiar_contrasena" runat="server" Height="40" Font-Size="15" 
             ForeColor="White" Text="Cambiar Contrasena" onclick="btn_Cambiar_contrasena_Click" />
        <br />
         <asp:Label ID="lbl_Respuesta" runat="server" ></asp:Label>
    </div>
</asp:Content>
