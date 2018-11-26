using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DAL.Base_Datos
{
    public class Cls_BD_DAL
    {
        #region Variables Privadas
        private string  _sCadena,
                        _sMsError,
                        _sNombre_SP,
                        _sNombre_DataTable;
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

        public string SNombre_SP
        {
            get
            {
                return _sNombre_SP;
            }

            set
            {
                _sNombre_SP = value;
            }
        }

        public string SNombre_DataTable
        {
            get
            {
                return _sNombre_DataTable;
            }

            set
            {
                _sNombre_DataTable = value;
            }
        }
        #endregion

        #region variables de Base de Datos
        public SqlConnection obj_SQL_Conexion;
        public SqlDataAdapter obj_SQL_DAdapter;
        public SqlCommand obj_SQL_CMD;
        public DataSet obj_DS = new DataSet();
        #endregion
    }
}
