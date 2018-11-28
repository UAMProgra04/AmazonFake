using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;  
using System.Net.Mail;
using System.Threading;
using AmazonFake_SITE.Secure;

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
                /*PENDIENTE:
                Crear if con consulta a base de datos para validar si el correo realmente existe
                ademas de agregar la contraseña del mismo en el campo contraseña del mesaje del correo*/

                if (Cls_Secure.Validar(this.txt_email.Text.Trim()))
                {
                    Cls_Secure.Correo_Recuperacion(this.txt_email.Text.Trim());
                    this.lbl_Errores.Text = "Correo Enviado Exitosamente!";
                    this.txt_email.Text = string.Empty;
                    this.txt_email.Focus();
                }
            }
            else
            {
                this.lbl_Errores.Text = "El Campo de Correo no deberia estar Vacio!";
            }
        }
    }
}