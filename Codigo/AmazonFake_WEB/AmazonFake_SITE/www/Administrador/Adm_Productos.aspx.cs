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
        protected void CargarListaProductos()
        {
            //AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
            /*I_Base_DatosClient cliente = new I_Base_DatosClient();
            DataTable DataTableClient = cliente.Mostrar_Informacion("SP_VIEW_ALL_Data_PRODUCTO", "PRODUCTO");
            GV_ALL_PRODUCT.DataSource = null;
            GV_ALL_PRODUCT.DataSource = DataTableClient;
            GV_ALL_PRODUCT.DataBind();*/

            I_Base_DatosClient cliente = new I_Base_DatosClient();
            string SMsError = string.Empty;

            DataTable myDataTable = cliente.ListarDatos("SP_VIEW_ALL_Data_PRODUCTO", ref SMsError);

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
            I_Base_DatosClient cliente = new I_Base_DatosClient();
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
            }
        }
    }
}