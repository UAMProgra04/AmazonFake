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
        #region Crear_Conexion
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
        #endregion

        #region Data_Adapter
        public void Ejecutar_Data_Adapter(ref Cls_BD_DAL obj_DB_DAL)
        {
            try
            {
                obj_DB_DAL.SCadena = ConfigurationManager.ConnectionStrings["SQL_AUTH"].ToString();
                obj_DB_DAL.obj_SQL_Conexion = new SqlConnection(obj_DB_DAL.SCadena);

                if (obj_DB_DAL.obj_SQL_Conexion != null)
                {
                    if (obj_DB_DAL.obj_SQL_Conexion.State == System.Data.ConnectionState.Closed)
                    {
                        obj_DB_DAL.obj_SQL_Conexion.Open();
                    }
                }

                obj_DB_DAL.obj_SQL_DAdapter = new SqlDataAdapter(obj_DB_DAL.SNombre_SP,
                                                            obj_DB_DAL.obj_SQL_Conexion);

                obj_DB_DAL.obj_SQL_DAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                obj_DB_DAL.obj_SQL_DAdapter.Fill(obj_DB_DAL.obj_DS, obj_DB_DAL.SNombre_DataTable);
                obj_DB_DAL.SMsError = string.Empty;
            }
            catch (Exception e)
            {
                obj_DB_DAL.SMsError = e.Message.ToString();
            }
            finally
            {
                if (obj_DB_DAL.obj_SQL_Conexion != null)
                {
                    if (obj_DB_DAL.obj_SQL_Conexion.State == System.Data.ConnectionState.Open)
                    {
                        obj_DB_DAL.obj_SQL_Conexion.Close();
                    }
                    obj_DB_DAL.obj_SQL_Conexion.Dispose();
                }
            }
        }
        #endregion
    }
}
