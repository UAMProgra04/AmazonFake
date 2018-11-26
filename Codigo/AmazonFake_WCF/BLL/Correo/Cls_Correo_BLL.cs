using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Correo;
using System.Net;
using System.Net.Mail;

namespace BLL.Correo
{
    public class Cls_Correo_BLL
    {
        Cls_Correo_DAL obj_Correo_DAL = new Cls_Correo_DAL();
        
        public void Datos_Correo(Cls_Correo_DAL obj_Correo_Data_DAL)
        {
            Cls_Correo_BLL obj_Correo_BLL = new Cls_Correo_BLL();

            obj_Correo_DAL.SCorreo_Target = obj_Correo_Data_DAL.SCorreo_Target;
            obj_Correo_DAL.SCorreo_Source = obj_Correo_Data_DAL.SCorreo_Source;
            obj_Correo_DAL.SCorreo_Head = obj_Correo_Data_DAL.SCorreo_Head;
            obj_Correo_DAL.SCorreo_Message = obj_Correo_Data_DAL.SCorreo_Message;

            
        }

        public void  Envio_Correo_Electronico()
        {
            SmtpClient Envio_Correo = new SmtpClient();
            MailMessage Mensaje_Correo = new MailMessage();

            try
            {
                Mensaje_Correo.To.Add(
                    new MailAddress(obj_Correo_DAL.SCorreo_Target));
                Mensaje_Correo.From =
                    new MailAddress(obj_Correo_DAL.SCorreo_Source);
                Mensaje_Correo.Subject = obj_Correo_DAL.SCorreo_Head;
                Mensaje_Correo.Body = obj_Correo_DAL.SCorreo_Message;
                Mensaje_Correo.IsBodyHtml = true;
                Mensaje_Correo.Priority = MailPriority.Normal;

                Envio_Correo.Host = "smtp.gmail.com";
                Envio_Correo.Port = 587;
                Envio_Correo.EnableSsl = true;
                Envio_Correo.UseDefaultCredentials = false;
                Envio_Correo.Credentials = 
                    new NetworkCredential("amazonface.mail@gmail.com", "egs76$gs");
                Envio_Correo.Send(Mensaje_Correo);

                Mensaje_Correo.Dispose();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}
