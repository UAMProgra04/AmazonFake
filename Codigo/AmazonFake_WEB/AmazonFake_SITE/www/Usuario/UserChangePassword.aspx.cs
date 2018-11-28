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

        }

        protected void btn_Cambiar_contrasena_Click(object sender, EventArgs e)
        {
            if((txt_Old_Password.Text.Trim() != string.Empty) &&
                (txt_New_Password.Text.Trim() != string.Empty))
            {
                if (Cls_Secure.ValidarChangePasswod(txt_New_Password.Text.Trim()))
                {
                    /*llamar al metodo de la base de datos para hacer
                     el respectivo cambio*/
                }
            }
        }
    }
}