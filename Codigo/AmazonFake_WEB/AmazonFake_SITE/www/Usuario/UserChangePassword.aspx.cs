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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
            }
        }

        protected void btn_Cambiar_contrasena_Click(object sender, EventArgs e)
        {
            if((txt_Old_Password.Text != string.Empty) &&
                (txt_New_Password.Text != string.Empty))
            {
                if (Cls_Secure.ValidarChangePasswod(txt_New_Password.Text))
                {
                    AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
                    lbl_Respuesta.Text = cliente.Change_Password(txt_email.Text.Trim(), txt_New_Password.Text.Trim());
                }
            }
        }
    }
}