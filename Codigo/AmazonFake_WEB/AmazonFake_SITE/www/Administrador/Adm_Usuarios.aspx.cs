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
    public partial class Adm_Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
            }
            else
            {
                CargarListaEmpleados();
            }
        }
        protected void CargarListaEmpleados()
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            string SMsError = string.Empty;

            DataTable myDataTable = cliente.ListarDatos("SP_View_All_Admins", ref SMsError);

            if (SMsError != string.Empty)
            {
                lbl_Error.Text = "Hay un error " + SMsError.ToString();
                GV_ALL_USER.DataSource = null;
            }
            else
            {
                GV_ALL_USER.DataSource = myDataTable;
                GV_ALL_USER.DataBind();
            }

        }

        protected void btn_CargarUsuarios_Click(object sender, EventArgs e)
        {
            this.CargarListaEmpleados();
        }

        protected void btn_CargarEmpleados_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            DataTable myDataTable = new DataTable();
            myDataTable.Columns.Add("Correo Electronico");
            myDataTable.Columns.Add("Nombre del Empleado");
            myDataTable.Columns.Add("Numero de Identificacion");
            myDataTable.Columns.Add("Direccion");
            myDataTable.Columns.Add("Telefono");
            myDataTable.Columns.Add("Tipo de Perfil");

            if (this.SeleccionBusqueda.SelectedValue == "1")
            {
                foreach (var item in cliente.View_Email_Admins(txt_Buscar.Text))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Empleado"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add(Fila);
                }
            }
            else if (this.SeleccionBusqueda.SelectedValue == "2")
            {

                foreach (var item in cliente.View_Name_Admins(txt_Buscar.Text))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Empleado"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add(Fila);
                }
            }
            else if (this.SeleccionBusqueda.SelectedValue == "3")
            {
                foreach (var item in cliente.View_ID_Admins(txt_Buscar.Text))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Empleado"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add(Fila);
                }
            }

            this.GV_ALL_USER.DataSource = myDataTable;
            this.GV_ALL_USER.DataBind();
        }

        protected void btn_Limpir_Click(object sender, EventArgs e)
        {
            CargarListaEmpleados();
            txt_Buscar.Text = string.Empty;
        }
    }
}