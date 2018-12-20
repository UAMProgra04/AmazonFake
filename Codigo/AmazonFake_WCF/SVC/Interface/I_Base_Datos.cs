using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using DAL.Usuarios;
using DAL.Entidades_BD;

namespace SVC.Interface
{
    [ServiceContract]
    public interface I_Base_Datos
    {
        #region Metodo_Conexion_Base_Datos
        [OperationContract]
        string Conectar_Base_Datos();
        #endregion

        #region Metodos_En_Clase
        [OperationContract]
        void Envio_Correo_Cliente(string Correo_Target, string Correo_Source,
            string Correo_Encabezado, string Correo_Mensaje);

        [OperationContract]
        DataTable Mostrar_Informacion(string Nombre_StoreProcedure_BaseDatos,
            string Nombre_Tabla_BaseDatos);

        [OperationContract]
        DataTable ListarDatos(string sNombreSP, ref string SMsError);

        [OperationContract]
        DataTable FiltrarDatos(string sNombreSP, string sNombreParametro,
            SqlDbType DbType, string sValrParametro, ref string SMsError);

        [OperationContract]
        bool Insertar_DatosSinIdentity(string sNombreSP, DataTable dtParametros, 
            ref string SMsError);

        [OperationContract]
        bool Modifica_DatosSinIdentity(string sNombreSP, DataTable dtParametros,
            ref string SMsError);

        [OperationContract]
        bool Eliminar_DatosSinIdentity(string sNombreSP, DataTable dtParametros,
            ref string SMsError);

        [OperationContract]
        bool Insertar_DatosConIdentity(string sNombreSP, DataTable dtParametros,
            ref string sValorScalar, ref string SMsError);

        #endregion

        #region Metodos_Cls_Usuarios
        #region Accesos
        [OperationContract]
        List<Cls_Usuarios_DAL> Login(string correo, string password);
        [OperationContract]
        string Change_Password(string correo, string password);
        [OperationContract]
        List<Cls_Usuarios_DAL> Password_Restore(string correo);
        [OperationContract]
        string Lock_User_Account(string correo, bool Estado);
        [OperationContract]
        Boolean View_User_Status(string Correo);
        #endregion

        #region Administracion_Usuarios
        [OperationContract]
        string Create_Account(string correo, string nombre, string pssword);
        [OperationContract]
        string Create_Employee_Account(string Correo, string Nombre, string Identificacion,
            string Direccion, string Telefono, string Password);
        [OperationContract]
        string Delete_Account(string correo, string password);
        [OperationContract]
        string Delete_User_Account_Por_Admin(string correo);
        [OperationContract]
        string Update_Account(string Correo, string Nombre, string Identificacion,
            string Direccion, string Telefono);
        #endregion

        #region Filtrar_Empleados
        [OperationContract]
        List<Cls_Usuarios_DAL> View_Email_Admins(string Correo);
        [OperationContract]
        List<Cls_Usuarios_DAL> View_Name_Admins(string Nombre);
        [OperationContract]
        List<Cls_Usuarios_DAL> View_ID_Admins(string Identificacion);
        #endregion

        #region Filtrar_CLientes
        [OperationContract]
        List<Cls_Usuarios_DAL> View_Email_Users(string Correo);
        [OperationContract]
        List<Cls_Usuarios_DAL> View_Name_Users(string Nombre);
        [OperationContract]
        List<Cls_Usuarios_DAL> View_ID_Users(string Identificacion);
        #endregion

        #endregion

        #region Metodos_Entidades_Base_Datos
        #region Cls_Entidad_Categoria_BLL
        [OperationContract]
        List<Cls_Entidad_Categoria_DAL> Listar();
        #endregion

        #region Cls_Entidad_Detalle_Ventas_BLL
        [OperationContract]
        string Insertar_Detalle_Venta(string codigo, string cantidad, string precio, string subtotal,
            string codproducto);
        #endregion

        #region Cls_Entidad_Productos_BLL
        [OperationContract]
        string Insertar_Producto(string codproducto, string desproducto, string codcategoria,
            string preproducto, string canproducto);
        [OperationContract]
        List<Cls_Entidad_Productos_DAL> ListarporCategoria(string codcategoria);
        [OperationContract]
        List<Cls_Entidad_Productos_DAL> ListarTodos();
        #endregion

        #region Cls_Entidad_Ventas_BLL
        [OperationContract]
        string Insertar_Venta(string codigo, string fecha, string subtotal,
            string igv, string total, string cliente);
        [OperationContract]
        List<Cls_Entidad_Ventas_DAL> UltimoCodigo();
        #endregion

        #endregion
    }
}
