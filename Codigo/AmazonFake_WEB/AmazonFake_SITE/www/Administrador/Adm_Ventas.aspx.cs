using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AmazonFake_SITE.AmazonFakeService;

namespace AmazonFake_SITE.www.Administrador
{
    public partial class Adm_Ventas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Valida_Sesion
            if (Session["UsuarioSession"] != null &&
                Session["UsuarioPerfil"].ToString().Equals("0"))
            {
                CargarListaVentas();
            }
            else
            {
                Response.Redirect("~/www/Index.aspx");
            }
            #endregion  
        }

        #region  Metodo_Cargar_Lista_Ventas
        protected void CargarListaVentas()
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            string SMsError = string.Empty;

            DataTable myDataTable = cliente.ListarDatos("SP_View_Ventas", ref SMsError);

            if (SMsError != string.Empty)
            {
                lbl_Error.Text = "Hay un error " + SMsError.ToString();
                GV_ALL_Ventas.DataSource = null;
            }
            else
            {
                GV_ALL_Ventas.DataSource = myDataTable;
                GV_ALL_Ventas.DataBind();
            }
        }
        #endregion
    }
}