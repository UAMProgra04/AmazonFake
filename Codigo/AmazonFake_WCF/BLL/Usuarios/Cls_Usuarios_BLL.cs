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
        

        #region Accesos
        #region Login
        public List<Cls_Usuarios_DAL> Login(Cls_Usuarios_DAL obj_Login)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
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
                lectura.Close();
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
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
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
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
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
                lectura.Close();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return lista;
        }
        #endregion

        #region Lock_User_Account
        public string Lock_User_Account(Cls_Usuarios_DAL obj_LockAccount)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Lock_User_Account";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_LockAccount.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Estado", obj_LockAccount.BEstado);  
                }
                int registros;
                registros = obj_cmd.ExecuteNonQuery();
                if (registros >= 1)
                {
                    obj_LockAccount.SRespuesta = "Operacion Realizada con exito Con exito";
                }
                else
                {
                    obj_LockAccount.SRespuesta = "Error al Actualizar la Contraseña";
                }
                return obj_LockAccount.SRespuesta;

            }
            catch (Exception ex)
            {
                obj_LockAccount.SRespuesta = ex.Message.ToString();
                return obj_LockAccount.SRespuesta;
            }
        }
        #endregion

        #region View_User_Status
        public Cls_Usuarios_DAL View_User_Status(Cls_Usuarios_DAL obj_LockAccount)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Usuarios_DAL obj_dal = new Cls_Usuarios_DAL();
            SqlDataReader lectura;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_User_Status";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_LockAccount.SCorreo);
                }
                lectura = obj_cmd.ExecuteReader();

                while (lectura.Read())
                {
                    obj_dal = new Cls_Usuarios_DAL();
                    obj_dal.BEstado = Convert.ToBoolean(lectura[0]);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return obj_dal;
        }
        #endregion
        #endregion


        #region Administracion_Usuiarios
        #region Create_User_Account
        public string Create_Account(Cls_Usuarios_DAL obj_Account)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
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

                int registros = obj_cmd.ExecuteNonQuery();
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
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Delete_User_Account";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_Account.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Password", obj_Account.SPassword);
                }

                int registros = obj_cmd.ExecuteNonQuery();
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

        #region Delete_User_Account_Por_Admin
        public string Delete_User_Account_Por_Admin(Cls_Usuarios_DAL obj_Account)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Delete_User_Account_Por_Admin";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_Account.SCorreo);
                }

                int registros = obj_cmd.ExecuteNonQuery();
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
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Update_User_Account";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_Account.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Nombre", obj_Account.SNombre);
                    obj_cmd.Parameters.AddWithValue("@Identificacion", obj_Account.SIdentificacion);
                    obj_cmd.Parameters.AddWithValue("@Direccion", obj_Account.SDireccion);
                    obj_cmd.Parameters.AddWithValue("@Telefono", obj_Account.STelefono);
                }

                int registros = obj_cmd.ExecuteNonQuery();
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

        #region Create_Employee_Account
        public string Create_Employee_Account(Cls_Usuarios_DAL obj_EmpAccount)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Create_Employee_Account";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_EmpAccount.SCorreo);
                    obj_cmd.Parameters.AddWithValue("@Nombre", obj_EmpAccount.SNombre);
                    obj_cmd.Parameters.AddWithValue("@Identificacion", 
                        Convert.ToInt32(obj_EmpAccount.SIdentificacion));
                    obj_cmd.Parameters.AddWithValue("@Direccion", obj_EmpAccount.SDireccion);
                    obj_cmd.Parameters.AddWithValue("@Telefono", obj_EmpAccount.STelefono);
                    obj_cmd.Parameters.AddWithValue("@Password", obj_EmpAccount.SPassword);
                }

                int registros = obj_cmd.ExecuteNonQuery();
                if (registros >= 1)
                {
                    obj_EmpAccount.SRespuesta = "Cuenta de Empleado Creada Con exito";
                }
                else
                {
                    obj_EmpAccount.SRespuesta = "Error al Crear la Cuenta del Emppleado";
                }
                return obj_EmpAccount.SRespuesta;

            }
            catch (Exception ex)
            {
                obj_EmpAccount.SRespuesta = ex.Message.ToString();
                return obj_EmpAccount.SRespuesta;
            }
        }

        #endregion
        #endregion


        #region Filtrar_Empleados
        #region View_Email_Admins
        public Cls_Usuarios_DAL View_Email_Admins(Cls_Usuarios_DAL obj_ViewAdmin)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Usuarios_DAL obj_dal = new Cls_Usuarios_DAL();
            SqlDataReader lectura;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Email_Admins";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_ViewAdmin.SCorreo);
                }
                lectura = obj_cmd.ExecuteReader();

                while (lectura.Read())
                {
                    obj_dal = new Cls_Usuarios_DAL();
                    obj_dal.SCorreo = lectura[0].ToString();
                    obj_dal.SNombre = lectura[1].ToString();
                    obj_dal.SIdentificacion = lectura[2].ToString();
                    obj_dal.SDireccion = lectura[3].ToString();
                    obj_dal.STelefono = lectura[4].ToString();
                    obj_dal.SNombrePerfil = lectura[5].ToString();
                }
            }
            catch (Exception)
            {
                obj_dal = null;
            }
            return obj_dal;
        }
        #endregion

        #region View_Name_Admins
        public Cls_Usuarios_DAL View_Name_Admins(Cls_Usuarios_DAL obj_ViewAdmin)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Usuarios_DAL obj_dal = new Cls_Usuarios_DAL();
            SqlDataReader lectura;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Name_Admins";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Nombre", obj_ViewAdmin.SNombre);
                }
                lectura = obj_cmd.ExecuteReader();

                while (lectura.Read())
                 {
                    obj_dal = new Cls_Usuarios_DAL();
                    obj_dal.SCorreo = lectura[0].ToString();
                    obj_dal.SNombre = lectura[1].ToString();
                    obj_dal.SIdentificacion = lectura[2].ToString();
                    obj_dal.SDireccion = lectura[3].ToString();
                    obj_dal.STelefono = lectura[4].ToString();
                    obj_dal.SNombrePerfil = lectura[5].ToString();
                }
            }
            catch (Exception)
            {
                obj_dal = null;
            }
            return obj_dal;
        }
        #endregion

        #region View_ID_Admins
        public Cls_Usuarios_DAL View_ID_Admins(Cls_Usuarios_DAL obj_ViewAdmin)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Usuarios_DAL obj_dal = new Cls_Usuarios_DAL();
            SqlDataReader lectura;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_ID_Admins";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Identificacion", obj_ViewAdmin.SIdentificacion);
                }
                lectura = obj_cmd.ExecuteReader();

                while (lectura.Read())
                {
                    obj_dal = new Cls_Usuarios_DAL();
                    obj_dal.SCorreo = lectura[0].ToString();
                    obj_dal.SNombre = lectura[1].ToString();
                    obj_dal.SIdentificacion = lectura[2].ToString();
                    obj_dal.SDireccion = lectura[3].ToString();
                    obj_dal.STelefono = lectura[4].ToString();
                    obj_dal.SNombrePerfil = lectura[5].ToString();
                }
            }
            catch (Exception)
            {
                obj_dal = null;
            }
            return obj_dal;
        }
        #endregion
        #endregion


        #region Filtrar_CLientes
        #region View_Email_Users
        public Cls_Usuarios_DAL View_Email_Users(Cls_Usuarios_DAL obj_ViewUser)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Usuarios_DAL obj_dal = new Cls_Usuarios_DAL();
            SqlDataReader lectura;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Email_Users";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Correo", obj_ViewUser.SCorreo);
                }
                lectura = obj_cmd.ExecuteReader();

                while (lectura.Read())
                {
                    obj_dal = new Cls_Usuarios_DAL();
                    obj_dal.SCorreo = lectura[0].ToString();
                    obj_dal.SNombre = lectura[1].ToString();
                    obj_dal.SIdentificacion = lectura[2].ToString();
                    obj_dal.SDireccion = lectura[3].ToString();
                    obj_dal.STelefono = lectura[4].ToString();
                    obj_dal.SNombrePerfil = lectura[5].ToString();
                }
            }
            catch (Exception)
            {
                obj_dal = null;
            }
            return obj_dal;
        }
        #endregion

        #region View_Name_Users
        public Cls_Usuarios_DAL View_Name_Users(Cls_Usuarios_DAL obj_ViewUser)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Usuarios_DAL obj_dal = new Cls_Usuarios_DAL();
            SqlDataReader lectura;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Name_Users";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Nombre", obj_ViewUser.SNombre);
                }
                lectura = obj_cmd.ExecuteReader();

                while (lectura.Read())
                {
                    obj_dal = new Cls_Usuarios_DAL();
                    obj_dal.SCorreo = lectura[0].ToString();
                    obj_dal.SNombre = lectura[1].ToString();
                    obj_dal.SIdentificacion = lectura[2].ToString();
                    obj_dal.SDireccion = lectura[3].ToString();
                    obj_dal.STelefono = lectura[4].ToString();
                    obj_dal.SNombrePerfil = lectura[5].ToString();
                }
            }
            catch (Exception)
            {
                obj_dal = null;
            }
            return obj_dal;
        }
        #endregion

        #region View_ID_Users
        public Cls_Usuarios_DAL View_ID_Users(Cls_Usuarios_DAL obj_ViewUser)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Usuarios_DAL obj_dal = new Cls_Usuarios_DAL();
            SqlDataReader lectura;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_ID_Users";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@Identificacion", obj_ViewUser.SIdentificacion);
                }
                lectura = obj_cmd.ExecuteReader();

                while (lectura.Read())
                {
                    obj_dal = new Cls_Usuarios_DAL();
                    obj_dal.SCorreo = lectura[0].ToString();
                    obj_dal.SNombre = lectura[1].ToString();
                    obj_dal.SIdentificacion = lectura[2].ToString();
                    obj_dal.SDireccion = lectura[3].ToString();
                    obj_dal.STelefono = lectura[4].ToString();
                    obj_dal.SNombrePerfil = lectura[5].ToString();
                }
            }
            catch (Exception)
            {
                obj_dal = null;
            }
            return obj_dal;
        }
        #endregion
        #endregion


    }
}
