using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;

namespace SVC.Interface
{
    [ServiceContract]
    public interface I_Base_Datos
    {
        [OperationContract]
        string Conectar_Base_Datos();
        [OperationContract]
        DataTable Mostrar_Informacion(string Nombre_StoreProcedure_BaseDatos,
            string Nombre_Tabla_BaseDatos);
    }
}
