using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HavikTeste
{
    public partial class Entrevistas_aprovadas_no_periodo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["relat_dt_ini"] != null && Session["relat_dt_fim"] != null)
            {
                label_periodo.Text = Session["relat_dt_ini"].ToString() + " - " + Session["relat_dt_fim"].ToString();
            }
            else
            { label_periodo.Text = ""; }

            if (Session["entrevista_cdd_aprovada"] != null)
            {
                grid_entrevistas_aprovadas_periodo.DataSource = Session["entrevista_cdd_aprovada"];
                grid_entrevistas_aprovadas_periodo.DataBind();
            }
        }
    }
}