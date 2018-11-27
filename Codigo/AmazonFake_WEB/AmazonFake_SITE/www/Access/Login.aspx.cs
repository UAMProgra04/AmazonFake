using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmazonFake_SITE.www.Access
{
    public partial class Login : System.Web.UI.Page
    {
        #region Administracion_Accesos
        private void Administracion_Accesos()
        {
            string usuario = txt_email.Text;
            string passwd = txt_contrasena.Text;

            if (usuario == "test@hotmail.com" && passwd == "1234")
            {
                Session["UsuarioSession"] = usuario;
                Response.Redirect("~/Index.aspx");
            }
            else if (usuario == "test2@hotmail.com" && passwd == "1234")
            {
                Session["UsuarioSession"] = usuario;
                Response.Redirect("~/Index.aspx");
            }
            else
            {
                lbl_Errores.Text = "Error de usuario o Contraseña";
                txt_email.Text = string.Empty;
                txt_contrasena.Text = string.Empty;
                txt_email.Focus();
            }

        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Params["error"] != null)
            //{
            //    string error = Request.Params["error"];
            //    if (error == "1")
            //    {
            //        lbl_Errores.Text = "Debe iniciar Sesion para acceder a Su perfil...";
            //    }
            //    else if (error == "2")
            //    {
            //        lbl_Errores.Text = "Debe iniciar Sesion para acceder a su perfil...";
            //    }
            //}
        }

        #region Boton_CreateAccount
        protected void btn_CreateAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }
        #endregion

        #region Boton_SingIn
        protected void btn_SingIn_Click(object sender, EventArgs e)
        {
            this.Administracion_Accesos();
        }
        #endregion
    }
}