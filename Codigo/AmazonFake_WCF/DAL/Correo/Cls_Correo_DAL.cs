using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;

namespace DAL.Correo
{
    public class Cls_Correo_DAL
    {
        #region Variables Privadas
        private string _sCorreo_Target,
                        _sCorreo_Source,
                        _sCorreo_Head,
                        _sCorreo_Message;
        #endregion

        #region Variables Publicas
        public string SCorreo_Target
        {
            get
            {
                return _sCorreo_Target;
            }

            set
            {
                _sCorreo_Target = value;
            }
        }
        public string SCorreo_Source
        {
            get
            {
                return _sCorreo_Source;
            }

            set
            {
                _sCorreo_Source = value;
            }
        }
        public string SCorreo_Head
        {
            get
            {
                return _sCorreo_Head;
            }

            set
            {
                _sCorreo_Head = value;
            }
        }
        public string SCorreo_Message
        {
            get
            {
                return _sCorreo_Message;
            }

            set
            {
                _sCorreo_Message = value;
            }
        }
        #endregion
    }
}
