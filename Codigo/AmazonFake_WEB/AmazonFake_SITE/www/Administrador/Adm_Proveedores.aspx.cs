using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using AmazonFake_SITE.AmazonFakeService;
using AmazonFake_SITE.AmazonFakeServiceAlt;
using System.Data;

namespace AmazonFake_SITE.www.Administrador
{
    public partial class Adm_Proveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CargarListaProveedores()
        {
            //AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
            I_Base_DatosClient cliente = new I_Base_DatosClient();

            DataTable DataTableClient = cliente.Mostrar_Informacion("SP_VIEW_ALL_Data_PROVEEDOR", "PROVEEDOR");

            GV_ALL_PROVIDER.DataSource = null;
            GV_ALL_PROVIDER.DataSource = DataTableClient;
            GV_ALL_PROVIDER.DataBind();
        }

        protected void btn_CargarProveedores_Click(object sender, EventArgs e)
        {
            this.CargarListaProveedores();
        }
    }
}