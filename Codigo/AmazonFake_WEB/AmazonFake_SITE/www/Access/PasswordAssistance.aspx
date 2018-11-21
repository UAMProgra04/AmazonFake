<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="PasswordAssistance.aspx.cs" Inherits="AmazonFake_SITE.www.Access.PasswordAssistance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="Contenedor">
	<div>
        <asp:Image class="amazonfake_logo" ID="Im_amazonfake_logo" src="../../Imagenes/Access/amazonfake_logo.png" runat="server" />
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
                <asp:Button class="BotonSingIn" ID="btn_Continue" runat="server" Text="Continue" />
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
        <asp:HyperLink class="linksFooter linksFoo1" ID="linksFoo1" NavigateUrl="#" runat="server">Conditions of Use</asp:HyperLink>
        <asp:HyperLink class="linksFooter linksFoo2" ID="linksFoo2" NavigateUrl="#" runat="server">Privacy Notice</asp:HyperLink>
        <asp:HyperLink class="linksFooter" NavigateUrl="#" runat="server">Help</asp:HyperLink>
    </div>
</div>
</asp:Content>
