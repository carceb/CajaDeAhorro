using Seguridad.Clases;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CajaDeAhorro.Vista
{
    public partial class UCNavegacion : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EstablecerSeguridad();
        }
        private void EstablecerSeguridad()
        {
            CSeguridad objetoSeguridad = new CSeguridad();
            objetoSeguridad.SeguridadUsuarioDatosID = Convert.ToInt32(this.Session["UserId"].ToString());
            if (objetoSeguridad.EsUsuarioAdministrador() == false)
            {
                ColocarEnlacesInvisibles();
                lnkCambiarClave.Visible = true;
                if (objetoSeguridad.EsAccesoPermitido(9) == true)
                {
                   // lnkSolicitudes.Visible = true;
                }


                //=============================================================
                //AFILIACION
                //=============================================================
                if (objetoSeguridad.EsAccesoPermitido(1023) == true)
                {
                    lnkAfiliacion.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(1026) == true)
                {
                    lnkAfiliados.Visible = true;
                }
                //=============================================================

                //=============================================================
                //CAJA DE AHORROS
                //=============================================================

                if (objetoSeguridad.EsAccesoPermitido(1023) == true)
                {
                    lnkCuentas.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(1026) == true)
                {
                    lnkIngresos.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(1026) == true)
                {
                    lnkReversar.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(1026) == true)
                {
                    lnkAsignarMontosAfiliado.Visible = true;
                }

            }
        }
        private void ColocarEnlacesInvisibles()
        {
            foreach (Control ctrl in Controls)
            {
                if (ctrl.GetType().Name == "HyperLink")
                {
                    HyperLink hl = (HyperLink)ctrl;
                    hl.Visible = false;
                }
            }
        }
    }
}