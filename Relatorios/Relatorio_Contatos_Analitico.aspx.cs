using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HavikTeste.Relatorios
{
    public partial class Relatorio_Contatos_Analitico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["relat_dt_ini"] != null && Session["relat_dt_fim"] != null)
            {
                label_periodo.Text = Session["relat_dt_ini"].ToString() + " - " + Session["relat_dt_fim"].ToString();
            }
            else
            { label_periodo.Text = ""; }

            if (Session["relatorio_contatos_analítico"] != null)
            {
                grid_relatorio_contatos_analitico.DataSource = Session["relatorio_contatos_analítico"];
                grid_relatorio_contatos_analitico.DataBind();
            }
        }
    }
}