<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" enableEventValidation="false" validateRequest="false" AutoEventWireup="true" CodeBehind="PasswordAssistance.aspx.cs" Inherits="AmazonFake_SITE.www.Access.PasswordAssistance" %>
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
                 <asp:Label class="SingIn" ID="lbl_PasswordAssistance" runat="server" Text="Password assistance"></asp:Label>
			</div>
			<div class="divForm">
				<div>
                    <asp:Label ID="Label1" runat="server" Text="Enter the email address associated with your Amazon account."></asp:Label>
				</div>
				<div>
                    <br />
                    <asp:Label class="labelsForm" ID="lbl_email" for="txt_email" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox class="input_Formulario" type="email" ID="txt_email" runat="server" placeholder="Digite su Correo"></asp:TextBox>
				</div>
			</div>
			<div >
                <asp:Button class="BotonSingIn" ID="btn_Continue" runat="server" Text="Continue" OnClick="btn_Continue_Click" />
			</div>
            <div>
                <center>
                    <asp:Label ID="lbl_Errores" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                </center>
            </div>
		</form>
		<div>
            <br />
			<p>
                <asp:Label class="Haschanged" ID="Label2" runat="server" Text="Has your email changed?"></asp:Label><br />
				If you no longer use the email address associated with your Amazon account, you may contact <asp:HyperLink class="CustomerService" ID="hl_CustomerService"  NavigateUrl="#" runat="server">Customer Service</asp:HyperLink> for help restoring access to your account.
			</p>
		</div>
	</section>
    <div class="footer">
        <hr class="hr2" /><br />
    </div>
</div>
</asp:Content>
