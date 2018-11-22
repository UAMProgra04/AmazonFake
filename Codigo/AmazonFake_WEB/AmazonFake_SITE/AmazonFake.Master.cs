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
            this.opcNombreUsuario.Visible = false;
            this.opcIndex.Visible = true;
            this.opcDepartamentos.Visible = false;
            this.opcAdministrativa.Visible = false;
            this.opcCarrito.Visible = false;
            this.opcLogin.Visible = true;
            this.opcCerrarSesion.Visible = false;

            if (Session["UsuarioSession"] != null)
            {
                if (Session["UsuarioSession"].ToString().Equals("Test@hotmail.com"))
                {
                    string NombreUsuario = Session["UsuarioSession"].ToString().ToUpper();
                    lbl_NombreUsuario.Text = "Bienvenido " + NombreUsuario;
                    this.opcNombreUsuario.Visible = true;
                    this.opcIndex.Visible = true;
                    this.opcDepartamentos.Visible = true;
                    this.opcAdministrativa.Visible = false;
                    this.opcCarrito.Visible = true;
                    this.opcLogin.Visible = false;
                    this.opcCerrarSesion.Visible = true;
                }
                if (Session["UsuarioSession"].ToString().Equals("Test2@hotmail.com"))
                {
                    string NombreUsuario = Session["UsuarioSession"].ToString().ToUpper();
                    lbl_NombreUsuario.Text = "Bienvenido " + NombreUsuario;
                    this.opcNombreUsuario.Visible = true;
                    this.opcIndex.Visible = true;
                    this.opcDepartamentos.Visible = true;
                    this.opcAdministrativa.Visible = true;
                    this.opcCarrito.Visible = true;
                    this.opcLogin.Visible = false;
                    this.opcCerrarSesion.Visible = true;
                }
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            this.AdministracionPerfiles();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/www/Index.aspx");
        }
    }
}