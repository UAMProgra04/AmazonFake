using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace AmazonFake_SITE.Secure
{
    public class Cls_Secure
    {
        #region Validaciones_Por_Patrones
        protected static bool ValidarCampoPorPatron(string patron, string valor)
        {
            try
            {
                MatchCollection Coincide = Regex.Matches(valor, patron);

                if (Coincide.Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        #endregion

        #region Validacion_Campos
        public static bool Validar(string Email)
        {
            try
            {
                if (Cls_Secure.ValidarCampoPorPatron(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", Email) &&
                    (Email.Length <= 80))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static bool Validar(string Email, string Password)
        {
            try
            {
                if (Cls_Secure.ValidarCampoPorPatron(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", Email) && 
                    (Email.Length <= 80))
                {
                    if (Cls_Secure.ValidarCampoPorPatron(@"[a-zA-Z0-9]{4,12}", Password) &&
                        (Password.Length <= 12))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static bool Validar(string nombre, string Email, string Password)
        {
            try
            {
                if(Cls_Secure.ValidarCampoPorPatron(@"[a-zA-ZñÑ\s]{2,100}", nombre) &&
                    (nombre.Length <= 100))
                {
                    if (Cls_Secure.ValidarCampoPorPatron(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", Email) &&
                        (Email.Length <= 80))
                    {
                        if (Cls_Secure.ValidarCampoPorPatron(@"[a-zA-Z0-9]{4,12}", Password) &&
                            (Password.Length <= 12))
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region Validaciones_Secccion_OPcionesUsuario
        public static bool ValidarChangePasswod(string Password)
        {
            try
            {
                if (Cls_Secure.ValidarCampoPorPatron(@"[a-zA-Z0-9]{4,12}", Password) &&
                        (Password.Length <= 12))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region Envio_Correos
        public static void Correo_Recuperacion(string Correo)
        {
            AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
            List<string> listaLogin = new List<string>();
            string passwd;
            foreach (var item in Cliente.Password_Restore(Correo))
            {
                passwd = item.SPassword;
                string Correo_Target = Correo;
                string Correo_Source = "amazonface.mail@gmail.com";
                string Correo_Head = "AmazonFake - Recuperacion de Contraseña";
                string Correo_Message = "<p>Estimado sus datos son: <br>Usuario: " + Correo + "<br>Contraseña: " + passwd + "</p>";
                Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);
            }   
        }

        public static void Correo_Creacion_Cuenta(string correo, string nombre, string pssword)
        {
            AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
            string Correo_Target = correo;
            string Correo_Source = "amazonface.mail@gmail.com";
            string Correo_Head = "AmazonFake - Creacion de Cuenta";
            string Correo_Message = "<p>Estimado " + nombre + " sus datos de acceso a su cuenta de AmazonFake son: <br>Usuario: " + correo + "<br>Contraseña: " + pssword + "</p>";
            Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);
        }

        public static void Correo_Cambio_Contrasena(string Correo, string pssword)
        {
            AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
            string Correo_Target = Correo;
            string Correo_Source = "amazonface.mail@gmail.com";
            string Correo_Head = "AmazonFake - Cambio de Contraseña";
            string Correo_Message = "<p>Estimado sus datos han sido actualizados: <br>Ahora sus datos son: <br>Usuario: "+ Correo + "<br>Nueva Contraseña: " + pssword + "</p>";
            Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);
        }

        public static void Correo_Informacion_Compra(string Correo, string pssword)
        {

        }
        #endregion

    }
}