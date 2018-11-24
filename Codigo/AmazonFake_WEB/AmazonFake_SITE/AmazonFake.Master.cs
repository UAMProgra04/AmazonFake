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
        #region Administracion_Perfiles
        private void AdministracionPerfiles()
        {
            //#region Opciones Perfil de usuario
            //this.opcNombreUsuario.Visible = false;
            //this.opcNombreUsuario_Perfil.Visible = false;
            //this.opcNombreUsuario_Payment.Visible = false;
            //this.opcNombreUsuario_PerfilAdministrativo.Visible = false;
            //#endregion

            //this.opcIndex.Visible = true;
            //this.opcDepartamentos.Visible = false;

            //#region Opciones Administrativas
            //this.opcAdministrativa.Visible = false;
            //this.opcAdministrativa_Clientes.Visible = false;
            //this.opcAdministrativa_Usuarios.Visible = false;
            //this.opcAdministrativa_Productos.Visible = false;
            //#endregion

            //this.opcCarrito.Visible = false;

            //#region Opcones de Login
            //this.opcLogin.Visible = true;
            //this.opcCerrarSesion.Visible = false;
            //#endregion

            //if (Session["UsuarioSession"] != null)
            //{
            //    if (Session["UsuarioSession"].ToString().Equals("Test@hotmail.com"))
            //    {
            //        string NombreUsuario = Session["UsuarioSession"].ToString().ToUpper();
            //        lbl_NombreUsuario.Text = "Bienvenido " + NombreUsuario;

            //        //Opciones Perfil de usuario
            //        this.opcNombreUsuario.Visible = true;
            //        this.opcNombreUsuario_Perfil.Visible = true;
            //        this.opcNombreUsuario_Payment.Visible = true;
            //        this.opcNombreUsuario_PerfilAdministrativo.Visible = false;

            //        this.opcIndex.Visible = true;
            //        this.opcDepartamentos.Visible = true;
            //        this.opcAdministrativa.Visible = false;
            //        this.opcCarrito.Visible = true;
            //        this.opcLogin.Visible = false;
            //        this.opcCerrarSesion.Visible = true;
            //    }
            //    if (Session["UsuarioSession"].ToString().Equals("Test2@hotmail.com"))
            //    {
            //        string NombreUsuario = Session["UsuarioSession"].ToString().ToUpper();
            //        lbl_NombreUsuario.Text = "Bienvenido " + NombreUsuario;

            //        //Opciones Perfil de usuario
            //        this.opcNombreUsuario.Visible = true;
            //        this.opcNombreUsuario_Perfil.Visible = false;
            //        this.opcNombreUsuario_Payment.Visible = false;
            //        this.opcNombreUsuario_PerfilAdministrativo.Visible = true;

            //        this.opcIndex.Visible = true;
            //        this.opcDepartamentos.Visible = true;

            //        this.opcAdministrativa.Visible = true;
            //        this.opcAdministrativa_Clientes.Visible = true;
            //        this.opcAdministrativa_Usuarios.Visible = false;
            //        this.opcAdministrativa_Productos.Visible = true;

            //        this.opcCarrito.Visible = true;
            //        this.opcLogin.Visible = false;
            //        this.opcCerrarSesion.Visible = true;
            //    }
            //}
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //this.AdministracionPerfiles();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            //Session.RemoveAll();
            //Response.Redirect("~/www/Index.aspx");
        }
    }
}