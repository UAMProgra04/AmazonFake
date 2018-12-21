<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Productos.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:Label ID="Label11" runat="server" Text="Administracion de Productos"></asp:Label>
            <br /><br />
            <asp:Label ID="lbl_Error" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lbl_Productos" runat="server" Text="Lista de Productos"></asp:Label>
            <br />
            <asp:GridView ID="GV_ALL_PRODUCT" runat="server" ></asp:GridView>          
        </center>
    </div>
    <hr />
    <div>
        <center>
            <asp:Label ID="Label2" runat="server" Text="Ingreso de productos al sistema"></asp:Label>
            <br /><br />
            <asp:Label ID="lbl_Resultados" runat="server"></asp:Label>
            
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Codigo Producto"></asp:Label> 
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label4" runat="server" Text="Nombre Producto">
                        </asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_CodProducto" runat="server" type="number"  MaxLength="4"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_NomProducto" runat="server" 
                            pattern="[a-zA-ZñÑ\s]{2,40}" MaxLength="40"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label5" runat="server" Text="Codigo Categoria">
                        </asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label6" runat="server" Text="Pecio">
                        </asp:Label><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:TextBox ID="Text_CodCategoria" runat="server" MaxLength="2"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_PrecioProduc" runat="server" pattern="[0-9]{1,3}(\,[0-9]{3}" MaxLength="7">
                        </asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell><asp:Label ID="Label7" runat="server" Text="Cantidad Ingresada"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label8" runat="server" Text="Imagen"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_CantidadStock" runat="server" type="number" MaxLength="5"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_ImagenProducto" runat="server" MaxLength="30"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="btn_Agregar_Articulo" runat="server" Text="Crear Cuenta" OnClick="btn_Agregar_Articulo_Click"></asp:Button>
        </center>
    </div>
    <hr />
    <div>
        <center>
            <asp:Label ID="Label1" runat="server" Text="Eliminar producto del sistema"></asp:Label>
            <br /><br />
            <asp:Label ID="lblErrorBorrado" runat="server"></asp:Label>
        <asp:Table ID="Table2" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="Text_eliminar" runat="server" pattern="[a-zA-ZñÑ\s]{2,40}" 
                        MaxLength="40"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btn_eliminar" runat="server" Text="Eliminar Produc" OnClick="btn_eliminar_Click"></asp:Button>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </center>
    </div>




</asp:Content>
