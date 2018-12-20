using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace AmazonFake_SITE.www
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioSession"] == null)
            {
                Response.Redirect("~/www/Index.aspx");
            }
            else
            {
                this.TextCorreoCliente.Text = Session["Usuariocorreo"].ToString();
                this.txtCliente.Text = Session["UsuarioSession"].ToString();
                if (Page.IsPostBack == false)
                {
                    cargarcarrito();
                    Ultimo();
                    lblFecha.Text = DateTime.Now.Date.ToString().Substring(0, 10);
                }
            }
        }

        public void cargarcarrito()
        {
            GridView GV = new GridView();
            GridView1.DataSource = Session["pedido"];
            GridView1.DataBind();
            Button1_Click(Button1, null);
        }

        private void Ultimo()
        {
            AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
            cliente.UltimoCodigo();

            //VentasCN cnper = new VentasCN();
            //List<Ventas> per = cliente.UltimoCodigo();

            foreach (var ma in cliente.UltimoCodigo())
            {
                int codigo = 0;
                codigo = Convert.ToInt32(ma.Codigo);
                codigo = codigo + 1;
                if (codigo < 10)
                {
                    ma.Codigo = "000" + codigo.ToString();
                }
                if (codigo < 100 && codigo > 9)
                {
                    ma.Codigo = "00" + codigo.ToString();
                }
                if (codigo < 1000 && codigo > 99)
                {
                    ma.Codigo = "0" + codigo.ToString();
                }
                txtCodigo.Text = ma.Codigo;
            }
        }

        protected void SendEmail(object sender, EventArgs e)
        {
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress("amazonface.mail@gmail.com");
            correo.To.Add(this.TextCorreoCliente.Text);
            correo.Subject = "Informe de Compra en AmazonFake";

            string cod, des;
            int cant;
            var items = (DataTable)Session["pedido"];
            decimal total, prec, subtotal, igv;
            des = "";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                cod = (GridView1.Rows[i].Cells[1].Text);
                //\
                cant = System.Convert.ToInt16(((TextBox)this.GridView1.Rows[i].Cells[0].FindControl("TextBox1")).Text);
                prec = Decimal.Parse(GridView1.Rows[i].Cells[3].Text);
                des += "\r\n" + (GridView1.Rows[i].Cells[2].Text) + " " + "(" + cant + ")" + " " + Convert.ToString(prec) + "\r\n";
                //Actualiza la canasta

                foreach (DataRow objDR in items.Rows)
                {
                    if (objDR["codproducto"].ToString() == cod)
                    {
                        break;
                    }
                }
            }
            try
            {
                correo.Body = "Estimado " + txtCliente.Text + " Es un gusto informarle que usted ha realizado un pedido en nuestro sitio web por la cantidad de : S/. " + lblTotal.Text + "\r\nEntre los cuales se encuentran\r\n" + des;
                correo.IsBodyHtml = false;
                correo.Priority = System.Net.Mail.MailPriority.Normal;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("amazonface.mail@gmail.com", "egs76$gs");
                smtp.EnableSsl = true;
                smtp.Send(correo);
                smtp.Dispose();
                Response.Redirect("/Index.aspx");

            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message.ToString();
            }
        }

        public double TotalCarrito(DataTable dt)
        {
            double tot = 0;
            foreach (DataRow item in dt.Rows)
            {
                tot += Convert.ToDouble(item[4]);
            }
            return tot;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Borrar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                DataTable ocar = new DataTable();
                ocar = (DataTable)Session["pedido"];
                ocar.Rows[index].Delete();
                lblTotal.Text = TotalCarrito(ocar).ToString();
                GridView1.DataSource = ocar;
                GridView1.DataBind();
                cargarcarrito();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            string id = GridView1.DataKeys[index].Value.ToString();

            DataTable dt1 = Session["pedido"] as DataTable;

            DataRow[] rows = dt1.Select(string.Format("codproducto = {0}", id));
            if (rows.Count() > 0)
            {
                dt1.Rows.Remove(rows[0]);
            }

            Session["pedido"] = dt1;

            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            AmazonFakeService.I_Base_DatosClient cliente = new AmazonFakeService.I_Base_DatosClient();
            cliente.Insertar_Venta(txtCodigo.Text, lblFecha.Text, lblSubTotal.Text, lblIGV.Text, 
                lblTotal.Text, txtCliente.Text);

            /*ComponenteNegocio.VentasCN oMatriculaCN = new ComponenteNegocio.VentasCN();
            ComponenteEntidad.Ventas oMatriculaCE = new ComponenteEntidad.Ventas();
            oMatriculaCE.Codigo = txtCodigo.Text;
            oMatriculaCE.Fecha = lblFecha.Text;
            oMatriculaCE.Subtotal = decimal.Parse(lblSubTotal.Text);
            oMatriculaCE.Igv = decimal.Parse(lblIGV.Text);
            oMatriculaCE.Total = decimal.Parse(lblTotal.Text);
            oMatriculaCE.Cliente = txtCliente.Text;
            oMatriculaCN.Insertar(oMatriculaCE);*/

            foreach (GridViewRow row in GridView1.Rows)
            {
                
                int cantidad = int.Parse(((TextBox)row.Cells[4].FindControl("TextBox1")).Text);
                decimal Precio = decimal.Parse(Convert.ToString(row.Cells[3].Text));
                decimal Subtotal = decimal.Parse(Convert.ToString(row.Cells[5].Text));
                string Codproducto = Convert.ToString(row.Cells[1].Text);
                cliente.Insertar_Detalle_Venta(txtCodigo.Text, cantidad.ToString(), Precio.ToString(),
                    Subtotal.ToString(), Codproducto);

                //ComponenteNegocio.DetalleVentaCN oMatriculaCNN = new ComponenteNegocio.DetalleVentaCN();
                //ComponenteEntidad.DetalleVenta oMatriculaCEE = new ComponenteEntidad.DetalleVenta();
                //oMatriculaCEE.Codigo = txtCodigo.Text;
                //oMatriculaCEE.Cantidad = int.Parse(((TextBox)row.Cells[4].FindControl("TextBox1")).Text);
                //oMatriculaCEE.Precio = decimal.Parse(Convert.ToString(row.Cells[3].Text));
                //oMatriculaCEE.Subtotal = decimal.Parse(Convert.ToString(row.Cells[5].Text));
                //oMatriculaCEE.Codproducto = Convert.ToString(row.Cells[1].Text);
                //oMatriculaCNN.Insertar(oMatriculaCEE);
            }
            SendEmail(sender, e);
            this.Response.Write("<script language='JavaScript'>window.alert('PROCESO TERMINADO CORRECTAMENTE')</script>");
            Response.Redirect("Carrito_Compra.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Index.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i;
            double total = 0, prec, subtotal = 0, igv;
            string cod, desc;
            int cant;

            var items = (DataTable)Session["pedido"];
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                cod = (GridView1.Rows[i].Cells[1].Text);
                desc = (GridView1.Rows[i].Cells[2].Text);
                prec = System.Convert.ToDouble(GridView1.Rows[i].Cells[3].Text);
                cant = System.Convert.ToInt16(((TextBox)this.GridView1.Rows[i].Cells[4].FindControl("TextBox1")).Text);
                double prec1 = System.Convert.ToDouble(prec);
                subtotal = cant * prec1;
                GridView1.Rows[i].Cells[5].Text = subtotal.ToString();
                foreach (DataRow dr in items.Rows)
                {
                    if (dr["codproducto"].ToString() == cod.ToString())
                    {
                        dr["canproducto"] = cant;
                        dr["subtotal"] = subtotal;
                    }
                }
                total = total + subtotal;
            }

            igv = total * 0.18;
            subtotal = total - igv;

            lblIGV.Text = igv.ToString("0.00");
            lblSubTotal.Text = subtotal.ToString("0.00");
            lblTotal.Text = total.ToString("0.00");
        }

        
    }
}