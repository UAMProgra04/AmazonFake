using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using DAL.Usuarios;

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
        #endregion

        #region Administracion_Usuarios
        [OperationContract]
        string Create_Account(string correo, string nombre, string pssword);
        [OperationContract]
        string Delete_Account(string correo, string password);
        [OperationContract]
        string Update_Account(string Correo, string Identificacion,
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
    }
}
