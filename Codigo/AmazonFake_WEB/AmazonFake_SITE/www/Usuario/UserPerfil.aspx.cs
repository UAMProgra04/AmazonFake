using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmazonFake_SITE.AmazonFakeService;

namespace AmazonFake_SITE.www.Usuario
{
    public partial class UserPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
            }
            else
            {
                txt_Correo.Text = Session["Usuariocorreo"].ToString();
                lblCorreo.Text = Session["Usuariocorreo"].ToString();
                Cargar_Datos_Perfil();
            }
        }

        protected void CargarCamposTrabajo(string Nombre, string Identificacion,
            string Direccion, string Telefono)
        {

            /*Referencia:
             * Para el uso del atributo placeHolder
             *https://stackoverflow.com/questions/20689890/add-html5-placeholder-text-to-a-textbox-net/20689928
             */

            txt_Nombre.Attributes.Add("placeholder", Nombre);
            txt_Identificacion.Attributes.Add("placeholder", Identificacion);
            txt_Direccion.Attributes.Add("placeholder", Direccion);
            txt_Telefono.Attributes.Add("placeholder", Telefono);
        }

        protected void Cargar_Datos_Perfil()
        {

            I_Base_DatosClient cliente = new I_Base_DatosClient();

            if (Session["UsuarioPerfil"].ToString().Equals("1"))
            {
                foreach (var item in cliente.View_Email_Admins(txt_Correo.Text.Trim()))
                {
                    try
                    {
                        CargarCamposTrabajo(item.SNombre.ToString(), item.SIdentificacion.ToString(),
                                        item.SDireccion.ToString(), item.STelefono.ToString());
                    }
                    catch (Exception)
                    {
                        lbl_Error.Text = "Error de formato de busqueda, seleccione la opcion Correcta ";
                    }
                }
            }
            else if (Session["UsuarioPerfil"].ToString().Equals("2"))
            {
                foreach (var item in cliente.View_Email_Users(txt_Correo.Text.Trim()))
                {
                    try
                    {
                        CargarCamposTrabajo(item.SNombre.ToString(), item.SIdentificacion.ToString(),
                                        item.SDireccion.ToString(), item.STelefono.ToString());
                    }
                    catch (Exception)
                    {
                        lbl_Error.Text = "Error de formato de busqueda, seleccione la opcion Correcta ";
                    }
                }
            }
        }

        protected void btn_ActualizarDatos_Cliente_Click(object sender, EventArgs e)
        {
            I_Base_DatosClient cliente = new I_Base_DatosClient();
            lbl_Error.Text = cliente.Update_Account(txt_Correo.Text, txt_Nombre.Text, txt_Identificacion.Text,
                txt_Direccion.Text, txt_Telefono.Text);
            Cargar_Datos_Perfil();
        }
    }
}