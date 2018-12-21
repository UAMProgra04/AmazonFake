<%@ Page Title="" Language="C#" MasterPageFile="~/AmazonFake.Master" AutoEventWireup="true" CodeBehind="Adm_Usuarios.aspx.cs" Inherits="AmazonFake_SITE.www.Administrador.Adm_Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:Label ID="Label11" runat="server" Text="Administracion de Empleados para AmazonFake"></asp:Label>
            <br /><br />
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
            <asp:Label ID="Label9" runat="server" Text="Debloquear o Bloquear Usuario"></asp:Label>
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
            <asp:Button ID="btn_validarEstado" runat="server" Text="validar Estado" OnClick="btn_validarEstado_Click"></asp:Button>
            <asp:Button ID="btn_ChangeStatus" runat="server" Text="Cambiar Estado" OnClick="btn_ChangeStatus_Click"></asp:Button>
        </center>
    </div>
    <hr />
    <div>
        <center>
            <asp:Label ID="Label2" runat="server" Text="Creacion de Cuentas de empleados"></asp:Label>
            <br /><br />
            <asp:Label ID="lbl_Resultados" runat="server"></asp:Label>
            
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Correo"></asp:Label> 
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label4" runat="server" Text="Nombre">
                        </asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_Email" runat="server" type="email"  
                            pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            MaxLength="80"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_Nom" runat="server" 
                            pattern="[a-zA-ZñÑ\s]{2,100}" MaxLength="100"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label5" runat="server" Text="Identificación">
                        </asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label6" runat="server" Text="Dirección">
                        </asp:Label><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:TextBox ID="Text_Id" runat="server" pattern="[0-9]{1,9}(\.[0-9]{0,2})?$" 
                             MaxLength="9"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_Dir" runat="server" MaxLength="150">
                        </asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell><asp:Label ID="Label7" runat="server" Text="Telefono">
                                   </asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label8" runat="server" Text="Contraseña"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_Tel" runat="server" pattern="^[+-]?\d+(\.\d+)?$" 
                            MaxLength="15"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Text_Pass" runat="server" type="password" 
                            pattern="[a-zA-Z0-9]{4,12}" MaxLength="12"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="btn_CrearCuentaEmpleado" runat="server" Text="Crear Cuenta" OnClick="btn_CrearCuentaEmpleado_Click"></asp:Button>
        </center>
    </div>
</asp:Content>
