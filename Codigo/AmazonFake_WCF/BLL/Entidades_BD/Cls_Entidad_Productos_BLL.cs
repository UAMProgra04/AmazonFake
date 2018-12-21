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
    public class Cls_Entidad_Productos_BLL
    {
        public string Insertar_Producto(Cls_Entidad_Productos_DAL obj_producto_Dal)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Insert_Productos";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@codproducto", Convert.ToChar(obj_producto_Dal.Codproducto));
                    obj_cmd.Parameters.AddWithValue("@desproducto", obj_producto_Dal.Desproducto);
                    obj_cmd.Parameters.AddWithValue("@codcategoria", Convert.ToChar(obj_producto_Dal.Codcategoria));
                    obj_cmd.Parameters.AddWithValue("@preproducto", Convert.ToDecimal(obj_producto_Dal.Preproducto));
                    obj_cmd.Parameters.AddWithValue("@canproducto", Convert.ToInt32(obj_producto_Dal.Canproducto));
                    obj_cmd.Parameters.AddWithValue("@Imagen", obj_producto_Dal.Imagen);
                }
                int registros = obj_cmd.ExecuteNonQuery();
                if (registros == 1)
                {
                    obj_producto_Dal.Respuesta = "Producto agregado de forma correcta";
                }
                else
                {
                    obj_producto_Dal.Respuesta = "Error al ingresar Producto";
                }
            }
            catch (Exception)
            {
                obj_producto_Dal = null;
            }
            return obj_producto_Dal.Respuesta;
        }

        public string Eliminar_Producto(Cls_Entidad_Productos_DAL obj_producto_Dal)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_Delete_Productos";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();
                {
                    obj_cmd.Parameters.AddWithValue("@desproducto", obj_producto_Dal.Desproducto);
                }
                int registros = obj_cmd.ExecuteNonQuery();
                if (registros == 1)
                {
                    obj_producto_Dal.Respuesta = "Producto Eliminado de forma correcta";
                }
                else
                {
                    obj_producto_Dal.Respuesta = "Error al Eliminar Producto";
                }
            }
            catch (Exception)
            {
                obj_producto_Dal = null;
            }
            return obj_producto_Dal.Respuesta;
        }

        public Cls_Entidad_Productos_DAL ListarporCategoria(Cls_Entidad_Productos_DAL obj_Producto_DAL)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Entidad_Productos_DAL obj_producto_Dal = new Cls_Entidad_Productos_DAL();
            SqlDataReader lector;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Categorias";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos(); ;
                {
                    obj_cmd.Parameters.AddWithValue("@codcategoria", Convert.ToChar(obj_Producto_DAL.Codcategoria));
                }

                lector = obj_cmd.ExecuteReader();

                if (lector.Read())
                {
                    obj_producto_Dal = new Cls_Entidad_Productos_DAL();
                    obj_producto_Dal.Codproducto = (string)(lector[0]);
                    obj_producto_Dal.Desproducto = (string)(lector[1]);
                    obj_producto_Dal.Codcategoria = (string)(lector[2]);
                    obj_producto_Dal.Preproducto = (double)(lector[3]);
                    obj_producto_Dal.Canproducto = (int)(lector[4]);
                    obj_producto_Dal.Imagen = (string)(lector[5]);
                }
            }
            catch (Exception)
            {
                obj_producto_Dal = null;
            }
            return obj_producto_Dal;
        }

        public Cls_Entidad_Productos_DAL ListarporNombreProducto(Cls_Entidad_Productos_DAL obj_Producto_DAL)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Entidad_Productos_DAL obj_producto_Dal = new Cls_Entidad_Productos_DAL();
            SqlDataReader lector;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_NombreProducto";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos(); ;
                {
                    obj_cmd.Parameters.AddWithValue("@desproducto", obj_Producto_DAL.Desproducto);
                }

                lector = obj_cmd.ExecuteReader();

                if (lector.Read())
                {
                    obj_producto_Dal = new Cls_Entidad_Productos_DAL();
                    obj_producto_Dal.Codproducto = (string)(lector[0]);
                    obj_producto_Dal.Desproducto = (string)(lector[1]);
                    obj_producto_Dal.Codcategoria = (string)(lector[2]);
                    obj_producto_Dal.Preproducto = (double)(lector[3]);
                    obj_producto_Dal.Canproducto = (int)(lector[4]);
                    obj_producto_Dal.Imagen = (string)(lector[5]);
                }
            }
            catch (Exception)
            {
                obj_producto_Dal = null;
            }
            return obj_producto_Dal;
        }

        public Cls_Entidad_Productos_DAL ListarporCodigoProducto(Cls_Entidad_Productos_DAL obj_Producto_DAL)
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();
            Cls_Entidad_Productos_DAL obj_producto_Dal = new Cls_Entidad_Productos_DAL();
            SqlDataReader lector;

            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_CodigoProducto";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos(); ;
                {
                    obj_cmd.Parameters.AddWithValue("@codproducto", obj_Producto_DAL.Codproducto);
                }

                lector = obj_cmd.ExecuteReader();

                if (lector.Read())
                {
                    obj_producto_Dal = new Cls_Entidad_Productos_DAL();
                    obj_producto_Dal.Codproducto = (string)(lector[0]);
                    obj_producto_Dal.Desproducto = (string)(lector[1]);
                    obj_producto_Dal.Codcategoria = (string)(lector[2]);
                    obj_producto_Dal.Preproducto = (double)(lector[3]);
                    obj_producto_Dal.Canproducto = (int)(lector[4]);
                    obj_producto_Dal.Imagen = (string)(lector[5]);
                }
            }
            catch (Exception)
            {
                obj_producto_Dal = null;
            }
            return obj_producto_Dal;
        }

        public List<Cls_Entidad_Productos_DAL> ListarTodos()
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();

            List<Cls_Entidad_Productos_DAL> lista = new List<Cls_Entidad_Productos_DAL>();
            Cls_Entidad_Productos_DAL obj_producto_Dal;
            SqlDataReader lector;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_View_Productos";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();

                lector = obj_cmd.ExecuteReader();

                while (lector.Read())
                {
                    obj_producto_Dal = new Cls_Entidad_Productos_DAL();
                    obj_producto_Dal.Codproducto = (string)(lector[0]);
                    obj_producto_Dal.Desproducto = (string)(lector[1]);
                    obj_producto_Dal.Codcategoria = (string)(lector[2]);
                    obj_producto_Dal.Preproducto = (double)(lector[3]);
                    obj_producto_Dal.Canproducto = (int)(lector[4]);
                    obj_producto_Dal.Imagen = (string)(lector[5]);
                    lista.Add(obj_producto_Dal);
                }
            }
            catch (Exception)
            {
                obj_producto_Dal = null;
            }
            return lista;
        }
    }
}
