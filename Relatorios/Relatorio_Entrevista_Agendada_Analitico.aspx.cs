using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HavikTeste
{
    public partial class Relatorio_Entrevista_Agendada_Analitico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["relat_dt_ini"] != null && Session["relat_dt_fim"] != null)
            {
                label_periodo.Text = Session["relat_dt_ini"].ToString() + " - " + Session["relat_dt_fim"].ToString();
            }
            else
            { label_periodo.Text = ""; }

            if (Session["relat_entrevista_agendada_analitico"] != null)
            {
                grid_relatorio_entrevista_agendada_analitico.DataSource = Session["relat_entrevista_agendada_analitico"];
                grid_relatorio_entrevista_agendada_analitico.DataBind();
            }
        }
    }
}