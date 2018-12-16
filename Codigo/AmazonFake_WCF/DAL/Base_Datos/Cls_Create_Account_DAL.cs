using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Base_Datos
{
    public class Cls_Create_Account_DAL
    {
        private string sCorreo, sNombre, sPassword, sRespuesta;

        public string SCorreo
        {
            get
            {
                return sCorreo;
            }

            set
            {
                sCorreo = value;
            }
        }

        public string SNombre
        {
            get
            {
                return sNombre;
            }

            set
            {
                sNombre = value;
            }
        }

        public string SPassword
        {
            get
            {
                return sPassword;
            }

            set
            {
                sPassword = value;
            }
        }

        public string SRespuesta
        {
            get
            {
                return sRespuesta;
            }

            set
            {
                sRespuesta = value;
            }
        }
    }
}
