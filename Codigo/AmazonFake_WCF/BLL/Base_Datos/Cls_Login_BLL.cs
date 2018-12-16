using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Base_Datos;
using System.Data.SqlClient;
using System.Data;

namespace BLL.Base_Datos
{
    public class Cls_Login_BLL
    {
        private Cls_BD_BLL obj_bll = new Cls_BD_BLL();
        private SqlCommand obj_cmd = new SqlCommand();
        public List<Cls_Login_DAL> Login(Cls_Login_DAL obj_Login)
        {
            List<Cls_Login_DAL> lista = new List<Cls_Login_DAL>();
            Cls_Login_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Login";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Correo", obj_Login.SCorreo);
                obj_cmd.Parameters.AddWithValue("@Password", obj_Login.SPassword);

                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Login_DAL();
                    Login.SCorreo = (string)(lectura[0]);
                    Login.SNombre = (string)(lectura[1]);
                    Login.SPassword = (string)(lectura[2]);
                    Login.BEstado = Convert.ToBoolean(lectura[3]);
                    Login.IPerfil = Convert.ToInt32(lectura[4]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
    }
}
