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
        #region Correos
        /*private void EnviarCorreoElectronicos()
        {
            SmtpClient Envio_Correo = new SmtpClient(); //Configuracion del ENVIO 
            MailMessage Mensaje_Correo = new MailMessage(); //Configuracion del MSJ
            string Correotarget = this.txt_email.Text.Trim();
            string CorreoSource = "amazonface.mail@gmail.com";
            string encabezado = "AmazonFake - Recuperacion de Contraseña";
            string Mensaje = "<p>Estimado sus datos son:" +
                "Usuario: " + this.txt_email.Text.Trim() + "<br>" +
                "Contraseña: " + "contraseña" + "</p>";
            try
            {
                Mensaje_Correo = new MailMessage();
                Mensaje_Correo.To.Add(new MailAddress(Correotarget));
                Mensaje_Correo.From = new MailAddress(CorreoSource);
                Mensaje_Correo.Subject = encabezado;
                Mensaje_Correo.Body = Mensaje;
                Mensaje_Correo.IsBodyHtml = true;
                Mensaje_Correo.Priority = MailPriority.Normal;

                Envio_Correo.Host = "smtp.gmail.com";
                Envio_Correo.Port = 587;
                Envio_Correo.EnableSsl = true;
                Envio_Correo.UseDefaultCredentials = false;
                Envio_Correo.Credentials = new NetworkCredential("amazonface.mail@gmail.com", "egs76$gs");
                Envio_Correo.Send(Mensaje_Correo);

                Mensaje_Correo.Dispose();
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts",
                    "<script>alert('Error al ejecutar la Solicitud, Revise su conexion a Internet');</script>");
            }
        }*/
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Continue_Click(object sender, EventArgs e)
        {
            #region Correos
            /*
             try
            {
                Thread Hilo_Segundo_PLano = new Thread(EnviarCorreoElectronicos);
                Hilo_Segundo_PLano.Start();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Correo Enviado Exitosamente');</script>");
                Response.Redirect("~/www/Access/Login.aspx");

            }
            catch (Exception)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts",
                    "<script>alert('Error al ejecutar la Solicitud, Revise su conexion a Internet');</script>");
            }*/
            #endregion
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
                this.lbl_Errores.Text = "El Campo a de Correo no deberia estar Vacio!";
            }

        }
    }
}