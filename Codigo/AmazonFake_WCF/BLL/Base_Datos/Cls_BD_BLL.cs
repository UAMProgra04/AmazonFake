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
                obj_BD_DAL.SMsError = string.Empty;
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

        public DataTable ExecuteDataAdapter(string sNombreSP, string sNombreParametro,
                                     SqlDbType DbType, string sValorParametro, ref string SMsError)
        {

            try
            {
                Cls_BD_DAL obj_BD_DALL = new Cls_BD_DAL();
                obj_BD_DALL.SCadena = ConfigurationManager.ConnectionStrings[1].ToString();
                obj_BD_DALL.obj_SQL_Conexion = new SqlConnection(obj_BD_DALL.SCadena);

                if (obj_BD_DALL.obj_SQL_Conexion.State == ConnectionState.Closed)
                {
                    obj_BD_DALL.obj_SQL_Conexion.Open();
                }

                obj_BD_DALL.obj_SQL_DAdapter = new SqlDataAdapter(sNombreSP, obj_BD_DALL.obj_SQL_Conexion);

                DataSet DS = new DataSet();
                //toma de desicion
                obj_BD_DALL.obj_SQL_DAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                if (sValorParametro != string.Empty)
                {
                    obj_BD_DALL.obj_SQL_DAdapter.SelectCommand.Parameters.Add(sNombreParametro, DbType).Value = sValorParametro;
                }
                obj_BD_DALL.obj_SQL_DAdapter.Fill(DS);

                SMsError = string.Empty;

                return DS.Tables[0];

            }
            catch (Exception ex)
            {
                SMsError = ex.Message.ToString();
                return null;
            }
        }
        #endregion

        #region Metodo para Insertar_Modificar_Eliminar_Sin_Identity
        public bool ExecuteNonQuery(string sNombreSP, DataTable dtParametros,
            ref string SMsError)
        {
            try
            {
                Cls_BD_DAL obj_BD_DALL = new Cls_BD_DAL();
                obj_BD_DALL.SCadena = ConfigurationManager.ConnectionStrings["SQL_AUTH"].ToString();
                obj_BD_DALL.obj_SQL_Conexion = new SqlConnection(obj_BD_DALL.SCadena);

                if (obj_BD_DALL.obj_SQL_Conexion.State == ConnectionState.Closed)
                {
                    obj_BD_DALL.obj_SQL_Conexion.Open();
                }

                obj_BD_DALL.obj_SQL_CMD = new SqlCommand(sNombreSP, obj_BD_DALL.obj_SQL_Conexion);
                obj_BD_DALL.obj_SQL_CMD.CommandType = CommandType.StoredProcedure;

                # region Area de Parametros
                if (dtParametros.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtParametros.Rows)
                    {
                        SqlDbType dbt = SqlDbType.VarChar;

                        switch (dr[1].ToString())
                        {
                            case "1":
                                dbt = SqlDbType.Int;
                                break;
                            case "2":
                                dbt = SqlDbType.DateTime;
                                break;
                            case "3":
                                dbt = SqlDbType.NVarChar;
                                break;
                            case "4":
                                dbt = SqlDbType.Char;
                                break;
                            case "5":
                                dbt = SqlDbType.TinyInt;
                                break;
                            case "6":
                                dbt = SqlDbType.SmallInt;
                                break;
                            default:
                                dbt = SqlDbType.NVarChar;
                                break;
                        }

                        obj_BD_DALL.obj_SQL_CMD.Parameters.Add(dr[0].ToString(), dbt).Value = dr[2].ToString();
                    }
                }
                #endregion

                obj_BD_DALL.obj_SQL_CMD.ExecuteNonQuery();

                SMsError = string.Empty;
                return true;
            }
            catch (Exception ex)
            {
                SMsError = ex.Message.ToString();
                return false;
            }
        }
        #endregion

        #region Metodo para Insertar_Modificar_Eliminar_Con_Identity
        public bool ExecuteScalar(string sNombreSP, DataTable dtParametros,
            ref string sValorScalar, ref string SMsError)
        {
            try
            {
                Cls_BD_DAL obj_BD_DALL = new Cls_BD_DAL();
                obj_BD_DALL.SCadena = ConfigurationManager.ConnectionStrings["SQL_AUTH"].ToString();
                obj_BD_DALL.obj_SQL_Conexion = new SqlConnection(obj_BD_DALL.SCadena);

                if (obj_BD_DALL.obj_SQL_Conexion.State == ConnectionState.Closed)
                {
                    obj_BD_DALL.obj_SQL_Conexion.Open();
                }

                obj_BD_DALL.obj_SQL_CMD = new SqlCommand(sNombreSP, obj_BD_DALL.obj_SQL_Conexion);
                obj_BD_DALL.obj_SQL_CMD.CommandType = CommandType.StoredProcedure;

                # region Area de Parametros
                if (dtParametros.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtParametros.Rows)
                    {
                        SqlDbType dbt = SqlDbType.VarChar;

                        switch (dr[1].ToString())
                        {
                            case "1":
                                dbt = SqlDbType.Int;
                                break;
                            case "2":
                                dbt = SqlDbType.DateTime;
                                break;
                            case "3":
                                dbt = SqlDbType.NVarChar;
                                break;
                            case "4":
                                dbt = SqlDbType.Char;
                                break;
                            case "5":
                                dbt = SqlDbType.TinyInt;
                                break;
                            case "6":
                                dbt = SqlDbType.SmallInt;
                                break;
                            default:
                                dbt = SqlDbType.NVarChar;
                                break;
                        }

                        obj_BD_DALL.obj_SQL_CMD.Parameters.Add(dr[0].ToString(), dbt).Value = dr[2].ToString();
                    }
                }
                #endregion

                sValorScalar = obj_BD_DALL.obj_SQL_CMD.ExecuteScalar().ToString();

                SMsError = string.Empty;
                return true;
            }
            catch (Exception ex)
            {
                SMsError = ex.Message.ToString();
                return false;
            }
        }
        #endregion

        #region Conexion_Base_Datos
        public SqlConnection Conexion_BAseDatos()
        {
            Cls_BD_DAL obj_BD_DAL = new Cls_BD_DAL();
            try
            {
                obj_BD_DAL.SCadena = ConfigurationManager.ConnectionStrings["SQL_AUTH"].ToString();
                obj_BD_DAL.obj_SQL_Conexion = new SqlConnection(obj_BD_DAL.SCadena);

                if (obj_BD_DAL.obj_SQL_Conexion.State == ConnectionState.Open)
                {
                    obj_BD_DAL.obj_SQL_Conexion.Close();
                }
                else
                {
                    obj_BD_DAL.obj_SQL_Conexion.Open();
                }
                return obj_BD_DAL.obj_SQL_Conexion;
            }
            catch (Exception)
            {
                return obj_BD_DAL.obj_SQL_Conexion = null;
            }
        }
        #endregion
    }
}
