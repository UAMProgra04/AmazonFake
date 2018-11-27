using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;  
using System.Net.Mail;
using System.Threading; 

namespace AmazonFake_SITE.www.Access
{
    public partial class PasswordAssistance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Continue_Click(object sender, EventArgs e)
        {
            if(this.txt_email.Text != string.Empty)
            {
                AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
                string Correo_Target = this.txt_email.Text.Trim();
                string Correo_Source = "amazonface.mail@gmail.com";
                string Correo_Head = "AmazonFake - Recuperacion de Contraseña";
                string Correo_Message = "<p>Estimado sus datos son: <br>Usuario: " + this.txt_email.Text.Trim() + "<br>Contraseña: contraseña</p>";
                Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);
                this.lbl_Errores.Text = "Correo Enviado Exitosamente!";
                this.txt_email.Text = string.Empty;
                this.txt_email.Focus();
            }
            else
            {
                this.lbl_Errores.Text = "El Campo de Correo no deberia estar Vacio!";
            }

        }
    }
}