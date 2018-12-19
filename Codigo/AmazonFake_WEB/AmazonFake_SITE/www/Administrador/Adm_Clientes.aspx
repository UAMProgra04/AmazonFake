<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Clientes.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:Label ID="Label11" runat="server" Text="Administracion de Clientes para AmazonFake"></asp:Label>
            <br /><br />
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
    <hr />
    <div>
        <center>
            <asp:Label ID="Label10" runat="server" Text="Usuario Cargado Despues de la Busqueda"></asp:Label>
            <asp:Table ID="Table3" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="TextCorreo" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextNombre" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextIdentificacion" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="TextDireccion" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextTelefono" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextPerfil" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow> 
            </asp:Table>   
            <br />
            <asp:Button ID="btn_Actualizar" runat="server" Text="Actualizar" OnClick="btn_Actualizar_Click" ></asp:Button>
            <asp:Button ID="btn_Eliminar" runat="server" Text="Eliminar" OnClick="btn_Eliminar_Click"></asp:Button>
        </center>
    </div>
    <hr />
    <div>
        <center>
            <asp:Label ID="Label9" runat="server" Text="Debloquear o Bloquear Cliente"></asp:Label>
            <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="TextStatus" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ChangeStatus" runat="server">
                            <asp:ListItem Value="Activo">Activo</asp:ListItem>
                            <asp:ListItem Value="Inactivo"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="btn_validarEstado" runat="server" Text="validar Estado" OnClick="btn_validarEstado_Click" ></asp:Button>
            <asp:Button ID="btn_ChangeStatus" runat="server" Text="Cambiar Estado" OnClick="btn_ChangeStatus_Click"></asp:Button>
        </center>
    </div>
</asp:Content>
