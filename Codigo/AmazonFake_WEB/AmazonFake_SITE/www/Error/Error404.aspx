<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="AmazonFake_SITE.www.Error404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" type="text/css" href="../../css/Error/Error.css">
    <title>Error Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <div>
                <asp:Image class="amazonfake_logo" ID="Im_amazonfake_logo" src="../../Imagenes/Access/amazonfake_logo.png" runat="server" />
            </div>
            <div class="contenidoError">
                <span class="BuscarAlgo">¿Buscas algo?</span>
                <p>
                   <br />
                   Lo sentimos. La dirección web que has especificado no es una página activa de nuestro sitio.<br />
                   Ir a la página de <asp:HyperLink class="hl_Error404" ID="hl_Error404" NavigateUrl="~/www/Index.aspx" runat="server">Inicio</asp:HyperLink> de Amazon.
                </p>
            </div>
        </center>
    </div>
    </form>
</body>
</html>
