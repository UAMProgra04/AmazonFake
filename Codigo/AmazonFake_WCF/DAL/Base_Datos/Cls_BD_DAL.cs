using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL.Base_Datos
{
    public class Cls_BD_DAL
    {
        #region Variables Privadas
        private string _sCadena,
            _sMsError;
        #endregion

        #region Variables Publicas
        public string SCadena
        {
            get
            {
                return _sCadena;
            }

            set
            {
                _sCadena = value;
            }
        }

        public string SMsError
        {
            get
            {
                return _sMsError;
            }

            set
            {
                _sMsError = value;
            }
        }
        #endregion

        #region variables de Base de Datos
        public SqlConnection obj_SQL_Conexion;
        public SqlDataAdapter obj_SQL_DAdapter;
        public SqlCommand obj_SQL_CMD;
        #endregion
    }
}
