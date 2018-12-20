using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DAL.Base_Datos;
using DAL.Correo;
using DAL.Usuarios;
using DAL.Entidades_BD;
using BLL.Base_Datos;
using BLL.Correo;
using BLL.Usuarios;
using BLL.Entidades_BD;
using System.Data;

namespace SVC.Contract
{
    public class C_Base_Datos : Interface.I_Base_Datos
    {
        #region Envio_Correo_Cliente
        public void Envio_Correo_Cliente(string Correo_Target, string Correo_Source,
            string Correo_Encabezado, string Correo_Mensaje)
        {
            Cls_Correo_BLL obj_Correo_Data_BLL = new Cls_Correo_BLL();
            Cls_Correo_DAL obj_Correo_Data_DAL = new Cls_Correo_DAL();
            obj_Correo_Data_DAL.SCorreo_Target = Correo_Target;
            obj_Correo_Data_DAL.SCorreo_Source = Correo_Source;
            obj_Correo_Data_DAL.SCorreo_Head = Correo_Encabezado;
            obj_Correo_Data_DAL.SCorreo_Message = Correo_Mensaje;

            obj_Correo_Data_BLL.Datos_Correo(obj_Correo_Data_DAL);

            obj_Correo_Data_BLL.Envio_Correo_Electronico();
        }
        #endregion

        #region Conectar_Base_Datos
        public string Conectar_Base_Datos()
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            Cls_BD_DAL obj_BD_DAL = new Cls_BD_DAL();
            obj_BD_BLL.Crear_Conexion(ref obj_BD_DAL);
            return obj_BD_DAL.SMsError;
        }
        #endregion

