<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Productos_Tablets.aspx.cs" Inherits="AmazonFake_SITE.Productos_Tablets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<div>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>                                                 
                 <asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="codproducto" DataSourceID="SqlDataSource1" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand" >
                    <ItemTemplate>
                        <br />
                        <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/img/Imagenes/"+Eval("imagen") %>' />
                        <br />
                        Código :
                        <asp:Label ID="codproductoLabel" runat="server" Text='<%# Eval("codproducto") %>' />
                        <br />
                        Producto :
                        <asp:Label ID="desproductoLabel" runat="server" Text='<%# Eval("desproducto") %>' />
                        <br />
                        <%--Categoria :
                        <asp:Label ID="codcategoriaLabel" runat="server" Text='<%# Eval("codcategoria") %>' />
                        <br />--%>
                        Precio :
                        <asp:Label ID="preproductoLabel" runat="server" Text='<%# Eval("preproducto") %>' />
                        <%--<br />
                        Cantidad :
                        <asp:Label ID="canproductoLabel" runat="server" Text='<%# Eval("canproducto") %>' />
                        --%>
                        <br /><br />
                        <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar al Carrito" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL_AUTH%>" 
                    SelectCommand="SELECT codproducto,desproducto,codcategoria,preproducto,canproducto,imagen FROM PRODUCTOS Where codcategoria = 5"></asp:SqlDataSource>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</div>
</center>
</asp:Content>
