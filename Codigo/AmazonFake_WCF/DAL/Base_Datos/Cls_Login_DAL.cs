using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Base_Datos
{
    public class Cls_Login_DAL
    {
        private string sCorreo, sNombre, sPassword;
        private bool bEstado;
        private int iPerfil;

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

        public bool BEstado
        {
            get
            {
                return bEstado;
            }

            set
            {
                bEstado = value;
            }
        }

        public int IPerfil
        {
            get
            {
                return iPerfil;
            }

            set
            {
                iPerfil = value;
            }
        }
    }
}
