<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="AmazonFake_SITE.www.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<asp:Table ID="Table1" runat="server" style="width: 88%">
    <asp:TableRow>
         <asp:TableCell ColumnSpan="3">
            <asp:Label ID="lbl_Error" runat="server"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    
    <asp:TableRow>
        <asp:TableCell style="width: 77px"></asp:TableCell>
        <asp:TableCell style="width: 397px">
            <asp:TextBox ID="txtCodigo" runat="server" Visible="False"></asp:TextBox>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">
            <strong>Fecha :</strong>
        </asp:TableCell>
        <asp:TableCell style="width: 397px">
            <asp:Label ID="lblFecha" runat="server" Text="Label"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">
            Cliente :
        </asp:TableCell>
        <asp:TableCell style="width: 397px">
            <asp:TextBox ID="txtCliente" runat="server" Width="332px"></asp:TextBox>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">
            Email :
        </asp:TableCell>
        <asp:TableCell style="width: 397px">
            <asp:TextBox ID="TextCorreoCliente" runat="server" TextMode="Email" Width="329px"></asp:TextBox>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

     <asp:TableRow>
        <asp:TableCell style="width: 77px">&nbsp;</asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="505px" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Quitar">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="19px" 
                                    ImageUrl="~/img/borrar.jpg" Width="20px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="codproducto" HeaderText="Codigo" />
                        <asp:BoundField DataField="desproducto" HeaderText="Descripcion" />
                        <asp:BoundField DataField="preproducto" HeaderText="Precio" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="73px">1</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="subtotal" HeaderText="Sub Total" />
                    </Columns>
                </asp:GridView>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">&nbsp;</asp:TableCell>
        <asp:TableCell style="width: 397px">&nbsp;</asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">&nbsp;</asp:TableCell>
        <asp:TableCell style="width: 397px; text-align: right">
            SubTotal S/ :&nbsp; 
            <asp:Label ID="lblSubTotal" runat="server" Text="Label"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">&nbsp;</asp:TableCell>
        <asp:TableCell style="width: 397px; text-align: right">
            IGV S/ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblIGV" runat="server" Text="Label"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">&nbsp;</asp:TableCell>
        <asp:TableCell style="width: 397px; text-align: right">
            Total S/ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">&nbsp;</asp:TableCell>
        <asp:TableCell style="width: 397px"></asp:TableCell>
        <asp:TableCell>&nbsp;</asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell style="width: 77px">&nbsp;</asp:TableCell>
        <asp:TableCell style="width: 397px">
            <asp:Button ID="Button1" runat="server" Text="Actualizar" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Continuar Compras" 
                    style="margin-left: 111px" Width="157px" OnClick="Button2_Click" />
        </asp:TableCell>
        <asp:TableCell>
            <asp:Button ID="Button3" runat="server" style="margin-left: 34px" 
                    Text="Comprar" Width="120px" OnClick="Button3_Click" />
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
</center>
</asp:Content>
