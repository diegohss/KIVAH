using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.IO;
using System.Globalization;
using System.Threading;
using System.Drawing;
using System.Resources;

namespace HavikTeste
{
	public partial class projeto_novo : System.Web.UI.Page
	{

        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik_teste;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void projeto_novo_button_cadastro_click(object sender, ImageClickEventArgs e)
        {
            projeto_novo_gravar();
            Response.Redirect("projeto_requisitos.aspx");
        }

        protected void projeto_novo_gravar()
        {
            projeto_novo_gravar_raiz();
        }

        protected void projeto_novo_gravar_raiz()
        {
            string cstr = conexao;
            string erro = "nao";
            int id_usuario = int.Parse(Session["IDusuario"].ToString());
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                SqlCommand com = new SqlCommand("sp_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", 1);
                com.Parameters.AddWithValue("@id_projeto", null);
                com.Parameters.AddWithValue("@id_empresa", null);
                com.Parameters.AddWithValue("@nome", projeto_novo_nome.Text);
                if (projeto_novo_ddl_segmento.SelectedValue != "0")
                { com.Parameters.AddWithValue("@segmento", int.Parse(projeto_novo_ddl_segmento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@segmento", null); }
                com.Parameters.AddWithValue("@area", null);
                if (projeto_novo_ddl_cargo.SelectedValue != "0")
                { com.Parameters.AddWithValue("@cargo", int.Parse(projeto_novo_ddl_cargo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@cargo", null); }
                com.Parameters.AddWithValue("@subdivisao", null);
                com.Parameters.AddWithValue("@tipo_produto", null);
                if (projeto_novo_ddl_captacao.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_captacao", int.Parse(projeto_novo_ddl_captacao.SelectedValue)); }
                else
                {
                    com.Parameters.AddWithValue("@responsavel_captacao", null);
                }

                if (projeto_novo_ddl_equipe_entrega.SelectedValue != "0")
                { com.Parameters.AddWithValue("@equipe", int.Parse(projeto_novo_ddl_equipe_entrega.SelectedValue)); }
                else
                {
                    com.Parameters.AddWithValue("@equipe", null);
                }
                if (projeto_novo_ddl_responsavel_entrega.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_entrega", int.Parse(projeto_novo_ddl_responsavel_entrega.SelectedValue)); }
                else
                {
                    com.Parameters.AddWithValue("@responsavel_entrega", null);
                }
                if (projeto_novo_ddl_analista_responsavel.SelectedValue != "0")
                { com.Parameters.AddWithValue("@colaborador_responsavel", int.Parse(projeto_novo_ddl_analista_responsavel.SelectedValue)); }
                else
                {
                    com.Parameters.AddWithValue("@colaborador_responsavel", null);
                }
                if (projeto_novo_text_data_shortlist.Text != "")
                {
                    string valor = projeto_novo_text_data_shortlist.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(3, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(valor, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@shortlist_prevista", data);
                    }
                    else { erro = "sim"; }
                }
                else
                {
                    com.Parameters.AddWithValue("@shortlist_prevista", null);
                }
                if (projeto_novo_text_data_entrega.Text != "")
                {
                    string valor = projeto_novo_text_data_entrega.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(3, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(valor, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@shortlist_entrega", data);
                    }
                    else { erro = "sim"; }
                }
                else
                {
                    com.Parameters.AddWithValue("@shortlist_entrega", null);
                }
                if (projeto_novo_text_data_inicio_busca.Text != "")
                {
                    string valor = projeto_novo_text_data_inicio_busca.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(3, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(valor, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@busca_inicio", data);
                    }
                    else { erro = "sim"; }
                }
                else
                {
                    com.Parameters.AddWithValue("@busca_inicio", null);
                }
                if (projeto_novo_text_nro_vagas.Text != "")
                { com.Parameters.AddWithValue("@nrovagas", projeto_novo_text_nro_vagas.Text); }
                else { com.Parameters.AddWithValue("@nrovagas", null); }
                if (projeto_novo_text_requisicao_vagas.Text != "")
                { com.Parameters.AddWithValue("@requisicao", projeto_novo_text_requisicao_vagas.Text); }
                else { com.Parameters.AddWithValue("@requisicao", null); }

                //FAZER A TROCA DE TIPO DE CAMPO EM CADA 1 DOS CAMPOS ABAIXO ATÉ O PRÓXIMO COMENTÁRIO
                com.Parameters.AddWithValue("@requisitante", null);
                com.Parameters.AddWithValue("@rh", null);
                com.Parameters.AddWithValue("@id_estado", null);
                com.Parameters.AddWithValue("@id_cidade", null);

                //CAMPOS "MORTOS"
                com.Parameters.AddWithValue("@shortlist_qtd_cand", null);
                com.Parameters.AddWithValue("@grau_dificuldade", null);                
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                con.Close();
            }
        }

        protected void projeto_novo_button_requisitos_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("projeto_requisitos.aspx");
        }
	}
}