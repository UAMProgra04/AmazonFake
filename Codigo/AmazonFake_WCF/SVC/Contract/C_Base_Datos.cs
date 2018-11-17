using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BLL.Base_Datos;
using DAL.Base_Datos;

namespace SVC.Contract
{
    public class C_Base_Datos : Interface.I_Base_Datos
    {
        public string Conectar_Base_Datos()
        {
            Cls_BD_BLL obj_BD_BLL = new Cls_BD_BLL();
            Cls_BD_DAL obj_BD_DAL = new Cls_BD_DAL();
            obj_BD_BLL.Crear_Conexion(ref obj_BD_DAL);
            return obj_BD_DAL.SMsError;
        }
    }
}
