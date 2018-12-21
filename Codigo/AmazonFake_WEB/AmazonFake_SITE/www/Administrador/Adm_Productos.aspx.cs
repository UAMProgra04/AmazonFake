using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmazonFake_SITE.AmazonFakeService;
//using AmazonFake_SITE.AmazonFakeServiceAlt;
using System.Data;

namespace AmazonFake_SITE.www.Administrador
{
    public partial class Adm_Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
            }
            else
            {
                CargarListaProductos();
            }
        }
        protected void LimpiarCampos()
        {
            Text_CodProducto.Text = string.Empty;
            Text_NomProducto.Text = string.Empty;
            Text_CodCategoria.Text = string.Empty;
            Text_PrecioProduc.Text = string.Empty;
            Text_CantidadStock.Text = string.Empty;
            Text_ImagenProducto.Text = string.Empty;
            lblErrorBorrado.Text = string.Empty;
        }
        protected void CargarListaProductos()
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            string SMsError = string.Empty;

            DataTable myDataTable = cliente.ListarDatos("SP_View_Productos", ref SMsError);

            if (SMsError != string.Empty)
            {
                lbl_Error.Text = "Hay un error " + SMsError.ToString();
                GV_ALL_PRODUCT.DataSource = null;
            }
            else
            {
                GV_ALL_PRODUCT.DataSource = myDataTable;
                GV_ALL_PRODUCT.DataBind();
            }
        }
        protected void btn_CargarProductos_Click(object sender, EventArgs e)
        {
            this.CargarListaProductos();
        }

        protected void txt_Buscar_TextChanged(object sender, EventArgs e)
        {
            /*I_Base_DatosClient cliente = new I_Base_DatosClient();
            DataTable myDataTable = new DataTable();
            string SMsError = string.Empty;


            //DataTable myDataTable = cliente.ListarDatos("SP_Filtrar", ref SMsError);

            if (txt_Buscar.Text.Trim() != string.Empty)
            {

                myDataTable = cliente.FiltrarDatos("SP_VIEW_NAME_Data_PRODUCTO", "@Nombre", SqlDbType.NVarChar, txt_Buscar.Text.Trim(), ref SMsError);
            }
            else
            {
                myDataTable = cliente.ListarDatos("SP_VIEW_ALL_Data_PRODUCTO", ref SMsError);
            }

            if (SMsError != string.Empty)
            {
                lbl_Error.Text = "Hay un error " + SMsError.ToString();
                GV_ALL_PRODUCT.DataSource = null;
            }
            else
            {
                GV_ALL_PRODUCT.DataSource = myDataTable;
            }*/
        }

        protected void btn_Agregar_Articulo_Click(object sender, EventArgs e)
        {
            if ((Text_CodProducto.Text != string.Empty) &
                (Text_NomProducto.Text != string.Empty) &
                (Text_CodCategoria.Text != string.Empty) &
                (Text_PrecioProduc.Text != string.Empty) &
                (Text_CantidadStock.Text != string.Empty) &
                (Text_ImagenProducto.Text != string.Empty))
            {
                I_Base_DatosClient cliente = new I_Base_DatosClient();
                lbl_Resultados.Text = cliente.Insertar_Producto(Text_CodProducto.Text, Text_NomProducto.Text,
                    Text_CodCategoria.Text, Text_PrecioProduc.Text, Text_CantidadStock.Text, Text_ImagenProducto.Text);
                CargarListaProductos(); LimpiarCampos();
            }
            else
            {
                lbl_Resultados.Text = "Debe llenar todos los campos con informacion valida";
                LimpiarCampos();
            }
            
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            lblErrorBorrado.Text = cliente.Eliminar_Producto(Text_eliminar.Text);
            CargarListaProductos(); LimpiarCampos();
        }
    }
}