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
    public class Cls_Entidad_Ventas_BLL
    {
        public string contador;
        public string Insertar_Venta(Cls_Entidad_Ventas_DAL obj_venta_Dal)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Insert_Ventas";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@codigo", obj_venta_Dal.Codigo);
                    obj_cmd.Parameters.AddWithValue("@fecha", obj_venta_Dal.Fecha);
                    obj_cmd.Parameters.AddWithValue("@subtotal", obj_venta_Dal.Subtotal);
                    obj_cmd.Parameters.AddWithValue("@igv", obj_venta_Dal.Igv);
                    obj_cmd.Parameters.AddWithValue("@total", obj_venta_Dal.Total);
                    obj_cmd.Parameters.AddWithValue("@cliente", obj_venta_Dal.Cliente);
                }
                int registros = obj_cmd.ExecuteNonQuery();
                if (registros >= 1)
                {
                    obj_venta_Dal.Respuesta = "Venta Agregada de forma Satisfactoria";
                }
                else
                {
                    obj_venta_Dal.Respuesta = "Error al Insertar Venta";
                }
            }
            catch (Exception)
            {
                obj_venta_Dal = null;
            }
            return obj_venta_Dal.Respuesta;
        }

        public List<Cls_Entidad_Ventas_DAL> UltimoCodigo()
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();

            SqlCommand obj_cmdT = new SqlCommand("select count(VEN_Codigo),max (VEN_Codigo) from VENTA", obj_bll.Conexion_BAseDatos());
            obj_cmdT.CommandType = CommandType.Text;

            SqlDataReader PaTable = obj_cmdT.ExecuteReader();
            List<Cls_Entidad_Ventas_DAL> Coleccion = new List<Cls_Entidad_Ventas_DAL>();
            while (PaTable.Read())
            {
                this.contador = Convert.ToString(PaTable.GetInt32(0));
                if (contador == "0")
                {
                    Coleccion.Add(new Cls_Entidad_Ventas_DAL(PaTable.GetInt32(0).ToString()));

                }
                else
                {
                    Coleccion.Add(new Cls_Entidad_Ventas_DAL(PaTable.GetString(1)));

                }
            }
            return Coleccion;

        }
    }
}
