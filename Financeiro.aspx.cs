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
    public partial class Financeiro : System.Web.UI.Page
    {
        DataSet retorno_financeiro = new DataSet();
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            proj_fin_grid_financeiro.DataBind();
        }

        protected void menuFinanceiro_MenuItemClick(object sender, MenuEventArgs e)
        {
            int indice = int.Parse(e.Item.Value);
            fin.ActiveViewIndex = indice;
        }

        protected void proj_financeiro_dropacao_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (proj_financeiro_dropacao.SelectedValue != "0")
            { proj_fin_grid_financeiro.DataBind(); }
            else { proj_financeiro_dropacao.SelectedValue = "0"; }
        }

        protected void proj_financeiro_dropproduto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (proj_financeiro_dropproduto.SelectedValue != "0")
            { proj_fin_grid_financeiro.DataBind(); }
            else { proj_financeiro_dropproduto.SelectedValue = "0"; }
        }

        protected void proj_financeiro_dropempresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (proj_financeiro_dropempresa.SelectedValue != "0")
            { proj_fin_grid_financeiro.DataBind(); }
            else { proj_financeiro_dropempresa.SelectedValue = "0"; }
        }

        protected void proj_financeiro_dropstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (proj_financeiro_dropstatus.SelectedValue != "0")
            { proj_fin_grid_financeiro.DataBind(); }
            else { proj_financeiro_dropstatus.SelectedValue = "0"; }
        }

        protected void proj_fin_grid_financeiro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                int id_projeto = 0;
                int id_acao = 0;
                if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_projeto"].ToString() != "")
                { id_projeto = int.Parse((proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_projeto"]).ToString()); }
                else { id_projeto = 0; }
                if (id_projeto != 0)
                {Session["IDprojeto"] = id_projeto.ToString();}
                else {Session["IDprojeto"] = null;}

                if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_acao"].ToString() != "")
                { id_acao = int.Parse((proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_acao"]).ToString()); }
                else { id_acao = 0; }
                if(id_acao != 0)
                {Session["IDacao"] = id_acao.ToString();}
                else {Session["IDacao"] = null;}

                SqlCommand com = new SqlCommand("sp_vw_fin_info_acao", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_acao", id_acao);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_financeiro);
                if ((retorno_financeiro.Tables[0].Rows != null) && (retorno_financeiro.Tables[0].Rows.Count != 0))
                {
                    fin.ActiveViewIndex = 1;
                    fin_info_text_acao.Text = retorno_financeiro.Tables[0].Rows[0][0].ToString();
                    fin_info_text_produto.Text = retorno_financeiro.Tables[0].Rows[0][1].ToString();
                    fin_info_text_empresa.Text = retorno_financeiro.Tables[0].Rows[0][2].ToString();
                    fin_info_text_projeto.Text = retorno_financeiro.Tables[0].Rows[0][3].ToString();
                    fin_info_text_equipe_entrega.Text = retorno_financeiro.Tables[0].Rows[0][4].ToString();
                    fin_info_text_captacao.Text = retorno_financeiro.Tables[0].Rows[0][5].ToString();
                    fin_info_text_entrega.Text = retorno_financeiro.Tables[0].Rows[0][6].ToString();
                    fin_info_text_analista_responsavel.Text = retorno_financeiro.Tables[0].Rows[0][7].ToString();
                    fin_info_text_fee.Text = retorno_financeiro.Tables[0].Rows[0][8].ToString();
                    fin_info_text_imposto.Text = retorno_financeiro.Tables[0].Rows[0][9].ToString();
                    fin_info_text_valordanota.Text = retorno_financeiro.Tables[0].Rows[0][10].ToString();
                    fin_info_text_particularidades.Text = retorno_financeiro.Tables[0].Rows[0][11].ToString();
                    //fin_info_text_produto.Text = retorno_financeiro.Tables[0].Rows[0][12].ToString();
                    fin_info_text_candidato.Text = retorno_financeiro.Tables[0].Rows[0][13].ToString();
                    fin_info_text_salario_ini.Text = retorno_financeiro.Tables[0].Rows[0][14].ToString();
                    fin_info_text_salario_fim.Text = retorno_financeiro.Tables[0].Rows[0][15].ToString();
                    //fin_info_text_modo_pagamento.Text = retorno_financeiro.Tables[0].Rows[0][16].ToString();
                    fin_info_text_data_vencimento.Text = retorno_financeiro.Tables[0].Rows[0][17].ToString();
                    fin_info_text_email_contato.Text = retorno_financeiro.Tables[0].Rows[0][18].ToString();
                    fin_info_text_nro_vagas.Text = retorno_financeiro.Tables[0].Rows[0][19].ToString();
                    fin_info_text_req_vagas.Text = retorno_financeiro.Tables[0].Rows[0][20].ToString();
                    fin_info_text_quantidade_parcelas.Text = retorno_financeiro.Tables[0].Rows[0][21].ToString();
                    fin_info_text_mult_salario.Text = retorno_financeiro.Tables[0].Rows[0][23].ToString();
                    fin_info_text_valor_total.Text = retorno_financeiro.Tables[0].Rows[0][24].ToString();
                    fin_info_text_percentual.Text = retorno_financeiro.Tables[0].Rows[0][25].ToString();
                }
                else
                {
                    fin_info_text_acao.Text = "";
                    fin_info_text_produto.Text = "";
                    fin_info_text_empresa.Text = "";
                    fin_info_text_projeto.Text = "";
                    fin_info_text_equipe_entrega.Text = "";
                    fin_info_text_captacao.Text = "";
                    fin_info_text_entrega.Text = "";
                    fin_info_text_analista_responsavel.Text = "";
                    fin_info_text_fee.Text = "";
                    fin_info_text_imposto.Text = "";
                    fin_info_text_valordanota.Text = "";
                    fin_info_text_particularidades.Text = "";
                    //fin_info_text_produto.Text = retorno_financeiro.Tables[0].Rows[0][12].ToString();
                    fin_info_text_candidato.Text = "";
                    fin_info_text_salario_ini.Text = "";
                    fin_info_text_salario_fim.Text = "";
                    //qfin_info_text_modo_pagamento.Text = "";
                    fin_info_text_data_vencimento.Text = "";
                    fin_info_text_email_contato.Text = "";
                    fin_info_text_nro_vagas.Text = "";
                    fin_info_text_req_vagas.Text = "";
                    fin_info_text_quantidade_parcelas.Text = "";
                    fin_info_text_mult_salario.Text = "";
                    fin_info_text_valor_total.Text = "";
                    fin_info_text_percentual.Text = "";
                }
            }
        }

        protected void proj_financeiro_dropperiodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (proj_financeiro_dropperiodo.SelectedValue != "0")
            { proj_fin_grid_financeiro.DataBind(); }
            else { proj_financeiro_dropperiodo.SelectedValue = "0"; }
        }

        protected void proj_financeiro_dropresponsavel_entrega_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (proj_financeiro_dropresponsavel_entrega.SelectedValue != "0")
            { proj_fin_grid_financeiro.DataBind(); }
            else { proj_financeiro_dropresponsavel_entrega.SelectedValue = "0"; }
        }

        protected void proj_financeiro_dropresponsavel_captacao_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (proj_financeiro_dropresponsavel_captacao.SelectedValue != "0")
            { proj_fin_grid_financeiro.DataBind(); }
            else { proj_financeiro_dropresponsavel_captacao.SelectedValue = "0"; }
        }

        protected void proj_observacoes_adicionar_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                int id_acao = 0;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                if (Session["IDacao"] != null)
                { id_acao = int.Parse(Session["IDacao"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_fin_status", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_acao", id_acao);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@usuario", id_usuario);
                if (fin_info_drop_status_financeiro.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_status", int.Parse(fin_info_drop_status_financeiro.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_status", null); }
                if (fin_info_drop_status_nota.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_nota", int.Parse(fin_info_drop_status_nota.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_nota", null); }
                if (fin_info_text_observacoes.Text != "")
                { com.Parameters.AddWithValue("@particularidades", fin_info_text_observacoes.Text); }
                else { com.Parameters.AddWithValue("@particularidades", null); }
                if ((fin_info_text_cod_nota.Text != "") && (fin_info_text_cod_nota.Text.Length < 11))
                { com.Parameters.AddWithValue("@nota_fiscal", fin_info_text_cod_nota.Text); }
                else { com.Parameters.AddWithValue("@nota_fiscal", null); }

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((fin_info_drop_status_financeiro.SelectedIndex != 0) && (sessao != "null"))
                    {
                        com.ExecuteNonQuery();
                        label_msg_fin_info.Text = "cadastro feito com sucesso";
                    }
                    else
                    {
                        label_msg_fin_info.Text = "favor preencher campos obrigatórios";
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        label_msg_fin_info.Text = "cadastro feito sem sucesso";
                    }
                }
            }

        }
    }
}