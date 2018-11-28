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
            /*
             * Tener pendiente crear metodo para validar el viejo password 
             * contra lo almacenado en la base de datos
             */
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
            /*PENDIENTE:
             Crear if con consulta a base de datos para validar si el correo realmente existe
             ademas de agregar la contraseña del mismo en el campo contraseña del mesaje del correo*/

            AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
            string Correo_Target = Correo;
            string Correo_Source = "amazonface.mail@gmail.com";
            string Correo_Head = "AmazonFake - Recuperacion de Contraseña";
            string Correo_Message = "<p>Estimado sus datos son: <br>Usuario: " + Correo + "<br>Contraseña: contraseña</p>";
            Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);
        }

        public static void Correo_Creacion_Cuenta(string Correo)
        {
            /*PENDIENTE:
             Crear if con consulta a base de datos para validar si el correo realmente existe
             ademas de agregar la contraseña del mismo en el campo contraseña del mesaje del correo
             Pendiente de modificacion de la informacion del mensaje*/

            AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
            string Correo_Target = Correo;
            string Correo_Source = "amazonface.mail@gmail.com";
            string Correo_Head = "AmazonFake - Recuperacion de Contraseña";
            string Correo_Message = "<p>Estimado sus datos son: <br>Usuario: " + Correo + "<br>Contraseña: contraseña</p>";
            Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);
        }

        public static void Correo_Cambio_Contrasena(string Correo)
        {
            /*PENDIENTE:
             Crear if con consulta a base de datos para validar si el correo realmente existe
             ademas de agregar la contraseña del mismo en el campo contraseña del mesaje del correo
             Pendiente de modificacion de la informacion del mensaje*/

            AmazonFakeService.I_Base_DatosClient Cliente = new AmazonFakeService.I_Base_DatosClient();
            string Correo_Target = Correo;
            string Correo_Source = "amazonface.mail@gmail.com";
            string Correo_Head = "AmazonFake - Recuperacion de Contraseña";
            string Correo_Message = "<p>Estimado sus datos son: <br>Usuario: " + Correo + "<br>Contraseña: contraseña</p>";
            Cliente.Envio_Correo_Cliente(Correo_Target, Correo_Source, Correo_Head, Correo_Message);
        }
        #endregion

    }
}