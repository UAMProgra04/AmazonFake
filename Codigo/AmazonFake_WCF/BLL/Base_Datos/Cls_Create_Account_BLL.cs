using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Base_Datos;
using BLL.Base_Datos;
using System.Data;
using System.Data.SqlClient;

namespace BLL.Base_Datos
{
    public class Cls_Create_Account_BLL
    {
        private Cls_BD_BLL obj_bll = new Cls_BD_BLL();    
        private SqlCommand obj_cmd = new SqlCommand();
        public string Create_Account(Cls_Create_Account_DAL obj_Account)
        {
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Create_User_Account";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_Account.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Nombre", obj_Account.SNombre);
                    obj_cmd.Parameters.AddWithValue("@Password", obj_Account.SPassword);
                }
                int registros;
                registros = obj_cmd.ExecuteNonQuery();
                if (registros >= 1)
                {
                    obj_Account.SRespuesta = "Cuenta Creada Con exito";
                }
                else
                {
                    obj_Account.SRespuesta = "Error al Crear la Cuenta";
                }
                return obj_Account.SRespuesta;

            }
            catch (Exception ex)
            {
                obj_Account.SRespuesta = ex.Message.ToString();
                return obj_Account.SRespuesta;
            }
        }       
    }
}
