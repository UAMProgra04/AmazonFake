using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmazonFake_SITE.AmazonFakeService;

namespace AmazonFake_SITE.www.Administrador
{
    public partial class Adm_Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AmazonFakeService.I_Base_DatosClient SV = 
                new AmazonFakeService.I_Base_DatosClient();

            SV.Mostrar_Informacion("SP_View_All_Users", "USUARIOS");
        }
    }
}