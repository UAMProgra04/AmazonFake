<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Usuarios.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:Label ID="Label1" runat="server" Text="Buscar Empleado por : "></asp:Label>
            <asp:DropDownList ID="SeleccionBusqueda" runat="server">
                <asp:ListItem Value="1">Correo</asp:ListItem>
                <asp:ListItem Value="2">Nombre</asp:ListItem>
                <asp:ListItem Value="3">Identificacion</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="lbl_Error" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="txt_Buscar" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btn_CargarEmpleados" runat="server" Text="Buscar" onclick="btn_CargarEmpleados_Click"/>
            <asp:Button ID="btn_Limpir" runat="server" Text="Limpiar" OnClick="btn_Limpir_Click"></asp:Button>
        </center>
    </div>
    <div>
        <br />
        <center>
            
            <asp:Label ID="lbl_Clientes" runat="server" Text="Lista de Clientes"></asp:Label>
            <br />
            <asp:GridView ID="GV_ALL_USER" runat="server" ></asp:GridView>
        </center>
    </div>



    <hr />
    <div>
        <center>
            <asp:TextBox ID="TextCorreo" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextNombre" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextIdentificacion" runat="server"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="TextDireccion" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextTelefono" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextPerfil" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btn_Actualizar" runat="server" Text="Actualizar" OnClick="btn_Actualizar_Click" ></asp:Button>
            <asp:Button ID="btn_Eliminar" runat="server" Text="Eliminar" OnClick="btn_Eliminar_Click"></asp:Button>
        </center>
    </div>
    <hr />
    <div>
        <center>
            <asp:TextBox ID="TextStatus" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ChangeStatus" runat="server">
                <asp:ListItem Value="Activo">Activo</asp:ListItem>
                <asp:ListItem Value="Inactivo"></asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            <asp:Button ID="btn_validarEstado" runat="server" Text="validar Estado" OnClick="btn_validarEstado_Click"></asp:Button>
            <asp:Button ID="btn_ChangeStatus" runat="server" Text="Cambiar Estado" OnClick="btn_ChangeStatus_Click"></asp:Button>
        </center>
    </div>
</asp:Content>
