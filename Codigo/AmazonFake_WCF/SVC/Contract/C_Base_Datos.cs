using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BLL.Base_Datos;
using DAL.Base_Datos;
using DAL.Correo;
using BLL.Correo;
using System.Data;

namespace SVC.Contract
{
    public class C_Base_Datos : Interface.I_Base_Datos
    {
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
        #endregion

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
    }
}
