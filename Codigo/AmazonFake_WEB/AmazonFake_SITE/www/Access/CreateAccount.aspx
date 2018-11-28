<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" enableEventValidation="false" validateRequest="false" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="AmazonFake_SITE.www.Access.CreateAccount" %>
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
                <asp:Label class="SingIn" ID="lbl_CreateAccount" runat="server" Text="Create account"></asp:Label>
		    </div>
            <div>
                <center>
                    <asp:Label ID="lbl_Errores" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                </center>
            </div>
		    <div class="divForm">
                <asp:Label class="labelsForm" ID="lbl_nombre" for="txt_nombre" runat="server" Text="Your name"></asp:Label>
                <asp:TextBox class="input_Formulario" ID="txt_nombre" placeholder="Digite su Nombre" runat="server" required="required"
                    pattern="[a-zA-ZñÑ\s]{2,100}" MaxLength="100" ></asp:TextBox>

                <asp:Label class="labelsForm" ID="lbl_email" for="txt_email" runat="server" Text="Email"></asp:Label>
                <asp:TextBox class="input_Formulario" type="email" ID="txt_email" runat="server" placeholder="Digite su Correo" required="required"
                    pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" MaxLength="80" ></asp:TextBox>

                <asp:Label class="labelsForm" ID="lbl_contrasena" for="txt_contrasena" runat="server" Text="Password"></asp:Label>
                <asp:TextBox class="input_Formulario" type="password" ID="txt_contrasena" placeholder="Digite su Clave" runat="server" 
                    required="required" pattern="[a-zA-Z0-9]{1,12}" MaxLength="12" ></asp:TextBox>

                <asp:Label class="labelsForm" ID="lbl_contrasena2" for="txt_contrasena2" runat="server" Text="Re-enter password"></asp:Label> 
                <asp:TextBox class="input_Formulario" type="password" ID="txt_contrasena2" placeholder="Re-Ingrese su Clave" runat="server" 
                    required="required" pattern="[a-zA-Z0-9]{1,12}" MaxLength="12" ></asp:TextBox>
		    </div>
		    <div >
                <asp:Button class="BotonSingIn" ID="btn_Createaccount" runat="server" Text="Create your Amazon account" OnClick="btn_Createaccount_Click" />
		    </div>
		    <div>
			    <p>
                    <asp:Label Class="Terms" ID="Label1" runat="server" Text="By creating an account, you agree to Amazon's"></asp:Label><br />
                    <asp:Label Class="Terms" ID="Label2" runat="server" Text="Conditions of Use and Privacy Notice."></asp:Label>
			    </p>
		    </div>
		    <div>
                <br />
                <hr class="hr" />
                <br />
		        <p>
		      	    Already have an account? <asp:HyperLink ID="hl_SingIn" NavigateUrl="~/www/Access/Login.aspx" runat="server">Sing in</asp:HyperLink>
		        </p>
		    </div>
	    </form>
    </section>
    <div class="footer">
        <hr class="hr2" /><br />
    </div>
</div>
</asp:Content>
