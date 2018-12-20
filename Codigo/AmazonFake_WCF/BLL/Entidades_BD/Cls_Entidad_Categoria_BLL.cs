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
    public class Cls_Entidad_Categoria_BLL
    {
        public List<Cls_Entidad_Categoria_DAL> Listar()
        {
            Cls_BD_BLL obj_bll = new Cls_BD_BLL();
            SqlCommand obj_cmd = new SqlCommand();

            List<Cls_Entidad_Categoria_DAL> lista = new List<Cls_Entidad_Categoria_DAL>();
            Cls_Entidad_Categoria_DAL obj_categoria_Dal;
            SqlDataReader lector;
            try
            {
                obj_cmd.CommandType = CommandType.StoredProcedure;
                obj_cmd.CommandText = "SP_ListasTodos_Categorias";
                obj_cmd.Connection = obj_bll.Conexion_BAseDatos();

                lector = obj_cmd.ExecuteReader();

                while (lector.Read())
                {
                    obj_categoria_Dal = new Cls_Entidad_Categoria_DAL();
                    obj_categoria_Dal.Codcategoria = (string)(lector[0]);
                    obj_categoria_Dal.Descategoria = (string)(lector[1]);
                    lista.Add(obj_categoria_Dal);
                }
            }
            catch (Exception)
            {
                lista = null;
            }
            return lista;
        }
    }
}
