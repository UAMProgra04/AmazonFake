using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmazonFake_SITE.Secure;

namespace AmazonFake_SITE.www.Access
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Createaccount_Click(object sender, EventArgs e)
        {
            if ((txt_nombre.Text != string.Empty) && (txt_email.Text != string.Empty) && 
                (txt_contrasena.Text != string.Empty))
            {
                if (txt_contrasena.Text.Trim().Equals(txt_contrasena2.Text.Trim()))
                {
                    if (Cls_Secure.Validar(txt_nombre.Text, txt_email.Text.Trim(), txt_contrasena.Text.Trim()))
                    {
                        lbl_Errores.Text = "Hola";
                    }
                }else
                {
                    lbl_Errores.Text = "Los campos de Password y Re-enter password deben ser iguales!";
                }
            }
            else
            {
                lbl_Errores.Text = "Todos los campos son obligatorios";
            }

        }
    }
}