        #region Mostrar_Informacion_[Listar]
        public DataTable Mostrar_Informacion(string Nombre_StoreProcedure_BaseDatos, 
            string Nombre_Tabla_BaseDatos)
        {
            Cls_BD_BLL obj_DB_BLL = new Cls_BD_BLL();
            Cls_BD_DAL obj_DB_DAL = new Cls_BD_DAL();

            obj_DB_DAL.SNombre_SP= Nombre_StoreProcedure_BaseDatos;
            obj_DB_DAL.SNombre_DataTable = Nombre_Tabla_BaseDatos;

            obj_DB_BLL.Ejecutar_Data_Adapter(ref obj_DB_DAL);

            if (obj_DB_DAL.SMsError == string.Empty)
            {
                return obj_DB_DAL.obj_DS.Tables[0];
            }
            else
            {
                return null;
            }
        }
        public DataTable ListarDatos(string sNombreSP, ref string SMsError)
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            return obj_BD_BLL.ExecuteDataAdapter(sNombreSP, "",
                SqlDbType.VarChar, "", ref SMsError);
        }
        #endregion

        #region FiltrarDatos
        public DataTable FiltrarDatos(string sNombreSP, string sNombreParametro,
                                     SqlDbType DbType, string sValrParametro, ref string SMsError)
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            return obj_BD_BLL.ExecuteDataAdapter(sNombreSP, sNombreParametro,
                                                    DbType, sValrParametro, ref SMsError);
        }
        #endregion

        #region Insertar_Actualizar_Eliminar_SinIdentity
        public bool Insertar_DatosSinIdentity(string sNombreSP, DataTable dtParametros, ref string SMsError)
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            return obj_BD_BLL.ExecuteNonQuery(sNombreSP, dtParametros, ref SMsError);
        }
        public bool Modifica_DatosSinIdentity(string sNombreSP, DataTable dtParametros, ref string SMsError)
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            return obj_BD_BLL.ExecuteNonQuery(sNombreSP, dtParametros, ref SMsError);
        }
        public bool Eliminar_DatosSinIdentity(string sNombreSP, DataTable dtParametros, ref string SMsError)
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            return obj_BD_BLL.ExecuteNonQuery(sNombreSP, dtParametros, ref SMsError);
        }
        #endregion

        #region Insertar_DatosConIdentity
        public bool Insertar_DatosConIdentity(string sNombreSP, DataTable dtParametros,
            ref string sValorScalar, ref string SMsError)
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            return obj_BD_BLL.ExecuteScalar(sNombreSP, dtParametros,
                ref sValorScalar, ref SMsError);
        }
        #endregion



        #region Metodos_Cls_Usuarios

        #region Accesos
        #region Login
        public List<Cls_Usuarios_DAL> Login(string correo, string password)
        {
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SCorreo = correo;
            obj_Login_dal.SPassword = password;
            return obj_Login_bll.Login(obj_Login_dal);
        }
        #endregion

        #region Change_Password
        public string Change_Password(string correo, string password)
        {
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SCorreo = correo;
            obj_Login_dal.SPassword = password;
            return obj_Login_bll.Change_Password(obj_Login_dal);
        }
        #endregion

        #region Password_Restore
        public List<Cls_Usuarios_DAL> Password_Restore(string correo)
        {
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SCorreo = correo;
            return obj_Login_bll.Password_Restore(obj_Login_dal);
        }
        #endregion

        #region Lock_User_Account
        public string Lock_User_Account(string correo, bool Estado)
        {
            Cls_Usuarios_BLL obj_account_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_account_dal = new Cls_Usuarios_DAL();
            obj_account_dal.SCorreo = correo;
            obj_account_dal.BEstado = Estado;
            return obj_account_bll.Lock_User_Account(obj_account_dal);
        }
        #endregion

        #region View_User_Status
        public Boolean View_User_Status(string Correo)
        {
            bool test;

            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SCorreo = Correo;
            obj_Login_dal = obj_Login_bll.View_User_Status(obj_Login_dal);
            test = obj_Login_dal.BEstado;
            return test;
        }
        #endregion
        #endregion

        #region Administracion_Usuarios
        #region Create_Account
        public string Create_Account(string correo, string nombre, string password)
        {
            Cls_Usuarios_BLL obj_account_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_account_dal = new Cls_Usuarios_DAL();
            obj_account_dal.SCorreo = correo;
            obj_account_dal.SNombre = nombre;
            obj_account_dal.SPassword = password;
            return obj_account_bll.Create_Account(obj_account_dal);
        }
        #endregion

        #region Create_Employee_Account
        public string Create_Employee_Account(string Correo, string Nombre, string Identificacion,
            string Direccion, string Telefono, string Password)
        {
            Cls_Usuarios_BLL obj_account_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_account_dal = new Cls_Usuarios_DAL();
            obj_account_dal.SCorreo = Correo;
            obj_account_dal.SNombre = Nombre;
            obj_account_dal.SIdentificacion = Identificacion;
            obj_account_dal.SDireccion = Direccion;
            obj_account_dal.STelefono = Telefono;
            obj_account_dal.SPassword = Password;
            return obj_account_bll.Create_Employee_Account(obj_account_dal);
        }
        #endregion

        #region Delete_Account
        public string Delete_Account(string correo, string password)
        {
            Cls_Usuarios_BLL obj_account_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_account_dal = new Cls_Usuarios_DAL();
            obj_account_dal.SCorreo = correo;
            obj_account_dal.SPassword = password;
            return obj_account_bll.Delete_Account(obj_account_dal);
        }
        #endregion

        #region Delete_User_Account_Por_Admin
        public string Delete_User_Account_Por_Admin(string correo)
        {
            Cls_Usuarios_BLL obj_account_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_account_dal = new Cls_Usuarios_DAL();
            obj_account_dal.SCorreo = correo;
            return obj_account_bll.Delete_Account(obj_account_dal);
        }
        #endregion

        #region Update_Account
        public string Update_Account(string Correo, string Nombre, string Identificacion, 
            string Direccion, string Telefono)
        {
            Cls_Usuarios_BLL obj_account_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_account_dal = new Cls_Usuarios_DAL();
            obj_account_dal.SCorreo = Correo;
            obj_account_dal.SNombre = Nombre;
            obj_account_dal.SIdentificacion = Identificacion;
            obj_account_dal.SDireccion = Direccion;
            obj_account_dal.STelefono = Telefono;
            return obj_account_bll.Update_Account(obj_account_dal);
        }
        #endregion
        #endregion

        #region Filtrar_Empleados
        #region View_Email_Admins
        public List<Cls_Usuarios_DAL> View_Email_Admins(string Correo)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();

            Cls_Usuarios_BLL obj_Email_Admins_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Email_Admins_dal = new Cls_Usuarios_DAL();
            obj_Email_Admins_dal.SCorreo = Correo;
            lista.Add(obj_Email_Admins_bll.View_Email_Admins(obj_Email_Admins_dal));
            return lista;
        }
        #endregion

        #region View_Name_Admins
        public List<Cls_Usuarios_DAL> View_Name_Admins(string Nombre)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SNombre = Nombre;
            lista.Add(obj_Login_bll.View_Name_Admins(obj_Login_dal));
            return lista;
        }
        #endregion

        #region View_ID_Admins
        public List<Cls_Usuarios_DAL> View_ID_Admins(string Identificacion)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SIdentificacion = Identificacion;
            lista.Add(obj_Login_bll.View_ID_Admins(obj_Login_dal));
            return lista;
        }
        #endregion
        #endregion

        #region Filtrar_CLientes
        #region View_Email_Users
        public List<Cls_Usuarios_DAL> View_Email_Users(string Correo)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SCorreo = Correo;
            lista.Add(obj_Login_bll.View_Email_Users(obj_Login_dal));
            return lista;
        }
        #endregion

        #region View_Name_Users
        public List<Cls_Usuarios_DAL> View_Name_Users(string Nombre)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SNombre = Nombre;
            lista.Add(obj_Login_bll.View_Name_Users(obj_Login_dal));
            return lista;
        }
        #endregion

        #region View_ID_Users
        public List<Cls_Usuarios_DAL> View_ID_Users(string Identificacion)
        {
            List<Cls_Usuarios_DAL> lista = new List<Cls_Usuarios_DAL>();
            Cls_Usuarios_BLL obj_Login_bll = new Cls_Usuarios_BLL();
            Cls_Usuarios_DAL obj_Login_dal = new Cls_Usuarios_DAL();
            obj_Login_dal.SIdentificacion = Identificacion;
            lista.Add(obj_Login_bll.View_ID_Users(obj_Login_dal));
            return lista;
        }
        #endregion
        #endregion

        #endregion


        #region Metodos_Entidades_Base_Datos

        #region Cls_Entidad_Categoria_BLL
        public List<Cls_Entidad_Categoria_DAL> Listar()
        {
            Cls_Entidad_Categoria_BLL obj_categoria_BLL = new Cls_Entidad_Categoria_BLL();
            return obj_categoria_BLL.Listar();
        }
        #endregion

        #region Cls_Entidad_Detalle_Ventas_BLL
        public string Insertar_Detalle_Venta(string codigo, string cantidad, string precio, string subtotal, 
            string codproducto)
        {
            Cls_Entidad_Detalle_Ventas_DAL obj_DetalleVenta_DAL = new Cls_Entidad_Detalle_Ventas_DAL();
            Cls_Entidad_Detalle_Ventas_BLL obj_DetalleVenta_BLL = new Cls_Entidad_Detalle_Ventas_BLL();
            obj_DetalleVenta_DAL.Codigo = codigo;
            obj_DetalleVenta_DAL.Cantidad = Convert.ToDecimal(cantidad);
            obj_DetalleVenta_DAL.Precio = Convert.ToDecimal(precio);
            obj_DetalleVenta_DAL.Subtotal = Convert.ToDecimal(subtotal);
            obj_DetalleVenta_DAL.Codproducto = codproducto;
            return obj_DetalleVenta_BLL.Insertar_Detalle_Venta(obj_DetalleVenta_DAL);
        }
        #endregion

        #region Cls_Entidad_Productos_BLL
        public string Insertar_Producto(string codproducto, string desproducto, string codcategoria, 
            string preproducto, string canproducto)
        {
            Cls_Entidad_Productos_DAL obj_Producto_DAL = new Cls_Entidad_Productos_DAL();
            Cls_Entidad_Productos_BLL obj_Producto_BLL = new Cls_Entidad_Productos_BLL();
            obj_Producto_DAL.Codproducto = codproducto;
            obj_Producto_DAL.Desproducto = desproducto;
            obj_Producto_DAL.Codcategoria = codcategoria;
            obj_Producto_DAL.Preproducto = Convert.ToDouble(preproducto);
            obj_Producto_DAL.Canproducto = Convert.ToInt32(canproducto);
            return obj_Producto_BLL.Insertar_Producto(obj_Producto_DAL);
        }

        public List<Cls_Entidad_Productos_DAL> ListarporCategoria(string codcategoria)
        {
            List<Cls_Entidad_Productos_DAL> lista = new List<Cls_Entidad_Productos_DAL>();
            Cls_Entidad_Productos_BLL obj_Producto_BLL = new Cls_Entidad_Productos_BLL();
            Cls_Entidad_Productos_DAL obj_Producto_DAL = new Cls_Entidad_Productos_DAL();
            obj_Producto_DAL.Codcategoria = codcategoria;
            lista.Add(obj_Producto_BLL.ListarporCategoria(obj_Producto_DAL));
            return lista;
        }

        public List<Cls_Entidad_Productos_DAL> ListarTodos()
        {
            Cls_Entidad_Productos_BLL obj_productos_BLL = new Cls_Entidad_Productos_BLL();
            return obj_productos_BLL.ListarTodos();
        }
        #endregion

        #region Cls_Entidad_Ventas_BLL
        public string Insertar_Venta(string codigo, string fecha, string subtotal,
            string igv, string total, string cliente)
        {
            Cls_Entidad_Ventas_DAL obj_Venta_DAL = new Cls_Entidad_Ventas_DAL();
            Cls_Entidad_Ventas_BLL obj_Venta_BLL = new Cls_Entidad_Ventas_BLL();
            obj_Venta_DAL.Codigo = codigo;
            obj_Venta_DAL.Fecha = fecha;
            obj_Venta_DAL.Subtotal = Convert.ToDecimal(subtotal);
            obj_Venta_DAL.Igv = Convert.ToDecimal(igv); 
            obj_Venta_DAL.Total = Convert.ToDecimal(total);
            obj_Venta_DAL.Cliente = cliente;
            return obj_Venta_BLL.Insertar_Venta(obj_Venta_DAL);    
        }

        public List<Cls_Entidad_Ventas_DAL> UltimoCodigo()
        {
            Cls_Entidad_Ventas_BLL obj_Venta_BLL = new Cls_Entidad_Ventas_BLL();
            return obj_Venta_BLL.UltimoCodigo();
        }
        #endregion

        #endregion


    }
}
