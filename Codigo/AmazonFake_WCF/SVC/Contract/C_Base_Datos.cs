using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BLL.Base_Datos;
using DAL.Base_Datos;
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
    }
}
