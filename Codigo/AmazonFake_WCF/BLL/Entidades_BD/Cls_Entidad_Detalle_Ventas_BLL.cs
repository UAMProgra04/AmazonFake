using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BLL.Base_Datos;
using DAL.Entidades_BD;

namespace BLL.Entidades_BD
{
    public class Cls_Entidad_Detalle_Ventas_BLL
    {
        public string Insertar_Detalle_Venta(Cls_Entidad_Detalle_Ventas_DAL obj_DetalleVenta_Dal)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Detalle_Ventas";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@codigo", obj_DetalleVenta_Dal.Codigo);
                    obj_cmd.Parameters.AddWithValue("@cantidad", obj_DetalleVenta_Dal.Cantidad);
                    obj_cmd.Parameters.AddWithValue("@precio", obj_DetalleVenta_Dal.Precio);
                    obj_cmd.Parameters.AddWithValue("@subtotal", obj_DetalleVenta_Dal.Subtotal);
                    obj_cmd.Parameters.AddWithValue("@codproducto", obj_DetalleVenta_Dal.Codproducto);
                }

                int registros = obj_cmd.ExecuteNonQuery();
                if (registros == 1)
                {
                    obj_DetalleVenta_Dal.Respuesta = "Detalle de vVenta ingresado de forma Satisfactoria";
                }
                else
                {
                    obj_DetalleVenta_Dal.Respuesta = "Error al Insertar el Detalle de la Venta";
                }
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return obj_DetalleVenta_Dal.Respuesta;
        }
    }
}
