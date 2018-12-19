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

        protected void CargarCamposTrabajo(string Correo, string Nombre, string Identificacion,
            string Direccion, string Telefono, string Perfil)
        {
            TextCorreo.Text = Correo;
            TextNombre.Text = Nombre;
            TextIdentificacion.Text = Identificacion;
            TextDireccion.Text = Direccion;
            TextTelefono.Text = Telefono;
            TextPerfil.Text = Perfil;
        }
        protected void LimpiarCampos()
        {
            txt_Buscar.Text = string.Empty;
            lbl_Error.Text = string.Empty;

            TextCorreo.Text = string.Empty;
            TextNombre.Text = string.Empty;
            TextIdentificacion.Text = string.Empty;
            TextDireccion.Text = string.Empty;
            TextTelefono.Text = string.Empty;
            TextPerfil.Text = string.Empty;
            TextStatus.Text = string.Empty;

            Text_Pass.Text = string.Empty;
            Text_Tel.Text = string.Empty;
            Text_Dir.Text = string.Empty;
            Text_Id.Text = string.Empty;
            Text_Nom.Text = string.Empty;
            Text_Email.Text = string.Empty;
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
                foreach (var item in cliente.View_Email_Admins(txt_Buscar.Text.Trim()))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Empleado"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add(Fila);
                    try
                    {
                        CargarCamposTrabajo(item.SCorreo.ToString(), item.SNombre.ToString(), item.SIdentificacion.ToString(),
                                        item.SDireccion.ToString(), item.STelefono.ToString(), item.SNombrePerfil.ToString());
                        lbl_Error.Text = string.Empty;
                    }
                    catch (Exception)
                    {
                        lbl_Error.Text = "Error de formato de busqueda, seleccione la opcion Correcta ";
                    }
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
                    try
                    {
                        CargarCamposTrabajo(item.SCorreo.ToString(), item.SNombre.ToString(), item.SIdentificacion.ToString(),
                                        item.SDireccion.ToString(), item.STelefono.ToString(), item.SNombrePerfil.ToString());
                        lbl_Error.Text = string.Empty;
                    }
                    catch (Exception)
                    {
                        lbl_Error.Text = "Error de formato de busqueda, seleccione la opcion Correcta ";
                    }
                }
            }
            else if (this.SeleccionBusqueda.SelectedValue == "3")
            {
                foreach (var item in cliente.View_ID_Admins(txt_Buscar.Text.Trim()))
                {
                    DataRow Fila = myDataTable.NewRow();
                    Fila["Correo Electronico"] = item.SCorreo;
                    Fila["Nombre del Empleado"] = item.SNombre;
                    Fila["Numero de Identificacion"] = item.SIdentificacion;
                    Fila["Direccion"] = item.SDireccion;
                    Fila["Telefono"] = item.STelefono;
                    Fila["Tipo de Perfil"] = item.SNombrePerfil;
                    myDataTable.Rows.Add(Fila);
                    try
                    {
                        CargarCamposTrabajo(item.SCorreo.ToString(), item.SNombre.ToString(), item.SIdentificacion.ToString(),
                                        item.SDireccion.ToString(), item.STelefono.ToString(), item.SNombrePerfil.ToString());
                        lbl_Error.Text = string.Empty;
                    }
                    catch (Exception)
                    {
                        lbl_Error.Text = "Error de formato de busqueda, seleccione la opcion Correcta ";
                    }
                }
            }
            Validar_Estatus();
            this.GV_ALL_USER.DataSource = myDataTable;
            this.GV_ALL_USER.DataBind();
        }

        protected void btn_Limpir_Click(object sender, EventArgs e)
        {
            CargarListaEmpleados();
            LimpiarCampos();
        }

        protected void Validar_Estatus()
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            if (cliente.View_User_Status(TextCorreo.Text))
            {
                TextStatus.Text = "Activo";
            }
            else
            {
                TextStatus.Text = "Inactivo";
            }
        }

        protected void btn_Actualizar_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            lbl_Error.Text = cliente.Update_Account(TextCorreo.Text, TextNombre.Text, TextIdentificacion.Text,
                TextDireccion.Text, TextTelefono.Text);
            CargarListaEmpleados(); LimpiarCampos();
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            lbl_Error.Text = cliente.Delete_User_Account_Por_Admin(TextCorreo.Text);
            CargarListaEmpleados(); LimpiarCampos();
        }

        protected void btn_validarEstado_Click(object sender, EventArgs e)
        {
            Validar_Estatus();
        }
        
        protected void btn_ChangeStatus_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            if (ChangeStatus.SelectedValue.Equals("Activo"))
            {
                cliente.Lock_User_Account(TextCorreo.Text, true);
            }
            else if (ChangeStatus.SelectedValue.Equals("Inactivo"))
            {
                cliente.Lock_User_Account(TextCorreo.Text, false);
            }
            LimpiarCampos();
        }

        protected void btn_CrearCuentaEmpleado_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            lbl_Resultados.Text = cliente.Create_Employee_Account(Text_Email.Text, 
                Text_Nom.Text, Text_Id.Text, Text_Dir.Text, Text_Tel.Text, 
                Text_Pass.Text);
            CargarListaEmpleados(); LimpiarCampos();

        }
    }
}