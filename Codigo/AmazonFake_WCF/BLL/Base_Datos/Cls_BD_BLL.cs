using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DAL.Base_Datos;

namespace BLL.Base_Datos
{
    public class Cls_BD_BLL
    {
        public void Crear_Conexion(ref Cls_BD_DAL obj_BD_DAL)
        {
            try
            {
                obj_BD_DAL.SCadena = ConfigurationManager.ConnectionStrings["SQL_AUTH"].ToString();
                obj_BD_DAL.obj_SQL_Conexion = new SqlConnection(obj_BD_DAL.SCadena);
                if(obj_BD_DAL.obj_SQL_Conexion != null)
                {
                    if(obj_BD_DAL.obj_SQL_Conexion.State == System.Data.ConnectionState.Closed)
                    {
                        obj_BD_DAL.obj_SQL_Conexion.Open();
                    }
                }
            }
            catch (Exception ex)
            {
                obj_BD_DAL.obj_SQL_Conexion = null;
                obj_BD_DAL.SMsError = ex.Message.ToString();
            }
        }
    }
}
