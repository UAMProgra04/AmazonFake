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
    public partial class Adm_Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CargarListaUsuarios()
        {
            //AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
            I_Base_DatosClient cliente = new I_Base_DatosClient();

            DataTable DataTableUser = cliente.Mostrar_Informacion("SP_View_All_Admins", "USUARIOS");

            GV_ALL_USER.DataSource = null;
            GV_ALL_USER.DataSource = DataTableUser;
            GV_ALL_USER.DataBind();
        }

        protected void btn_CargarUsuarios_Click(object sender, EventArgs e)
        {
            this.CargarListaUsuarios();
        }
    }
}