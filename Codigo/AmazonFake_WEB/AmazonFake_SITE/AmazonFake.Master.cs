using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmazonFake_SITE
{
    public partial class AmazonFake : System.Web.UI.MasterPage
    {
        private void AdministracionPerfiles()
        {

            this.Opc_Nombre_Usuario.Visible = false;
            this.Opc_Cesta.Visible = false;
            this.Opc_IniciarSesion.Visible = true;
            this.Opc_CerrarSesion.Visible = false;

            this.Opc_Usuarios.Visible = false;
            this.Opc_Perfil_Usuario.Visible = false;
            this.Opc_CambioContrasena_Usuario.Visible = false;

            this.Opc_Administrativa.Visible = false;
            this.Opc_Administrativa_Clientes.Visible = false;
            this.Opc_Administrativa_Usuarios.Visible = false;
            this.Opc_Administrativa_Productos.Visible = false;
            this.Opc_Administrativa_Proveedores.Visible = false;

            if (Session["UsuarioSession"] != null)
            {
                if (Session["UsuarioPerfil"].ToString().Equals("2"))
                {
                    string NombreUsuario = Session["UsuarioSession"].ToString().ToUpper();
                    lbl_NombreUsuario.Text = "Bienvenido " + NombreUsuario;

                    this.Opc_Nombre_Usuario.Visible = true;
                    this.Opc_Cesta.Visible = true;
                    this.Opc_IniciarSesion.Visible = false;
                    this.Opc_CerrarSesion.Visible = true;

                    this.Opc_Usuarios.Visible = true;
                    this.Opc_Perfil_Usuario.Visible = true;
                    this.Opc_CambioContrasena_Usuario.Visible = true;

                    this.Opc_Administrativa.Visible = false;
                    this.Opc_Administrativa_Clientes.Visible = false;
                    this.Opc_Administrativa_Usuarios.Visible = false;
                    this.Opc_Administrativa_Productos.Visible = false;
                    this.Opc_Administrativa_Proveedores.Visible = false;
                }
                if (Session["UsuarioPerfil"].ToString().Equals("1"))
                {
                    string NombreUsuario = Session["UsuarioSession"].ToString().ToUpper();
                    lbl_NombreUsuario.Text = "Bienvenido " + NombreUsuario;

                    this.Opc_Nombre_Usuario.Visible = true;
                    this.Opc_Cesta.Visible = false;
                    this.Opc_IniciarSesion.Visible = false;
                    this.Opc_CerrarSesion.Visible = true;

                    this.Opc_Usuarios.Visible = false;
                    this.Opc_Perfil_Usuario.Visible = false;
                    this.Opc_CambioContrasena_Usuario.Visible = false;

                    this.Opc_Administrativa.Visible = true;
                    this.Opc_Administrativa_Clientes.Visible = true;
                    this.Opc_Administrativa_Usuarios.Visible = true;
                    this.Opc_Administrativa_Productos.Visible = true;
                    this.Opc_Administrativa_Proveedores.Visible = true;
                }
                if (Session["UsuarioPerfil"].ToString().Equals("0"))
                {
                    string NombreUsuario = Session["UsuarioSession"].ToString().ToUpper();
                    lbl_NombreUsuario.Text = "Bienvenido " + NombreUsuario;

                    this.Opc_Nombre_Usuario.Visible = true;
                    this.Opc_Cesta.Visible = true;
                    this.Opc_IniciarSesion.Visible = false;
                    this.Opc_CerrarSesion.Visible = true;

                    this.Opc_Usuarios.Visible = true;
                    this.Opc_Perfil_Usuario.Visible = true;
                    this.Opc_CambioContrasena_Usuario.Visible = true;

                    this.Opc_Administrativa.Visible = true;
                    this.Opc_Administrativa_Clientes.Visible = true;
                    this.Opc_Administrativa_Usuarios.Visible = true;
                    this.Opc_Administrativa_Productos.Visible = true;
                    this.Opc_Administrativa_Proveedores.Visible = true;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.AdministracionPerfiles();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Index.aspx");
        }

        protected void btn_My_Account_Click(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] != null)
            {
                Response.Redirect("~/Index.aspx");
            }
            else
            {
                Response.Redirect("~/www/Access/Login.aspx");
            }
        }
    }
}