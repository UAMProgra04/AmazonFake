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
    public partial class Adm_Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
            }
        }

        protected void CargarListaClintes()
        {
            //AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
            I_Base_DatosClient cliente = new I_Base_DatosClient();

            DataTable DataTableClient = cliente.Mostrar_Informacion("SP_View_All_Users", "USUARIOS");

            GV_ALL_CLIENT.DataSource = null;
            GV_ALL_CLIENT.DataSource = DataTableClient;
            GV_ALL_CLIENT.DataBind();
        }

        protected void btn_CargarClientes_Click(object sender, EventArgs e)
        {
            this.CargarListaClintes();
        }
    }
}