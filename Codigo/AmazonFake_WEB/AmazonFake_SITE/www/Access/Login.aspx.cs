using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmazonFake_SITE.Secure;

namespace AmazonFake_SITE.www.Access
{
    public partial class Login : System.Web.UI.Page
    {
        #region Administracion_Accesos
        private void Administracion_Accesos()
        {
            AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
            List<string> listaLogin = new List<string>();
            string usuario = txt_email.Text;
            string passwd = txt_contrasena.Text;
            string correo="", nombre="", pass;
            bool estado=false;
            int Perfil=3;

            foreach (var item in cliente.Login(usuario, passwd))
            {
                correo = item.SCorreo;
                nombre = item.SNombre;
                pass = item.SPassword;
                estado = item.BEstado;
                Perfil = item.IPerfil;
            }
            if (estado == true && Perfil == 2)
            {
                Session["UsuarioSession"] = nombre;
                Session["UsuarioPerfil"] = Perfil.ToString();
                Session["Usuariocorreo"] = correo.ToString();
                Response.Redirect("~/Index.aspx");
            }
            else if (estado == true && Perfil == 1)
            {
                Session["UsuarioSession"] = nombre;
                Session["UsuarioPerfil"] = Perfil.ToString();
                Session["Usuariocorreo"] = correo.ToString();
                Response.Redirect("~/Index.aspx");
            }
            else if (estado == true && Perfil == 0)
            {
                Session["UsuarioSession"] = usuario;
                Session["UsuarioPerfil"] = Perfil.ToString();
                Session["Usuariocorreo"] = correo.ToString();
                Response.Redirect("~/Index.aspx");
            }
            else
            {
                lbl_Errores.Text = "Error de Usuario o Contraseña";
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
            if((txt_email.Text != string.Empty) && (txt_contrasena.Text != string.Empty))
            {
                if (Cls_Secure.Validar(txt_email.Text.Trim(), txt_contrasena.Text.Trim()))
                {
                    this.Administracion_Accesos();
                }
                else
                {
                    lbl_Errores.Text = "Error Contraseña";
                }
            }
            else
            {
                lbl_Errores.Text = "Ambos campos son obligatorios";
            }
            
        }
        #endregion
    }
}