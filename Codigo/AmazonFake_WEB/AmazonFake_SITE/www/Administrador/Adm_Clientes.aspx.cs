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
    public partial class Adm_Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Valida_Sesion
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
                
            }else
            {
                CargarListaClintes();
            }
            #endregion
            
        }

        protected void CargarListaClintes()
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            string SMsError = string.Empty;

            DataTable myDataTable = cliente.ListarDatos("SP_View_All_Users", ref SMsError);

            if (SMsError != string.Empty)
            {
                lbl_Error.Text = "Hay un error " + SMsError.ToString();
                GV_ALL_CLIENT.DataSource = null;
            }
            else
            {
                GV_ALL_CLIENT.DataSource = myDataTable;
                GV_ALL_CLIENT.DataBind();
            }
        }

        protected void btn_CargarClientes_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            DataTable myDataTable = new DataTable();
            myDataTable.Columns.Add("Correo Electronico");
            myDataTable.Columns.Add("Nombre del Cliente");
            myDataTable.Columns.Add("Numero de Identificacion");
            myDataTable.Columns.Add("Direccion");
            myDataTable.Columns.Add("Telefono");
            myDataTable.Columns.Add("Tipo de Perfil");

            if (this.SeleccionBusqueda.SelectedValue == "1")
            {
                foreach (var item in cliente.View_Email_Users(txt_Buscar.Text))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Cliente"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add();
                }
            }
            else if(this.SeleccionBusqueda.SelectedValue == "2"){
                
                foreach (var item in cliente.View_Name_Users(txt_Buscar.Text))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Cliente"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add();
                }
            }
            else if(this.SeleccionBusqueda.SelectedValue == "3")
            {
                foreach (var item in cliente.View_ID_Users(txt_Buscar.Text))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Cliente"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add();
                }
            }

            this.GV_ALL_CLIENT.DataSource = myDataTable;
            this.GV_ALL_CLIENT.DataBind();

        }

        protected void txt_Buscar_TextChanged(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            DataTable myDataTable = new DataTable();
            string SMsError = string.Empty;
            //DataTable myDataTable = cliente.ListarDatos("SP_Filtrar", ref SMsError);

            if (txt_Buscar.Text.Trim() != string.Empty)
            {

                myDataTable = cliente.FiltrarDatos("SP_View_Name_Users", "@Nombre", SqlDbType.NVarChar, txt_Buscar.Text.Trim(), ref SMsError);
            }
            else
            {
                myDataTable = cliente.ListarDatos("SP_View_All_Users", ref SMsError);
            }

            if (SMsError != string.Empty)
            {
                lbl_Error.Text = "Hay un error " + SMsError.ToString();
                GV_ALL_CLIENT.DataSource = null;
            }
            else
            {
                GV_ALL_CLIENT.DataSource = myDataTable;
            }
        }
    }
}