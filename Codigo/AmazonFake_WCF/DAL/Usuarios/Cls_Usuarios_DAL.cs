using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Usuarios
{
    public class Cls_Usuarios_DAL
    {
        private string sCorreo, sNombre, sPassword, sRespuesta;
        private string sIdentificacion, sDireccion, sTelefono;
        private string sNombrePerfil;
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

        public string SIdentificacion
        {
            get
            {
                return sIdentificacion;
            }

            set
            {
                sIdentificacion = value;
            }
        }

        public string SDireccion
        {
            get
            {
                return sDireccion;
            }

            set
            {
                sDireccion = value;
            }
        }

        public string STelefono
        {
            get
            {
                return sTelefono;
            }

            set
            {
                sTelefono = value;
            }
        }

        public string SNombrePerfil
        {
            get
            {
                return sNombrePerfil;
            }

            set
            {
                sNombrePerfil = value;
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
