using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HavikTeste
{
    public partial class Candidatos_aprovados_por_projeto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["relat_dt_ini"] != null && Session["relat_dt_fim"] != null)
            {
                label_periodo.Text = Session["relat_dt_ini"].ToString() + " - " + Session["relat_dt_fim"].ToString();
            }
            else
            { label_periodo.Text = ""; }

            if (Session["candidato_ok_projeto"] != null)
            {
                grid_candidatos_aprovados_por_projeto.DataSource = Session["candidato_ok_projeto"];
                grid_candidatos_aprovados_por_projeto.DataBind();
            }
        }
    }
}