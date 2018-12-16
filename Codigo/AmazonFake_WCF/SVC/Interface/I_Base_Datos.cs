using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using DAL.Base_Datos;

namespace SVC.Interface
{
    [ServiceContract]
    public interface I_Base_Datos
    {
        [OperationContract]
        void Envio_Correo_Cliente(string Correo_Target, string Correo_Source,
            string Correo_Encabezado, string Correo_Mensaje);

        [OperationContract]
        string Conectar_Base_Datos();

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





        [OperationContract]
        string Create_Account(string correo, string nombre, string pssword);

        [OperationContract]
        List<Cls_Login_DAL> Login(string correo, string password);
    }
}
