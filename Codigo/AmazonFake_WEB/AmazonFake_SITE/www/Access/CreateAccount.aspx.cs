using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmazonFake_SITE.www.Access
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Createaccount_Click(object sender, EventArgs e)
        {
            #region Metodo_enviar_Correo_Creacion_Cuenta
            /*AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
            string Correo_Target = this.txt_email.Text.Trim();
            string Correo_Source = "amazonface.mail@gmail.com";
            string Correo_Head = "AmazonFake - Apertura de Cuenta en AmazonFake";
            string Correo_Message = "<p>Estimado sus datos son: <br>Usuario: " + this.txt_email.Text.Trim() + "<br>Contraseña: contraseña</p>";
            Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);*/
            #endregion
        }
    }
}