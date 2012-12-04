using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HavikTeste
{
    public partial class Entrevista_Realizada_No_Periodo_Por_Agendador_Analitico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["relat_dt_ini"] != null && Session["relat_dt_fim"] != null)
            {
                label_periodo.Text = Session["relat_dt_ini"].ToString() + " - " + Session["relat_dt_fim"].ToString();
            }
            else
            { label_periodo.Text = ""; }

            if (Session["entrevista_agendada_analitico"] != null)
            {
                entrevistas_realizadas_no_periodo_por_agendador_analitico.DataSource = Session["entrevista_agendada_analitico"];
                entrevistas_realizadas_no_periodo_por_agendador_analitico.DataBind();
            }
        }
    }
}