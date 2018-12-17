using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BLL.Base_Datos;
using DAL.Usuarios;


namespace BLL.Usuarios
{
    public class Cls_Usuarios_BLL
    {
        private Cls_BD_BLL obj_bll = new Cls_BD_BLL();
        private SqlCommand obj_cmd = new SqlCommand();


        #region Accesos
        #region Login
        public List<Cls_Usuarios_DAL> Login(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
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
                    Login = new Cls_Usuarios_DAL();
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
        #endregion

        #region Change_Password
        public string Change_Password(Cls_Usuarios_DAL obj_Account)
        {
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Change_Password";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_Account.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Password", obj_Account.SPassword);
                }
                int registros;
                registros = obj_cmd.ExecuteNonQuery();
                if (registros >= 1)
                {
                    obj_Account.SRespuesta = "Contraseña Actualizada Con exito";
                }
                else
                {
                    obj_Account.SRespuesta = "Error al Actualizar la Contraseña";
                }
                return obj_Account.SRespuesta;

            }
            catch (Exception ex)
            {
                obj_Account.SRespuesta = ex.Message.ToString();
                return obj_Account.SRespuesta;
            }
        }
        #endregion

        #region Password_Restore
        public List<Cls_Usuarios_DAL> Password_Restore(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Password_Restore";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Correo", obj_Login.SCorreo);
                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Usuarios_DAL();
                    Login.SPassword = (string)(lectura[0]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion
        #endregion


        #region Administracion_Usuiarios
        #region Create_User_Account
        public string Create_Account(Cls_Usuarios_DAL obj_Account)
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
        #endregion

        #region Delete_User_Account
        public string Delete_Account(Cls_Usuarios_DAL obj_Account)
        {
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Delete_User_Account";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_Account.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Password", obj_Account.SPassword);
                }
                int registros;
                registros = obj_cmd.ExecuteNonQuery();
                if (registros >= 1)
                {
                    obj_Account.SRespuesta = "Cuenta Eliminada Con exito";
                }
                else
                {
                    obj_Account.SRespuesta = "Error al Eliminar la Cuenta";
                }
                return obj_Account.SRespuesta;

            }
            catch (Exception ex)
            {
                obj_Account.SRespuesta = ex.Message.ToString();
                return obj_Account.SRespuesta;
            }
        }
        #endregion

        #region Update_User_Account
        public string Update_Account(Cls_Usuarios_DAL obj_Account)
        {
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Delete_User_Account";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_Account.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Identificacion", obj_Account.SIdentificacion);
                    obj_cmd.Parameters.AddWithValue("@Direccion", obj_Account.SDireccion);
                    obj_cmd.Parameters.AddWithValue("@Telefono", obj_Account.STelefono);
                }
                int registros;
                registros = obj_cmd.ExecuteNonQuery();
                if (registros >= 1)
                {
                    obj_Account.SRespuesta = "Cuenta Actualizada Con exito";
                }
                else
                {
                    obj_Account.SRespuesta = "Error al Actualizar la Cuenta";
                }
                return obj_Account.SRespuesta;

            }
            catch (Exception ex)
            {
                obj_Account.SRespuesta = ex.Message.ToString();
                return obj_Account.SRespuesta;
            }
        }
        #endregion
        #endregion


        #region Filtrar_Empleados
        #region View_Email_Admins
        public List<Cls_Usuarios_DAL> View_Email_Admins(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Email_Admins";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Correo", obj_Login.SCorreo);

                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Usuarios_DAL();
                    Login.SCorreo = (string)(lectura[0]);
                    Login.SNombre = (string)(lectura[1]);
                    Login.SIdentificacion = (string)(lectura[2]);
                    Login.SDireccion = (string)(lectura[3]);
                    Login.STelefono = (string)(lectura[4]);
                    Login.SNombrePerfil = (string)(lectura[5]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion

        #region View_Name_Admins
        public List<Cls_Usuarios_DAL> View_Name_Admins(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Name_Admins";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Nombre", obj_Login.SNombre);

                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Usuarios_DAL();
                    Login.SCorreo = (string)(lectura[0]);
                    Login.SNombre = (string)(lectura[1]);
                    Login.SIdentificacion = (string)(lectura[2]);
                    Login.SDireccion = (string)(lectura[3]);
                    Login.STelefono = (string)(lectura[4]);
                    Login.SNombrePerfil = (string)(lectura[5]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion

        #region View_ID_Admins
        public List<Cls_Usuarios_DAL> View_ID_Admins(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_ID_Admins";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Identificacion", obj_Login.SIdentificacion);

                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Usuarios_DAL();
                    Login.SCorreo = (string)(lectura[0]);
                    Login.SNombre = (string)(lectura[1]);
                    Login.SIdentificacion = (string)(lectura[2]);
                    Login.SDireccion = (string)(lectura[3]);
                    Login.STelefono = (string)(lectura[4]);
                    Login.SNombrePerfil = (string)(lectura[5]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion
        #endregion


        #region Filtrar_CLientes
        #region View_Email_Users
        public List<Cls_Usuarios_DAL> View_Email_Users(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Email_Users";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Correo", obj_Login.SCorreo);

                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Usuarios_DAL();
                    Login.SCorreo = (string)(lectura[0]);
                    Login.SNombre = (string)(lectura[1]);
                    Login.SIdentificacion = (string)(lectura[2]);
                    Login.SDireccion = (string)(lectura[3]);
                    Login.STelefono = (string)(lectura[4]);
                    Login.SNombrePerfil = (string)(lectura[5]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion

        #region View_Name_Users
        public List<Cls_Usuarios_DAL> View_Name_Users(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Name_Users";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Nombre", obj_Login.SNombre);

                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Usuarios_DAL();
                    Login.SCorreo = (string)(lectura[0]);
                    Login.SNombre = (string)(lectura[1]);
                    Login.SIdentificacion = (string)(lectura[2]);
                    Login.SDireccion = (string)(lectura[3]);
                    Login.STelefono = (string)(lectura[4]);
                    Login.SNombrePerfil = (string)(lectura[5]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion

        #region View_ID_Users
        public List<Cls_Usuarios_DAL> View_ID_Users(Cls_Usuarios_DAL obj_Login)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_DAL Login;
            SqlDataReader lectura;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_ID_Users";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                obj_cmd.Parameters.AddWithValue("@Identificacion", obj_Login.SIdentificacion);

                lectura = obj_cmd.ExecuteReader();
                while (lectura.Read())
                {
                    Login = new Cls_Usuarios_DAL();
                    Login.SCorreo = (string)(lectura[0]);
                    Login.SNombre = (string)(lectura[1]);
                    Login.SIdentificacion = (string)(lectura[2]);
                    Login.SDireccion = (string)(lectura[3]);
                    Login.STelefono = (string)(lectura[4]);
                    Login.SNombrePerfil = (string)(lectura[5]);
                    lista.Add(Login);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion
        #endregion


    }
}
