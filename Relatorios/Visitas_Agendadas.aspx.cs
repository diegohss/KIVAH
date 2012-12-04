using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HavikTeste.Relatorios
{
    public partial class Visitas_Agendadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["relatorio"] != null)
            {
                grid_relatorio_visitas_agendadas.DataSource = Session["relatorio"];
                grid_relatorio_visitas_agendadas.DataBind();
            }
        }
    }
}