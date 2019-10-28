using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CajaDeAhorro
{
    public partial class ConsultarAfiliados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarAfiliados();
            }
        }
        private void CargarAfiliados()
        {
            try
            {

                DataSet ds = ConsultarAfiliado.ObtenerAfiliados();
                this.gridDetalle.DataSource = ds.Tables[0];
                this.gridDetalle.DataBind();
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
    }
}