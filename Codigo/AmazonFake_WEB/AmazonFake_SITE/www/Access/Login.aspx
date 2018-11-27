<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" enableEventValidation="false" validateRequest="false"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AmazonFake_SITE.www.Access.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="Contenedor">
    <div>
        <asp:Image class="amazonfake_logo" ID="Im_amazonfake_logo" src="../../img/Access/amazonfake_logo.png" runat="server" />
    </div>
	<section class="SectionForm">
		<form class="Form" action="">
			<div>
                <asp:Label class="SingIn" ID="lbl_SingIn" runat="server" Text="Sing in"></asp:Label>
			</div>
			<div class="divForm">
                <asp:Label class="labelsForm" ID="lbl_email" for="txt_email"  runat="server" Text="Email"></asp:Label>
                <asp:TextBox class="input_Formulario" type="email" ID="txt_email" runat="server" 
                    pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" MaxLength="80" placeholder="Digite su Correo"></asp:TextBox>
                
                <asp:Label class="labelsForm" ID="lbl_contrasena" for="txt_contrasena" runat="server" Text="Password"></asp:Label>
                <asp:HyperLink class="Clave" ID="hl_Clave" NavigateUrl="~/www/Access/PasswordAssistance.aspx" runat="server">Forgot your password?</asp:HyperLink>
                <asp:TextBox class="input_Formulario" type="password" ID="txt_contrasena" placeholder="Digite su Clave" 
                    pattern="[a-zA-Z0-9]{1,12}" MaxLength="12" runat="server"></asp:TextBox>
			</div>
			<div >
                <asp:Button class="BotonSingIn" ID="btn_SingIn" runat="server" Text="Sing in" OnClick="btn_SingIn_Click" />
			</div>
			<div>
                <asp:CheckBox Class="keep_me" runat="server" />
                <asp:Label ID="lbl_keep_me" for="keep_me" runat="server" Text="Keep me signed in"></asp:Label>
			</div>
		    <div>
                <br />
                <hr class="hr" />
                <asp:Button class="BotonCreateAccount" ID="btn_CreateAccount" runat="server" Text="Create your Amazon Account" onclick="btn_CreateAccount_Click" />
		    </div>
            <div>
                <center>
                    <asp:Label ID="lbl_Errores" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                </center>
            </div>  
		</form>
	</section>
    <div class="footer">
        <hr class="hr2" /><br />
    </div>
</div>
</asp:Content>
