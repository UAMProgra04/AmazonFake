using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmazonFake_SITE.Secure;

namespace AmazonFake_SITE.www.Usuario
{
    public partial class UserChangePassword : System.Web.UI.Page
    {
        #region Carga_Inicial
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
            }
            else
            {
                txt_email.Text = Session["Usuariocorreo"].ToString();
            }
        }
        #endregion

        #region Boton_Cambiar_COntrasena
        protected void btn_Cambiar_contrasena_Click(object sender, EventArgs e)
        {
            if((txt_Old_Password.Text != string.Empty) && (txt_New_Password.Text != string.Empty) && 
                (txt_email.Text != string.Empty))
            {
                if (Cls_Secure.ValidarChangePasswod(txt_New_Password.Text))
                {
                    AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
                    List<string> lista = new List<string>();
                    string passwd="";
                    foreach (var item in cliente.Password_Restore(txt_email.Text.Trim()))
                    {
                        passwd = item.SPassword;
                    }
                    if (passwd.Equals(txt_Old_Password.Text.Trim()))
                    {
                        lbl_Respuesta.Text = cliente.Change_Password(txt_email.Text.Trim(), txt_New_Password.Text.Trim());
                        Cls_Secure.Correo_Cambio_Contrasena(txt_email.Text.Trim(), txt_New_Password.Text.Trim());
                    }
                    else
                    {
                        lbl_Respuesta.Text = "La contraseña actual no coincide con los registros. Verifiquela!";
                        txt_Old_Password.Text = string.Empty;
                        txt_New_Password.Text = string.Empty;
                        txt_Old_Password.Focus();
                    }
                }
            }
            else
            {
                lbl_Respuesta.Text = "Debe llenar todos los campos";
            }
        }
        #endregion
    }
}