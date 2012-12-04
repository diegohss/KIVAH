using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HavikTeste.Relatorios
{
    public partial class Entrevistas_Realizadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["relatorio"] != null)
            {
                grid_relatorio_entrevistas_realizadas.DataSource = Session["relatorio_contatos"];
                grid_relatorio_entrevistas_realizadas.DataBind();
            }
        }
    }
}