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
    public partial class Produto : System.Web.UI.Page
    {
        DataSet ds_busca_popup_empresa = new DataSet();

        DataSet retorno_grid_projeto = new DataSet();
        DataSet retorno_grid_financeiro = new DataSet();
        DataSet retorno_cliente = new DataSet();
        DataSet retorno_projeto_grid = new DataSet();
        
        string conexao = "Data Source=192.168.0.20;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        //string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.Title = "Havik System - Projeto";

            proj_clientes_grid_clientes.DataBind();
            label_proj_clientes.Text = "O projeto possui " + proj_clientes_grid_clientes.Rows.Count.ToString() + " clientes";

            if (Session["IDusuario"] == null)
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            //PREENCHE A LABEL EM DADOS CADASTRAIS DE PROJETO

            if (Session["IDprojeto"] != null)
            {
                proj_produto_label_id.Text = "ID: " + Session["IDprojeto"].ToString();
            }
            else
            { proj_produto_label_id.Text = ""; }

            //HABILITAR CAMPOS EXTRAS EM PROJ_PRODUTO PARA ASSISTENTE OPERACIONAL
            if ((Session["cargo"].ToString() == "assistente") || (Session["cargo"].ToString() == "coordenador"))
            {
                proj_produto_dt_prevista_shortlist.Enabled = true;
                proj_produto_dt_entrega_shortlist.Enabled = true;
                proj_produto_dt_inicio_busca.Enabled = true;
                proj_produto_quantidade_candidatos.Enabled = true;
                proj_produto_dropnivel.Enabled = true;
                proj_produto_nronovagas.Enabled = true;
                proj_produto_requisicao.Enabled = true;
            }
            else
            {
                proj_produto_dt_prevista_shortlist.Enabled = false;
                proj_produto_dt_entrega_shortlist.Enabled = false;
                proj_produto_dt_inicio_busca.Enabled = false;
                proj_produto_quantidade_candidatos.Enabled = false;
                proj_produto_dropnivel.Enabled = false;
                proj_produto_nronovagas.Enabled = false;
                proj_produto_requisicao.Enabled = false;
            }

            if (Session["grid_busca_projeto"] != null)
            {
                grid_busca_projeto.DataSource = Session["grid_busca_projeto"];
                grid_busca_projeto.DataBind();
                foreach (GridViewRow row in grid_busca_projeto.Rows)
                {                    
                        if (Session["IDprojeto"] != null)
                        {
                            if (Session["IDprojeto"].ToString() == grid_busca_projeto.DataKeys[row.RowIndex].Values["id_projeto"].ToString())
                            {
                                grid_busca_projeto.Rows[row.RowIndex].Font.Bold = true;
                            }
                        }                   
                }
            }

            if ((!IsPostBack) || (Session["recarrega_dados"] != null))
            if (Session["retorno_projeto"] != null)
            {
                retorno_projeto.DataSource = Session["retorno_projeto"];
                retorno_projeto.DataBind();
                if (retorno_projeto.Rows[0].Cells[1].Text != "&nbsp;")
                {
                    Session["label_modulo"] = retorno_projeto.Rows[0].Cells[1].Text.ToString();
                    proj_produto_textnome.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[1].Text.ToString());
                }
                else { proj_produto_textnome.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[2].Text != "&nbsp;")
                { proj_produto_empresa.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[2].Text); }
                else { proj_produto_empresa.Text = ""; }
                //proj_produto_dt_inicio.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[11].Text);
                //proj_produto_dt_fim.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[5].Text);
                if (retorno_projeto.Rows[0].Cells[7].Text == "&nbsp;")
                { proj_produto_droptipo.SelectedValue = "0"; }
                else { proj_produto_droptipo.SelectedValue = retorno_projeto.Rows[0].Cells[7].Text; }
                if (retorno_projeto.Rows[0].Cells[3].Text == "&nbsp;")
                { proj_produto_dropsegmento.SelectedValue = "0"; }
                else { proj_produto_dropsegmento.SelectedValue = retorno_projeto.Rows[0].Cells[3].Text; }
                if (retorno_projeto.Rows[0].Cells[4].Text == "&nbsp;")
                { proj_produto_droparea.SelectedValue = "0"; }
                else 
                {                     
                    proj_produto_droparea.SelectedValue = retorno_projeto.Rows[0].Cells[4].Text;
                    proj_produto_dropsubdivisao.DataBind();
                    proj_produto_dropsubdivisao.Items.Insert(0, "Escolha a opção");
                    if (retorno_projeto.Rows[0].Cells[5].Text == "&nbsp;")
                    { proj_produto_dropsubdivisao.SelectedIndex = 0; }
                    else {proj_produto_dropsubdivisao.SelectedValue = retorno_projeto.Rows[0].Cells[5].Text;}
                }
                if (retorno_projeto.Rows[0].Cells[6].Text == "&nbsp;")
                { proj_produto_dropcargo.SelectedValue = "0"; }
                else { proj_produto_dropcargo.SelectedValue = retorno_projeto.Rows[0].Cells[6].Text; }
                if (retorno_projeto.Rows[0].Cells[8].Text == "&nbsp;")
                { proj_produto_dropcaptacao.SelectedValue = "0"; }
                else { proj_produto_dropcaptacao.SelectedValue = retorno_projeto.Rows[0].Cells[8].Text; }
                if (retorno_projeto.Rows[0].Cells[9].Text == "&nbsp;")
                { proj_produto_dropentrega.SelectedValue = "0"; }
                else { proj_produto_dropentrega.SelectedValue = retorno_projeto.Rows[0].Cells[9].Text; }
                if (retorno_projeto.Rows[0].Cells[10].Text == "&nbsp;")
                { proj_produto_dropresponsavel.SelectedIndex = 0; }
                else { proj_produto_dropresponsavel.SelectedValue = retorno_projeto.Rows[0].Cells[10].Text; }

                if (retorno_projeto.Rows[0].Cells[31].Text != "&nbsp;")
                {
                    proj_requisitos_dropescolaridade.DataBind();
                    proj_requisitos_dropescolaridade.SelectedValue = retorno_projeto.Rows[0].Cells[31].Text;
                }
                else { proj_requisitos_dropescolaridade.SelectedValue = "0"; }
                if (retorno_projeto.Rows[0].Cells[32].Text != "&nbsp;")
                {
                    proj_requisitos_dropsuperiorimediato.DataBind();
                    proj_requisitos_dropsuperiorimediato.SelectedValue = retorno_projeto.Rows[0].Cells[32].Text;
                }

                if (retorno_projeto.Rows[0].Cells[36].Text != "&nbsp;")
                { proj_site_descricao.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[36].Text); }
                else { proj_site_descricao.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[37].Text != "&nbsp;")
                { proj_site_resumo.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[37].Text); }
                else { proj_site_resumo.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[38].Text == "True")
                { radio_mostrarnosite.SelectedValue = "1"; }
                else { radio_mostrarnosite.SelectedValue = "0"; }
                if (retorno_projeto.Rows[0].Cells[13].Text != "&nbsp;")
                { proj_financeiro_textcandidato.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[13].Text); }
                else { proj_financeiro_textcandidato.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[14].Text != "&nbsp;")
                { proj_financeiro_textemailfatura.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[14].Text); }
                else { proj_financeiro_textemailfatura.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[15].Text != "&nbsp;")
                { proj_financeiro_textparticularidades.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[15].Text); }
                else { proj_financeiro_textparticularidades.Text = ""; }
                //if (retorno_projeto.Rows[0].Cells[17].Text != "&nbsp;")
                //{ proj_financeiro_textsucesso.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[17].Text); }
                //else { proj_financeiro_textsucesso.Text = ""; }
                //if (retorno_projeto.Rows[0].Cells[18].Text != "&nbsp;")
                //{ proj_financeiro_textretainer.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[18].Text); }
                //else { proj_financeiro_textretainer.Text = ""; }
                //if (retorno_projeto.Rows[0].Cells[19].Text != "&nbsp;")
                //{ proj_financeiro_textprimeiraparcela.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[19].Text); }
                //else { proj_financeiro_textprimeiraparcela.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[20].Text != "&nbsp;")
                { proj_financeiro_textsegundaparcela.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[20].Text); }
                else { proj_financeiro_textsegundaparcela.Text = ""; }
                //if (retorno_projeto.Rows[0].Cells[21].Text != "&nbsp;")
                //{ proj_financeiro_textterceiraparcela.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[21].Text); }
                //else { proj_financeiro_textterceiraparcela.Text = ""; }
                //if (retorno_projeto.Rows[0].Cells[22].Text != "&nbsp;")
                //{ proj_radio_modopagamento.SelectedValue = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[22].Text); }
                //else { proj_radio_modopagamento.SelectedValue = "2"; }
                //if (retorno_projeto.Rows[0].Cells[25].Text != "&nbsp;")
                //{ proj_radio_cobrarimpostos.SelectedValue = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[25].Text); }
                //else { proj_radio_cobrarimpostos.SelectedValue = "2"; }
                //if (retorno_projeto.Rows[0].Cells[24].Text != "&nbsp;")
                //{ proj_financeiro_textfee.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[24].Text); }
                //else { proj_financeiro_textfee.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[26].Text != "&nbsp;")
                { proj_financeiro_textsalarioinicial.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[26].Text); }
                else { proj_financeiro_textsalarioinicial.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[27].Text != "&nbsp;")
                { proj_financeiro_textsalariofinal.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[27].Text); }
                else { proj_financeiro_textsalariofinal.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[33].Text != "&nbsp;")
                {
                    float value = float.Parse(HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[33].Text));
                    //string result = value.ToString("f2");
                    proj_requisitos_textsalario.Text = value.ToString();
                    proj_financeiro_textsalarioinicial.Text = value.ToString();
                }
                else 
                { 
                    proj_requisitos_textsalario.Text = "";
                    proj_financeiro_textsalarioinicial.Text = "";
                }
                if (retorno_projeto.Rows[0].Cells[34].Text != "&nbsp;")
                {
                    float value = float.Parse(HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[34].Text));
                    string result = value.ToString("f2");
                    proj_requisitos_textbonus.Text = result; 
                }
                else { proj_requisitos_textbonus.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[29].Text != "&nbsp;")
                { proj_requisitos_texttamanhoequipe.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[29].Text); }
                else { proj_requisitos_texttamanhoequipe.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[30].Text != "&nbsp;")
                { proj_requisitos_textexperiencia.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[30].Text); }
                else { proj_requisitos_textexperiencia.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[35].Text != "&nbsp;")
                {
                    float value = float.Parse(HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[35].Text));
                    string result = value.ToString("f2");
                    proj_requisitos_totalcash.Text = result; 
                }
                else { proj_requisitos_totalcash.Text = ""; }

                if (retorno_projeto.Rows[0].Cells[28].Text != "&nbsp;")
                { proj_requisitos_modelocontrato.SelectedValue = retorno_projeto.Rows[0].Cells[28].Text; }
                else { proj_requisitos_modelocontrato.SelectedValue = "5"; }

                if (retorno_projeto.Rows[0].Cells[39].Text != "&nbsp;")
                { 
                    id_empresa.Value = retorno_projeto.Rows[0].Cells[39].Text;
                    proj_produto_drop_requisitante.DataBind();
                    proj_produto_drop_rh.DataBind();
                    if (retorno_projeto.Rows[0].Cells[40].Text != "&nbsp;")
                    { proj_produto_drop_requisitante.SelectedValue = retorno_projeto.Rows[0].Cells[40].Text; }
                    else { proj_produto_drop_requisitante.SelectedValue = "0"; }
                    if (retorno_projeto.Rows[0].Cells[41].Text != "&nbsp;")
                    { proj_produto_drop_rh.SelectedValue = retorno_projeto.Rows[0].Cells[41].Text; }
                    else { proj_produto_drop_rh.SelectedValue = "0"; }
                    proj_produto_list_req_tel.DataBind();
                    proj_produto_list_req_email.DataBind();
                    proj_produto_text_rh_tel.DataBind();
                    proj_produto_list_rh_email.DataBind();
                }
                if (retorno_projeto.Rows[0].Cells[42].Text != "&nbsp;")
                {
                    proj_dadoscadastrais_estado.DataBind();
                    proj_dadoscadastrais_estado.SelectedValue = retorno_projeto.Rows[0].Cells[42].Text;
                    proj_dadoscadastrais_dropcidade.DataBind();
                    if (retorno_projeto.Rows[0].Cells[43].Text != "&nbsp;")
                    { proj_dadoscadastrais_dropcidade.SelectedValue = retorno_projeto.Rows[0].Cells[43].Text; }
                    else { proj_dadoscadastrais_dropcidade.SelectedValue = "0"; }
                }
                else { proj_dadoscadastrais_estado.SelectedValue = "0"; }
                if (retorno_projeto.Rows[0].Cells[44].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[44].Text).ToString();
                    //string conversao = valor.Substring(0, 2) +  valor.Substring(3, 2) +  valor.Substring(6, 4)
                    //string conversao = valor.Replace("/", "");

                    //DateTime data = Convert.ToDateTime(valor, new CultureInfo("pt-BR", false));                        
                    //teste = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[3].Text);
                    proj_produto_dt_inicio.Text = valor;
                }
                else { proj_produto_dt_inicio.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[45].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[45].Text).ToString();
                    //string conversao = valor.Substring(0, 2) +  valor.Substring(3, 2) +  valor.Substring(6, 4);

                    //string conversao = valor.Replace("/", "");

                    //DateTime data = Convert.ToDateTime(valor, new CultureInfo("pt-BR", false));                        
                    //teste = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[3].Text);
                    proj_produto_dt_fim.Text = valor;
                }
                else { proj_produto_dt_fim.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[46].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[46].Text).ToString();
                    proj_requisitos_textsalario_ini.Text = valor;
                }
                if (retorno_projeto.Rows[0].Cells[47].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[47].Text).ToString();
                    proj_requisitos_textsalario_fim.Text = valor;
                }
                if (retorno_projeto.Rows[0].Cells[48].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[48].Text).ToString();
                    proj_produto_dt_prevista_shortlist.Text = valor;
                }
                if (retorno_projeto.Rows[0].Cells[49].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[49].Text).ToString();
                    proj_produto_dt_entrega_shortlist.Text = valor;
                }
                if (retorno_projeto.Rows[0].Cells[50].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[50].Text).ToString();
                    proj_produto_dt_inicio_busca.Text = valor;
                }
                if (retorno_projeto.Rows[0].Cells[51].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[51].Text).ToString();
                    proj_produto_quantidade_candidatos.Text = valor;
                }
                if (retorno_projeto.Rows[0].Cells[52].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[52].Text).ToString();
                    proj_produto_dropnivel.SelectedValue = valor;
                }
                if (retorno_projeto.Rows[0].Cells[53].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[53].Text).ToString();
                    proj_produto_nronovagas.Text = valor;
                }
                else { proj_produto_nronovagas.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[54].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[54].Text).ToString();
                    proj_produto_requisicao.Text = valor;
                }
                else { proj_produto_requisicao.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[55].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[55].Text).ToString();
                    proj_site_titulo.Text = valor;
                }
                else { proj_site_titulo.Text = ""; }
                if (retorno_projeto.Rows[0].Cells[56].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[56].Text).ToString();
                    proj_produto_drop_equipe.SelectedValue = valor;
                }
                else { proj_produto_drop_equipe.SelectedIndex = 0; }
                

                Session["recarrega_dados"] = null;
            }
        }

        protected void ddldadoscadastrais_estado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlcidade = (DropDownList)proj_produto.FindControl("proj_dadoscadastrais_dropcidade");

            if (ddlcidade != null)
            {
                ddlcidade.DataBind();
                ddlcidade.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void SqlDataSourceDadosCadastraisCidade_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlestado = (DropDownList)proj_produto.FindControl("proj_dadoscadastrais_estado");

            if (ddlestado != null)
            {
                e.Command.Parameters["@ufcod"].Value = ddlestado.SelectedValue;
            }
        }

        protected void ddlstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList ddlstatus = (DropDownList)proj_havik.FindControl("proj_havik_dropsubstatus");

            //if (ddlstatus != null)
            //{
            //    ddlstatus.DataBind();
            //    ddlstatus.Items.Insert(0, "Escolha a opção");
            //}

            /*if (proj_havik_dropstatus.SelectedValue != "0")
            { proj_havik_dropsubstatus.DataBind(); }
            else { proj_havik_dropsubstatus.SelectedValue = "0"; }*/

            proj_havik_dropsubstatus.DataBind();
            proj_havik_dropsubstatus.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceSubstatus_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)proj_havik.FindControl("proj_havik_dropstatus");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList ddlarea = (DropDownList)proj_produto.FindControl("proj_produto_droparea");

            //if (ddlarea != null)
            //{
            //    ddlarea.DataBind();
            //    ddlarea.Items.Insert(0, "Escolha a opção");
            //}

            //proj_produto_droparea.DataBind();
            //proj_produto_droparea.Items.Insert(0, "Escolha a opção");
        }

        protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList ddlarea = (DropDownList)proj_produto.FindControl("proj_produto_dropsubdivisao");

            //if (ddlarea != null)
            //{
            //    ddlarea.DataBind();
            //   ddlarea.Items.Insert(0, "Escolha a opção");
            //}
            proj_produto_dropsubdivisao.DataBind();
            proj_produto_dropsubdivisao.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)proj_produto.FindControl("proj_produto_dropsegmento");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)proj_produto.FindControl("proj_produto_droparea");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void SqlDataSourceDetails_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DropDownList ddlseg = (DropDownList)proj_produto.FindControl("proj_produto_dropsegmento");
            e.Command.Parameters["@Category"].Value = ddlseg.SelectedValue;
            DropDownList ddlarea = (DropDownList)proj_produto.FindControl("proj_produto_droparea");
            e.Command.Parameters["@Product"].Value = ddlarea.SelectedValue;
            DropDownList ddlstatus = (DropDownList)proj_havik.FindControl("proj_havik_dropstatus");
            e.Command.Parameters["@Status"].Value = ddlstatus.SelectedValue;
        }

        protected void proj_segmento_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        /* CADASTRO DE PROJETO ----------- ABA PRODUTO */

        protected void Button23_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                string comp = "";
                string compddl = "0";
                string valida = "0";
                string erro = "nao";
                string idempresa = Request.Form[id_empresa.UniqueID];
                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);
                
                SqlCommand com = new SqlCommand("sp_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                if (id_projeto != 0)
                { com.Parameters.AddWithValue("@id_projeto", id_projeto); }
                else { com.Parameters.AddWithValue("@id_projeto", null); }
                if (idempresa != "")
                {
                    com.Parameters.AddWithValue("@id_empresa", int.Parse(idempresa));
                }
                else { com.Parameters.AddWithValue("@id_empresa", null); }
                com.Parameters.AddWithValue("@nome", proj_produto_textnome.Text);
                if (proj_produto_dropsegmento.SelectedValue != "0")
                { com.Parameters.AddWithValue("@segmento", int.Parse(proj_produto_dropsegmento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@segmento", null); }
                if (proj_produto_droparea.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@area", int.Parse(proj_produto_droparea.SelectedValue)); }
                else { com.Parameters.AddWithValue("@area", null); }
                if ((proj_produto_dropsubdivisao.SelectedIndex != 0) && (proj_produto_dropsubdivisao.SelectedValue != ""))
                { com.Parameters.AddWithValue("@subdivisao", int.Parse(proj_produto_dropsubdivisao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@subdivisao", null); }
                if (proj_produto_dropcargo.SelectedValue != "0")
                { com.Parameters.AddWithValue("@cargo", int.Parse(proj_produto_dropcargo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@cargo", null); }
                if (proj_produto_droptipo.SelectedValue != "0")
                { com.Parameters.AddWithValue("@tipo_produto", int.Parse(proj_produto_droptipo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@tipo_produto", null); }
                if (proj_produto_dropcaptacao.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_captacao", int.Parse(proj_produto_dropcaptacao.SelectedValue)); }
                else 
                {
                    erro = "sim";
                    com.Parameters.AddWithValue("@responsavel_captacao", null);
                }
                if (proj_produto_dropentrega.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_entrega", int.Parse(proj_produto_dropentrega.SelectedValue)); }
                else 
                {
                    erro = "sim";
                    com.Parameters.AddWithValue("@responsavel_entrega", null); 
                }
                if (proj_produto_dropresponsavel.SelectedValue != "0")
                { com.Parameters.AddWithValue("@colaborador_responsavel", int.Parse(proj_produto_dropresponsavel.SelectedValue)); }
                else 
                {
                    erro = "sim";
                    com.Parameters.AddWithValue("@colaborador_responsavel", null); 
                }
                if (proj_produto_drop_requisitante.SelectedValue != "0")
                { com.Parameters.AddWithValue("@requisitante", int.Parse(proj_produto_drop_requisitante.SelectedValue)); }
                else { com.Parameters.AddWithValue("@requisitante", null); }
                if (proj_produto_drop_rh.SelectedValue != "0")
                { com.Parameters.AddWithValue("@rh", int.Parse(proj_produto_drop_rh.SelectedValue)); }
                else { com.Parameters.AddWithValue("@rh", null); }
                if (proj_dadoscadastrais_estado.SelectedValue != "0")
                { com.Parameters.AddWithValue("@id_estado", proj_dadoscadastrais_estado.SelectedValue); }
                else { com.Parameters.AddWithValue("@id_estado", null); }
                if (proj_dadoscadastrais_dropcidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_cidade", proj_dadoscadastrais_dropcidade.SelectedValue); }
                else { com.Parameters.AddWithValue("@id_cidade", null); }
                if (proj_produto_nronovagas.Text != "")
                { com.Parameters.AddWithValue("@nrovagas", proj_produto_nronovagas.Text); }
                else { com.Parameters.AddWithValue("@nrovagas", null); }
                if (proj_produto_requisicao.Text != "")
                { com.Parameters.AddWithValue("@requisicao", proj_produto_requisicao.Text); }
                else { com.Parameters.AddWithValue("@requisicao", null); }
                if (proj_produto_dt_prevista_shortlist.Text != "")
                {
                    string valor = proj_produto_dt_prevista_shortlist.Text;
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
                if (proj_produto_dt_entrega_shortlist.Text != "")
                {
                    string valor = proj_produto_dt_entrega_shortlist.Text;
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
                if (proj_produto_dt_inicio_busca.Text != "")
                {
                    string valor = proj_produto_dt_inicio_busca.Text;
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
                if (proj_produto_quantidade_candidatos.Text != "")
                { com.Parameters.AddWithValue("@shortlist_qtd_cand", int.Parse(proj_produto_quantidade_candidatos.Text)); }
                else { com.Parameters.AddWithValue("@shortlist_qtd_cand", null); }
                if (proj_produto_dropnivel.SelectedValue != "0")
                { com.Parameters.AddWithValue("@grau_dificuldade", int.Parse(proj_produto_dropnivel.SelectedValue)); }
                else { com.Parameters.AddWithValue("@grau_dificuldade", null); }
                if (proj_produto_drop_equipe.SelectedValue != "0")
                { com.Parameters.AddWithValue("@equipe", int.Parse(proj_produto_drop_equipe.SelectedValue)); }
                else 
                {
                    erro = "sim";
                    com.Parameters.AddWithValue("@equipe", null); 
                }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                        if ((proj_produto_droptipo.SelectedValue.ToString() != compddl) && (erro != "sim") && (proj_produto_textnome.Text.ToString() != comp) &&
                            (proj_produto_droparea.SelectedValue.ToString() != compddl) && (proj_produto_dropsubdivisao.SelectedIndex != 0) &&
                            (proj_produto_dropsegmento.SelectedValue.ToString() != compddl) && (proj_produto_dropcargo.SelectedValue.ToString() != compddl) &&
                            (proj_produto_dropsubdivisao.SelectedIndex != -1))
                        {
                            if (idempresa == "")
                            {
                                exibe_mensagem_projeto(1, "cadastro feito sem sucesso, favor preencher empresa!");
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa da lista ou cadastre uma nova!')");
                            }
                            else
                            {
                                string sqll = "Select nome from bc_empresa_unq where " + @idempresa + "= id";
                                SqlDataAdapter daa = new SqlDataAdapter(sqll, conexao);
                                DataTable dt = new DataTable();
                                daa.Fill(dt);
                                string hidenfield = "";
                                hidenfield = dt.Rows[0]["nome"].ToString();
                                if (proj_produto_empresa.Text == hidenfield)
                                {
                                    com.ExecuteNonQuery();
                                    //id_empresa.Value = "";
                                    valida = rowCount.Value.ToString();
                                }
                                else
                                {
                                    exibe_mensagem_projeto(1, "escolha uma empresa da lista ou cadastre uma nova!");
                                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa da lista ou cadastre uma nova!')"); 
                                }
                                if (valida != "0")
                                {
                                    Session["IDprojeto"] = rowCount.Value;
                                    exibe_mensagem_projeto(1, "cadastro feito com sucesso!");
                                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");

                                }
                                //GRAVAÇÃO DAS INFORMAÇÕES DEPOIS DE UM CADASTRO PARA PERSISTIR OS DADOS PELOS MÓDULOS
                                int idd_projeto = int.Parse(Session["IDprojeto"].ToString());

                                SqlCommand comm = new SqlCommand("sp_retorno_projeto", con);
                                comm.CommandType = CommandType.StoredProcedure;

                                comm.Parameters.AddWithValue("@id_projeto", idd_projeto);

                                SqlDataAdapter persistencia = new SqlDataAdapter(comm);
                                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                                //Array teste = da.GetFillParameters();  
                                //da.Fill(dt_busca);
                                persistencia.Fill(retorno_grid_projeto);
                                Session["retorno_projeto"] = retorno_grid_projeto;
                            }
                            //LIMPAR CAMPOS!!!
                        }
                        else
                        {
                            exibe_mensagem_projeto(1, "cadastro feito sem sucesso, favor preencher o campo faltando e/ou colocar datas válidas!");
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(1, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Session["IDprojeto"] = rowCount.Value;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/

                /*proj_requisitos_modelocontrato.SelectedValue = "5";
                proj_requisitos_texttamanhoequipe.Text = "";
                proj_requisitos_textexperiencia.Text = "";
                proj_requisitos_dropescolaridade.SelectedValue = "0";
                proj_requisitos_dropsuperiorimediato.SelectedValue = "0";
                proj_requisitos_textsalario.Text = "";
                proj_requisitos_textbonus.Text = "";
                proj_requisitos_totalcash.Text = "";

                proj_financeiro_textcandidato.Text = "";
                proj_financeiro_textemailfatura.Text = "";
                proj_financeiro_textsucesso.Text = "";
                proj_financeiro_textretainer.Text = "";
                proj_financeiro_textprimeiraparcela.Text = "";
                proj_financeiro_textsegundaparcela.Text = "";
                proj_financeiro_textterceiraparcela.Text = "";
                proj_radio_modopagamento.SelectedValue = "2";
                proj_radio_cobrarimpostos.SelectedValue = "2";
                proj_financeiro_dropvencimento.SelectedValue = "0";
                proj_financeiro_textfee.Text = "";
                proj_financeiro_textsalarioinicial.Text = "";
                proj_financeiro_textsalariofinal.Text = "";
                */
                //PREENCHE A LABEL EM DADOS CADASTRAIS DE PROJETO

                if (Session["IDprojeto"] != null)
                {
                    proj_produto_label_id.Text = "ID: " + Session["IDprojeto"].ToString();
                }
                else
                { proj_produto_label_id.Text = ""; }
            }
        }

        /* ATUALIZAÇÃO DE PROJETO ------------- ABA PRODUTO */
        
        protected void Button24_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string compddl = "0";
                string valida = "null";
                string erro = "nao";
                string idempresa = Request.Form[id_empresa.UniqueID];
                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@id_empresa", int.Parse(idempresa));
                com.Parameters.AddWithValue("@nome", proj_produto_textnome.Text);
                if (proj_produto_dropsegmento.SelectedValue != "0")
                { com.Parameters.AddWithValue("@segmento", int.Parse(proj_produto_dropsegmento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@segmento", null); }
                if ((proj_produto_droparea.SelectedValue != "0") && (proj_produto_droparea.SelectedValue != ""))
                { com.Parameters.AddWithValue("@area", int.Parse(proj_produto_droparea.SelectedValue)); }
                else { com.Parameters.AddWithValue("@area", null); }
                if ((proj_produto_dropsubdivisao.SelectedValue != "0") && (proj_produto_dropsubdivisao.SelectedValue != ""))
                { com.Parameters.AddWithValue("@subdivisao", int.Parse(proj_produto_dropsubdivisao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@subdivisao", null); }
                if (proj_produto_dropcargo.SelectedValue != "0")
                { com.Parameters.AddWithValue("@cargo", int.Parse(proj_produto_dropcargo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@cargo", null); }
                if (proj_produto_droptipo.SelectedValue != "0")
                { com.Parameters.AddWithValue("@tipo_produto", int.Parse(proj_produto_droptipo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@tipo_produto", null); }
                if (proj_produto_dropcaptacao.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_captacao", int.Parse(proj_produto_dropcaptacao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@responsavel_captacao", null); }
                if (proj_produto_dropentrega.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_entrega", int.Parse(proj_produto_dropentrega.SelectedValue)); }
                else { com.Parameters.AddWithValue("@responsavel_entrega", null); }
                if (proj_produto_dropresponsavel.SelectedValue != "0")
                { com.Parameters.AddWithValue("@colaborador_responsavel", int.Parse(proj_produto_dropresponsavel.SelectedValue)); }
                else { com.Parameters.AddWithValue("@colaborador_responsavel", null); }
                if (proj_produto_drop_requisitante.SelectedValue != "0")
                { com.Parameters.AddWithValue("@requisitante", int.Parse(proj_produto_drop_requisitante.SelectedValue)); }
                else { com.Parameters.AddWithValue("@requisitante", null); }
                if (proj_produto_drop_rh.SelectedValue != "0")
                { com.Parameters.AddWithValue("@rh", int.Parse(proj_produto_drop_rh.SelectedValue)); }
                else { com.Parameters.AddWithValue("@rh", null); }
                if (proj_dadoscadastrais_estado.SelectedValue != "0")
                { com.Parameters.AddWithValue("@id_estado", proj_dadoscadastrais_estado.SelectedValue); }
                else { com.Parameters.AddWithValue("@id_estado", null); }
                if (proj_dadoscadastrais_dropcidade.SelectedValue != "0")
                { com.Parameters.AddWithValue("@id_cidade", proj_dadoscadastrais_dropcidade.SelectedValue); }
                else { com.Parameters.AddWithValue("@id_cidade", null); }
                if (proj_produto_dt_prevista_shortlist.Text != "")
                {
                    string valor = proj_produto_dt_prevista_shortlist.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(2, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@shortlist_prevista", data);
                    }
                    else { erro = "sim"; }
                }
                else
                {
                    com.Parameters.AddWithValue("@shortlist_prevista", null);
                }
                if (proj_produto_dt_entrega_shortlist.Text != "")
                {
                    string valor = proj_produto_dt_entrega_shortlist.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(2, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@shortlist_entrega", data);
                    }
                    else { erro = "sim"; }
                }
                else
                {
                    com.Parameters.AddWithValue("@shortlist_entrega", null);
                }
                if (proj_produto_dt_inicio_busca.Text != "")
                {
                    string valor = proj_produto_dt_inicio_busca.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(2, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@busca_inicio", data);
                    }
                    else { erro = "sim"; }
                }
                else
                {
                    com.Parameters.AddWithValue("@busca_inicio", null);
                }
                if (proj_produto_quantidade_candidatos.Text != "")
                { com.Parameters.AddWithValue("@shortlist_qtd_cand", int.Parse(proj_produto_quantidade_candidatos.Text)); }
                else { com.Parameters.AddWithValue("@shortlist_qtd_cand", null); }
                if (proj_produto_dropnivel.SelectedValue != "0")
                { com.Parameters.AddWithValue("@grau_dificuldade", int.Parse(proj_produto_dropnivel.SelectedValue)); }
                else { com.Parameters.AddWithValue("@grau_dificuldade", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        if (proj_produto_textnome.Text.ToString() != comp)
                        {
                            if ((proj_produto_droptipo.SelectedValue.ToString()) != compddl && (erro != "sim"))
                            {
                                com.ExecuteNonQuery();
                                exibe_mensagem_projeto(1, "cadastro feito com sucesso!");
                            }
                            else
                            {
                                exibe_mensagem_projeto(1, "cadastro feito sem sucesso!");
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                            }
                        }
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(1, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* INSERÇÃO DE CONCORRENTES ------------- ABA PRODUTO */

        protected void Button2_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";                
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";
                string idempresa = Request.Form[id_proj_concorrente.UniqueID];
                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_concorrentes", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (idempresa != "")
                {
                    com.Parameters.AddWithValue("@concorrentes", int.Parse(idempresa));
                }
                else { com.Parameters.AddWithValue("@concorrentes", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        if (proj_produto_textconcorrentes.Text.ToString() != compddl)
                        {
                            com.ExecuteNonQuery();
                            proj_produto_listaconcorrentes.DataBind();
                            proj_produto_textconcorrentes.Text = "";
                        }
                    }
                    else
                    {
                        exibe_mensagem_projeto(1, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(1, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* CADASTRO DE IDIOMAS ----------------- ABA REQUISITOS */
        
        protected void Button3_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";
                string idempresa = Request.Form[id_empresa.UniqueID];                             
                
                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_idiomas", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (proj_requisitos_dropidiomas.SelectedValue != "0")
                { com.Parameters.AddWithValue("@idioma", int.Parse(proj_requisitos_dropidiomas.SelectedValue)); }
                else { com.Parameters.AddWithValue("@idioma", null); }
                if (proj_requisitos_dropnivel.SelectedValue != "0")
                { com.Parameters.AddWithValue("@nvl_idioma", int.Parse(proj_requisitos_dropnivel.SelectedValue)); }
                else { com.Parameters.AddWithValue("@nvl_idioma", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (proj_requisitos_dropidiomas.SelectedValue.ToString() != compddl) && (proj_requisitos_dropnivel.SelectedValue.ToString() != compddl))
                        { com.ExecuteNonQuery();
                          grid_idiomas.DataBind();
                          exibe_mensagem_projeto(2, "cadastro feito com sucesso!");
                          //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* CADASTRO DE GRADUAÇÃO ----------------- ABA REQUISITOS */

        protected void Button4_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                string idgraduacao = Request.Form[id_graduacao.UniqueID];
                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_graduacao", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if ((idgraduacao != null) && (idgraduacao != ""))
                {
                    com.Parameters.AddWithValue("@graduacao", int.Parse(idgraduacao));
                }
                else { com.Parameters.AddWithValue("@graduacao", null); }
                com.Parameters.AddWithValue("@nvl_graduacao", int.Parse(proj_radio_nvl_graduacao.SelectedValue).ToString());
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if ((idgraduacao != comp) && (idgraduacao != null))
                        {
                            if (proj_radio_nvl_graduacao.SelectedValue != "1" || proj_radio_nvl_graduacao.SelectedValue != "2")
                                if (idgraduacao == "")
                                {
                                    exibe_mensagem_projeto(2, "escolha uma graduação da lista!");
                                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma graduação da lista!')");
                                }
                                else
                                {
                                    string sqll = "Select descricao from br_graduacao where " + @idgraduacao + "= id";
                                    SqlDataAdapter daa = new SqlDataAdapter(sqll, conexao);
                                    DataTable dt = new DataTable();
                                    daa.Fill(dt);
                                    string hidenfield = "";
                                    hidenfield = dt.Rows[0]["descricao"].ToString();
                                    if (proj_requisitos_textgraduacao.Text == hidenfield)
                                    {
                                        com.ExecuteNonQuery();
                                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                                        grid_graduacao.DataBind();
                                        id_graduacao.Value = "";
                                        valida = rowCount.Value.ToString();
                                    }
                                    else 
                                    {
                                        exibe_mensagem_projeto(2, "escolha uma empresa da lista ou cadastre uma nova!");
                                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa da lista ou cadastre uma nova!')"); 
                                    }
                                }
                        }
                        else 
                        {
                            exibe_mensagem_projeto(2, "escolha uma graduação da lista!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma graduação da lista!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* CADASTRO DE REQUISITOS ----------------- ABA REQUISITOS */

        protected void Button25_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                //string compddl = "0";
                string valida = "null";
                //float textsalario = 0;
                //float bonus = 0;
                string salario_anterior = proj_requisitos_textsalario.Text;
                string salario = "";
                float salario_teste = 0;
                float totalcash = 0;
                string bonus_replace = "";
                if (proj_requisitos_textsalario.Text != "")
                {
                    salario = salario_anterior.Replace(".", "");
                    salario = salario.Replace(",", ".");
                    //if (proj_requisitos_textsalario.Text != "")
                    //{ textsalario = float.Parse(proj_requisitos_textsalario.Text); }
                    salario_teste = float.Parse(salario.ToString());
                    /*if (proj_requisitos_textbonus.Text != "")
                    { bonus = float.Parse(proj_requisitos_textbonus.Text); }
                    totalcash = (salario_teste * 12) + (salario_teste * bonus);*/
                    //string totalcash_teste = totalcash.ToString();
                    //totalcash_teste = totalcash_teste.Remove(totalcash_teste.Length - 2, 2);
                    //totalcash = float.Parse(totalcash_teste);
                    bonus_replace = proj_requisitos_textbonus.Text;
                    bonus_replace = bonus_replace.Replace(",", ".");
                }
                string valor_salario_ini = proj_requisitos_textsalario_ini.Text;
                string salario_ini = valor_salario_ini.Replace(".", "");
                salario_ini = salario_ini.Replace(",", ".");
                string valor_salario_fim = proj_requisitos_textsalario_fim.Text;
                string salario_fim = valor_salario_fim.Replace(".", "");
                salario_fim = salario_fim.Replace(",", ".");
                //string total_cash = totalcash.ToString();
                //total_cash = total_cash.Replace(",", ".");                

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_requisitos", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (proj_requisitos_textsalario_ini.Text != "")
                { com.Parameters.AddWithValue("@salario_ini", float.Parse(salario_ini)); }
                else
                { com.Parameters.AddWithValue("@salario_ini", null); }
                if (proj_requisitos_textsalario_fim.Text != "")
                { com.Parameters.AddWithValue("@salario_fim", float.Parse(salario_fim)); }
                else
                { com.Parameters.AddWithValue("@salario_fim", null); }
                //if (proj_requisitos_modelocontrato.SelectedValue != "5")
                //{ com.Parameters.AddWithValue("@tp_contrato", int.Parse(proj_requisitos_modelocontrato.SelectedValue.ToString())); }
                //else { com.Parameters.AddWithValue("@tp_contrato", 5); }
                if (proj_requisitos_texttamanhoequipe.Text != "")
                { com.Parameters.AddWithValue("@tamanho_equipe", int.Parse(proj_requisitos_texttamanhoequipe.Text)); }
                else { com.Parameters.AddWithValue("@tamanho_equipe", null); }
                if (proj_requisitos_textexperiencia.Text != "")
                { com.Parameters.AddWithValue("@experiencia", int.Parse(proj_requisitos_textexperiencia.Text)); }
                else { com.Parameters.AddWithValue("@experiencia", null); }
                if (proj_requisitos_dropescolaridade.SelectedValue != "0")
                { com.Parameters.AddWithValue("@escolaridade", int.Parse(proj_requisitos_dropescolaridade.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@escolaridade", null); }
                if (proj_requisitos_dropsuperiorimediato.SelectedValue != "0")
                { com.Parameters.AddWithValue("@superior_imediato", int.Parse(proj_requisitos_dropsuperiorimediato.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@superior_imediato", null); }
                //if (proj_requisitos_textsalario.Text != "")
                //{ com.Parameters.AddWithValue("@salario_mensal", float.Parse(salario)); }
                //else { com.Parameters.AddWithValue("@salario_mensal", null); }
                //if (proj_requisitos_textbonus.Text != "")
                //{ com.Parameters.AddWithValue("@bonus", float.Parse(bonus_replace)); }
                //else { com.Parameters.AddWithValue("@bonus", null); }
                //com.Parameters.AddWithValue("@total_cash", float.Parse(total_cash));
                //com.Parameters.AddWithValue("@total_cash", totalcash);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (proj_requisitos_dropescolaridade.SelectedIndex != 0))
                    { 
                        com.ExecuteNonQuery();
                        proj_requisitos_totalcash.Text = totalcash.ToString();
                        exibe_mensagem_projeto(2, "cadastro feito com sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                    }
                    else
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* ATUALIZAÇÃO DE REQUISITOS ----------------- ABA REQUISITOS */

        protected void Button26_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";
                //float textsalario = 0;
                //float bonus = 0;
                string salario_anterior = proj_requisitos_textsalario.Text;
                string salario = "";
                float salario_teste = 0;
                float totalcash = 0;
                string bonus_replace = "";
                if (proj_requisitos_textsalario.Text != "")
                {
                    salario = salario_anterior.Replace(".", "");
                    salario = salario.Replace(",", ".");
                    //if (proj_requisitos_textsalario.Text != "")
                    //{ textsalario = float.Parse(proj_requisitos_textsalario.Text); }
                    salario_teste = float.Parse(salario.ToString());
                    /*if (proj_requisitos_textbonus.Text != "")
                    { bonus = float.Parse(proj_requisitos_textbonus.Text); }
                    totalcash = (salario_teste * 12) + (salario_teste * bonus);*/
                    //string totalcash_teste = totalcash.ToString();
                    //totalcash_teste = totalcash_teste.Remove(totalcash_teste.Length - 2, 2);
                    //totalcash = float.Parse(totalcash_teste);
                    bonus_replace = proj_requisitos_textbonus.Text;
                    bonus_replace = bonus_replace.Replace(",", ".");
                }
                string valor_salario_ini = proj_requisitos_textsalario_ini.Text;
                string salario_ini = valor_salario_ini.Replace(".", "");
                salario_ini = salario_ini.Replace(",", ".");
                string valor_salario_fim = proj_requisitos_textsalario_fim.Text;
                string salario_fim = valor_salario_fim.Replace(".", "");
                salario_fim = salario_fim.Replace(",", ".");
                //string total_cash = totalcash.ToString();
                //total_cash = total_cash.Replace(",", ".");                

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_requisitos", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (proj_requisitos_textsalario_ini.Text != "")
                { com.Parameters.AddWithValue("@salario_ini", float.Parse(salario_ini)); }
                else
                { com.Parameters.AddWithValue("@salario_ini", null); }
                if (proj_requisitos_textsalario_fim.Text != "")
                { com.Parameters.AddWithValue("@salario_fim", float.Parse(salario_fim)); }
                else
                { com.Parameters.AddWithValue("@salario_fim", null); }
                //if (proj_requisitos_modelocontrato.SelectedValue != "5")
                //{ com.Parameters.AddWithValue("@tp_contrato", int.Parse(proj_requisitos_modelocontrato.SelectedValue.ToString())); }
                //else { com.Parameters.AddWithValue("@tp_contrato", 5); }
                if (proj_requisitos_texttamanhoequipe.Text != "")
                { com.Parameters.AddWithValue("@tamanho_equipe", int.Parse(proj_requisitos_texttamanhoequipe.Text)); }
                else { com.Parameters.AddWithValue("@tamanho_equipe", null); }
                if (proj_requisitos_textexperiencia.Text != "")
                { com.Parameters.AddWithValue("@experiencia", int.Parse(proj_requisitos_textexperiencia.Text)); }
                else { com.Parameters.AddWithValue("@experiencia", null); }
                if (proj_requisitos_dropescolaridade.SelectedValue != "0")
                { com.Parameters.AddWithValue("@escolaridade", int.Parse(proj_requisitos_dropescolaridade.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@escolaridade", null); }
                if (proj_requisitos_dropsuperiorimediato.SelectedValue != "0")
                { com.Parameters.AddWithValue("@superior_imediato", int.Parse(proj_requisitos_dropsuperiorimediato.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@superior_imediato", null); }
                //if (proj_requisitos_textsalario.Text != "")
                //{ com.Parameters.AddWithValue("@salario_mensal", float.Parse(salario)); }
                //else { com.Parameters.AddWithValue("@salario_mensal", null); }
                //if (proj_requisitos_textbonus.Text != "")
                //{ com.Parameters.AddWithValue("@bonus", float.Parse(bonus_replace)); }
                //else { com.Parameters.AddWithValue("@bonus", null); }
                //com.Parameters.AddWithValue("@total_cash", float.Parse(total_cash));
                //com.Parameters.AddWithValue("@total_cash", totalcash);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (proj_requisitos_dropescolaridade.SelectedValue.ToString() != compddl)
                        {
                            com.ExecuteNonQuery();
                            proj_requisitos_totalcash.Text = totalcash.ToString();
                            exibe_mensagem_projeto(2, "cadastro feito com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* INSERÇÃO DE DESCRIÇÃO ----------------- ABA SITE */

        protected void Button7_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                
                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_site", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@descricao", proj_site_descricao.Text);
                com.Parameters.AddWithValue("@resumo", proj_site_resumo.Text);
                com.Parameters.AddWithValue("@mostrar", int.Parse(radio_mostrarnosite.SelectedValue));
                com.Parameters.AddWithValue("@titulo", proj_site_titulo.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (proj_site_titulo.Text != comp) && (proj_site_descricao.Text != comp))
                    { 
                        com.ExecuteNonQuery();
                        exibe_mensagem_projeto(3, "cadastro feito com sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                    }
                    else
                    {
                        exibe_mensagem_projeto(3, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(3, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* ATUALIZAÇÃO DE DESCRIÇÃO ----------------- ABA SITE */

        protected void Button6_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
               
                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_site", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@descricao", proj_site_descricao.Text);
                com.Parameters.AddWithValue("@resumo", proj_site_resumo.Text);
                com.Parameters.AddWithValue("@mostrar", int.Parse(radio_mostrarnosite.SelectedValue));
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    if (proj_site_descricao.Text != comp)
                    { 
                        com.ExecuteNonQuery();
                        exibe_mensagem_projeto(3, "cadastro feito com sucesso!");
                    }
                    else
                    {
                        exibe_mensagem_projeto(3, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(3, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_projeto(3, "cadastro feito com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }
            }
        }

        /* INSERÇÃO DE STATUS ----------------- ABA HAVIK */
        
        protected void Button8_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_status", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (proj_havik_dropstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_status", int.Parse(proj_havik_dropstatus.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@id_status", null); }
                if ((proj_havik_dropsubstatus.SelectedValue != "0") && (proj_havik_dropsubstatus.SelectedValue != "") && (proj_havik_dropsubstatus.SelectedIndex != 0))
                { com.Parameters.AddWithValue("@id_substatus", int.Parse(proj_havik_dropsubstatus.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@id_substatus", null); }
                com.Parameters.AddWithValue("@obs", proj_havik_textobservacoes.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (proj_havik_dropstatus.SelectedValue.ToString() != compddl) && (proj_havik_dropstatus.SelectedValue.ToString() != null) && (proj_havik_dropstatus.SelectedIndex != 0))
                        { 
                            com.ExecuteNonQuery();
                            proj_grid_status.DataBind();
                            proj_havik_dropstatus.SelectedIndex = 0;
                            proj_havik_dropsubstatus.DataBind();
                            proj_havik_textobservacoes.Text = "";

                            int id_projeto_retorno = int.Parse(Session["IDprojeto"].ToString());

                            SqlCommand retorno = new SqlCommand("sp_retorno_projeto", con);
                            retorno.CommandType = CommandType.StoredProcedure;

                            retorno.Parameters.AddWithValue("@id_projeto", id_projeto_retorno);



                            SqlDataAdapter daa = new SqlDataAdapter(retorno);
                            //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                            //Array teste = da.GetFillParameters();  
                            //da.Fill(dt_busca);
                            daa.Fill(retorno_projeto_grid);
                            Session["retorno_projeto"] = retorno_projeto_grid;
                            Session["recarrega_dados"] = "1";
                            exibe_mensagem_projeto(5, "status registrado com sucesso!");
                        }
                    else
                    {
                        exibe_mensagem_projeto(5, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(5, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* INSERÇÃO DE OBSERVAÇÕES ----------------- ABA OBSERVAÇÕES */

        protected void Button19_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_obs", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@obs", proj_observacoes_textobservacoes.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    if (proj_observacoes_textobservacoes.Text != comp)
                    { 
                        com.ExecuteNonQuery();
                        proj_gridobs.DataBind();
                        exibe_mensagem_projeto(6, "cadastro feito com sucesso!");
                    }
                    else
                    {
                        exibe_mensagem_projeto(6, "status registrado sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(6, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        /* LIMPEZA DE OBSERVAÇÕES ----------------- ABA OBSERVAÇÕES */
        
        protected void Button20_Click(object sender, EventArgs e)
        {
            proj_observacoes_textobservacoes.Text = "";
        }

        /* PREENCHIMENTO DO CAMPO DE OBSERVAÇÕES ANTERIORES ------------------ ABA OBSERVAÇÕES */

        protected void proj_gridobs_SelectedIndexChanged(object sender, EventArgs e)
        {
            proj_observacoes_textobservacoes.Text = proj_gridobs.DataKeys[proj_gridobs.SelectedIndex].Value.ToString();
            proj_gridobs.DataBind();
        }

        /* CADASTRO DE DADOS FINANCEIROS ------------------ ABA FINANCEIRO */

        protected void Button27_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                int erro = 0;
                //string comp = "";
                string valida = "null";
                string idcandidato = Request.Form[id_candidato.UniqueID];
                //retainer = retainer.Replace(",", ".");
                //sucesso = sucesso.Replace(",", ".");
                string salario_ini_antigo = proj_financeiro_textsalarioinicial.Text;
                string salario_ini = salario_ini_antigo.Replace(".", "");
                salario_ini = salario_ini.Replace(",", ".");
                string salario_fim_antigo = proj_financeiro_textsalariofinal.Text;
                string salario_fim = salario_fim_antigo.Replace(".", "");
                salario_fim = salario_fim.Replace(",", ".");
                string fee_antigo = adm_text_fee.Text;
                string fee = fee_antigo.Replace(".", "");
                fee = fee.Replace(",", ".");

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_financeiro_atual", con);
                com.CommandType = CommandType.StoredProcedure;

                if ((proj_fin_id_linha.Value != null) && (proj_fin_id_linha.Value != "")) //@id_linha é o id referente à ação
                {
                    com.Parameters.AddWithValue("@id_linha", int.Parse(proj_fin_id_linha.Value));
                }
                else { com.Parameters.AddWithValue("@id_linha", null); }
                if (id_projeto != 0)
                { com.Parameters.AddWithValue("@id_projeto", id_projeto); }
                if ((id_candidato.Value != "") && (id_candidato.Value != null))
                { com.Parameters.AddWithValue("@id_cliente", int.Parse(id_candidato.Value)); }
                else { com.Parameters.AddWithValue("@id_cliente", null); }//FALTA TESTAR!!!
                if (proj_financeiro_textemailfatura.Text != "")
                { com.Parameters.AddWithValue("@email_fatura", proj_financeiro_textemailfatura.Text); }
                else { com.Parameters.AddWithValue("@email_fatura", null); }
                if (proj_financeiro_textparticularidades.Text != "")
                { com.Parameters.AddWithValue("@particularidade", proj_financeiro_textparticularidades.Text); }
                else { com.Parameters.AddWithValue("@particularidade", null); }
                if (proj_financeiro_dropdacao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@acao", int.Parse(proj_financeiro_dropdacao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@acao", null); }
                com.Parameters.AddWithValue("@parcelas", null);
                if (proj_financeiro_dropfaturar.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@faturar", int.Parse(proj_financeiro_dropfaturar.SelectedValue)); }
                else { com.Parameters.AddWithValue("@faturar", null); }
                if (adm_text_vencimento.Text != "")
                {
                    string valor_ini = adm_text_vencimento.Text;
                    //string conversao = valor_ini.Substring(0, 2) + "/" + valor_ini.Substring(2, 2) + "/" + valor_ini.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor_ini.Substring(0, 2).ToString());
                    mes = int.Parse(valor_ini.Substring(3, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data_ini = Convert.ToDateTime(valor_ini, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@vencimento", data_ini);
                    }
                }
                else
                {
                    if (adm_text_vencimento.Text == "")
                    {
                        erro = 1;
                        com.Parameters.AddWithValue("@vencimento", null);
                    }
                    else { erro = 1; }
                }
                if (adm_text_fee.Text != "")
                { com.Parameters.AddWithValue("@fee", fee); }
                else { com.Parameters.AddWithValue("@fee", null); }
                if (proj_financeiro_dropimpostos.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@imposto", int.Parse(proj_financeiro_dropimpostos.SelectedValue)); }
                else { com.Parameters.AddWithValue("@imposto", null); }
                //if (proj_radio_modopagamento.SelectedIndex != 0)
                com.Parameters.AddWithValue("@modo_pag", null);
                //else { com.Parameters.AddWithValue("@modo_pag", null); }
                //if (proj_radio_cobrarimpostos.SelectedValue != "0")
                //{ com.Parameters.AddWithValue("@imposto", proj_radio_cobrarimpostos.SelectedValue); }
                //else { com.Parameters.AddWithValue("@imposto", null); }
                //if (proj_financeiro_dropvencimento.SelectedValue != "0")
                //{ com.Parameters.AddWithValue("@vencimento", proj_financeiro_dropvencimento.SelectedValue); }
                //else { com.Parameters.AddWithValue("@vencimento", null); }
                //if (proj_financeiro_textsalarioinicial.Text != "")
                //{ com.Parameters.AddWithValue("@salario_ini", salario_ini); }
                //else { com.Parameters.AddWithValue("@salario_ini", null); }
                if (proj_financeiro_textsalarioinicial.Text != "")
                { com.Parameters.AddWithValue("@base_fat", salario_ini); }
                else { com.Parameters.AddWithValue("@base_fat", null); }
                if (proj_financeiro_textsalariofinal.Text != "")
                { com.Parameters.AddWithValue("@sal_final", salario_fim); }
                else { com.Parameters.AddWithValue("@sal_final", null); }
                if (adm_text_porcentagem.Text != "")
                {
                    string conversor_porcentagem = adm_text_porcentagem.Text;
                    //conversor_porcentagem = conversor_porcentagem.Replace(",", ".");
                    com.Parameters.AddWithValue("@percentual", float.Parse(conversor_porcentagem));                 
                }
                else { com.Parameters.AddWithValue("@percentual", null); }
                if (proj_financeiro_textsegundaparcela.Text.Length > 0)
                {
                    if ((proj_financeiro_textsegundaparcela.Text.Substring((proj_financeiro_textsegundaparcela.Text.Length - 2)) != ",")
                       && (proj_financeiro_textsegundaparcela.Text != ""))
                    {
                        string conversor_salario = proj_financeiro_textsegundaparcela.Text;
                        //conversor_salario = conversor_salario.Replace(".", "");
                        //conversor_salario = conversor_salario.Replace(",", ".");
                        com.Parameters.AddWithValue("@valor_total", float.Parse(conversor_salario));
                    }
                }
                else { com.Parameters.AddWithValue("@valor_total", null); }
                if (proj_financeiro_text_valor_fatura.Text.Length > 0)
                {
                    if ((proj_financeiro_text_valor_fatura.Text.Substring((proj_financeiro_text_valor_fatura.Text.Length - 2)) != ",")
                    && (proj_financeiro_text_valor_fatura.Text != ""))
                    {
                        string conversor_salario = proj_financeiro_text_valor_fatura.Text;
                        //conversor_salario = conversor_salario.Replace(".", "");
                        //conversor_salario = conversor_salario.Replace(",", ".");
                        com.Parameters.AddWithValue("@valor_fatura", float.Parse(conversor_salario));
                    }
                }
                else { com.Parameters.AddWithValue("@valor_fatura", null); }
                if (proj_financeiro_texts_fatura_impostos.Text.Length > 0)
                {
                    if ((proj_financeiro_texts_fatura_impostos.Text.Substring((proj_financeiro_texts_fatura_impostos.Text.Length - 2)) != ",")
                    && (proj_financeiro_texts_fatura_impostos.Text != ""))
                    {
                        string conversor_salario = proj_financeiro_texts_fatura_impostos.Text;
                        //conversor_salario = conversor_salario.Replace(".", "");
                        //conversor_salario = conversor_salario.Replace(",", ".");
                        com.Parameters.AddWithValue("@valor_fat_imposto", float.Parse(conversor_salario));
                    }
                }
                else { com.Parameters.AddWithValue("@valor_fat_imposto", null); }

                if ((adm_text_porcentagem.Text != "") && (proj_financeiro_textsegundaparcela.Text != ""))
                {
                    string conversor_salario = proj_financeiro_textsegundaparcela.Text;
                    string conversor_porcentagem = adm_text_porcentagem.Text;
                    //conversor_porcentagem = conversor_porcentagem.Replace(",", ".");
                    float porcentagem = float.Parse(conversor_porcentagem) / 100;
                    //conversor_salario = conversor_salario.Replace(".", "");
                    //conversor_salario = conversor_salario.Replace(",", ".");                    
                    com.Parameters.AddWithValue("@acumulado", (float.Parse(conversor_salario) * porcentagem));
                }
                else { com.Parameters.AddWithValue("@acumulado", 0); }

                com.Parameters.AddWithValue("@usuario", id_usuario);
                com.Parameters.AddWithValue("@usuario_alt", id_usuario);
                if (adm_text_multiplicador.Text != "")
                {
                    string conversor = adm_text_multiplicador.Text;
                    //conversor = conversor.Replace(",", ".");
                    com.Parameters.AddWithValue("@mult_salario", float.Parse(conversor)); 
                }
                else { com.Parameters.AddWithValue("@mult_salario", null); }
                if (proj_financeiro_dropembutirimposto.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@embutir", int.Parse(proj_financeiro_dropembutirimposto.SelectedValue)); }
                else { com.Parameters.AddWithValue("@embutir", null); }

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                
                float percentual_projeto = 0;

                if ((Session["soma_notas"].ToString() != "") && (Session["soma_notas"] != null))
                { percentual_projeto = float.Parse(Session["soma_notas"].ToString()); }
                float valida_total = 0;
                if (proj_financeiro_text_valor_fatura.Text != "")
                { valida_total = percentual_projeto + float.Parse(proj_financeiro_text_valor_fatura.Text); }
                else { valida_total = percentual_projeto; }
                float valor_total_projeto = 0;
                if (proj_financeiro_textsegundaparcela.Text != "")
                { 
                    valor_total_projeto = float.Parse(proj_financeiro_textsegundaparcela.Text); 
                }
                string converte = "";
                converte = valida_total.ToString();
                decimal valida_total_dec = decimal.Parse(converte);
                converte = valor_total_projeto.ToString();
                decimal valor_total_projeto_dec = decimal.Parse(converte);

                try
                {
                    if ((valida != sessao) && (id_usuario == int.Parse(proj_produto_dropentrega.SelectedValue.ToString())))
                            //if (idcandidato == "")
                            {
                                if (proj_financeiro_dropdacao.SelectedIndex != 0)
                                {
                                    if ((valida_total_dec <= valor_total_projeto_dec) || (proj_financeiro_dropdacao.SelectedValue == "5"))
                                    {
                                        if ((proj_fin_id_faturar.Value != "1") && (proj_fin_ativo.Value == "1"))
                                        {
                                            if (((percentual_projeto != 0) && (proj_financeiro_dropdacao.SelectedValue == "4")) || ((proj_financeiro_dropdacao.SelectedValue != "4")))
                                            {
                                                //REGISTRO DE FATURA QUE NECESSITA DE CÁLCULOS PARA ENVIO (RETAINER, SUCESSO, PLACEMENT)
                                                if ((adm_text_porcentagem.Text != "") && (proj_financeiro_texts_fatura_impostos.Text != "") &&
                                                    (proj_financeiro_text_valor_fatura.Text != "") && ((proj_financeiro_textsegundaparcela.Text != "") ||
                                                    (proj_financeiro_textsalarioinicial.Text != "")) && (adm_text_fee.Text != "") &&
                                                    (proj_financeiro_dropimpostos.SelectedIndex != 0) && (proj_financeiro_dropembutirimposto.SelectedIndex != 0))
                                                {
                                                    com.ExecuteNonQuery();
                                                    valida = rowCount.Value.ToString();
                                                    proj_fin_grid_financeiro.DataBind();
                                                    proj_financeiro_dropdacao.SelectedIndex = 0;
                                                    proj_financeiro_dropfaturar.SelectedIndex = 0;
                                                    adm_text_porcentagem.Text = "";
                                                    proj_financeiro_texts_fatura_impostos.Text = "";
                                                    proj_financeiro_text_valor_fatura.Text = "";
                                                    proj_financeiro_textsegundaparcela.Text = "";
                                                    proj_financeiro_textsalarioinicial.Text = "";
                                                    proj_financeiro_textsalariofinal.Text = "";
                                                    adm_text_vencimento.Text = "";
                                                    adm_text_fee.Text = "";
                                                    proj_financeiro_dropimpostos.SelectedIndex = 0;
                                                    proj_fin_id_faturar.Value = null;
                                                    proj_fin_id_linha.Value = null;
                                                    exibe_mensagem_projeto(7, "cadastro feito com sucesso!");
                                                }
                                                else
                                                { exibe_mensagem_projeto(7, "favor preencher os campos e efetuar os cálculos para o registro da fatura!"); }
                                                //REGISTRO DE DESPESAS
                                                if (proj_financeiro_dropdacao.SelectedValue == "5")
                                                {
                                                    com.ExecuteNonQuery();
                                                    valida = rowCount.Value.ToString();
                                                    proj_fin_grid_financeiro.DataBind();
                                                    proj_financeiro_dropdacao.SelectedIndex = 0;
                                                    proj_financeiro_dropfaturar.SelectedIndex = 0;
                                                    adm_text_porcentagem.Text = "";
                                                    proj_financeiro_texts_fatura_impostos.Text = "";
                                                    proj_financeiro_text_valor_fatura.Text = "";
                                                    proj_financeiro_textsegundaparcela.Text = "";
                                                    proj_financeiro_textsalarioinicial.Text = "";
                                                    proj_financeiro_textsalariofinal.Text = "";
                                                    adm_text_vencimento.Text = "";
                                                    adm_text_fee.Text = "";
                                                    adm_text_multiplicador.Text = "";
                                                    proj_financeiro_dropimpostos.SelectedIndex = 0;
                                                    proj_fin_id_faturar.Value = null;
                                                    proj_fin_id_linha.Value = null;
                                                    exibe_mensagem_projeto(7, "cadastro feito com sucesso!");
                                                }
                                            }
                                            else { exibe_mensagem_projeto(7, "não é possível cadastrar um placement sem ter um retainer registrado!"); }
                                        }
                                        else { exibe_mensagem_projeto(7, "não é possível cadastrar/alterar uma nota enviada para faturamento ou ação inativa!"); }
                                    }
                                    else { exibe_mensagem_projeto(7, "percentual de valor acima do total permitido no projeto, favor verificar se projeto já foi fechado ou se o total percentual ultrapassou 100%!"); }
                                }
                                else { exibe_mensagem_projeto(7, "favor escolher uma ação!"); }
                            }
                            else
                            {
                                exibe_mensagem_projeto(7, "você não tem permissão para efetuar a operação neste projeto!");                                    
                            }
                            
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(7, "cadastro feito sem sucesso!");                        
                    }
                }
            }
        }

        /* CADASTRO DE DESPESAS ------------------ ABA FINANCEIRO */

        protected void Button21_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";
                string salario_valor = "";

                if (proj_financeiro_textvalor.Text != "")
                {
                    salario_valor = proj_financeiro_textvalor.Text.Replace(".", "");
                    salario_valor = salario_valor.Replace(",", ".");
                }

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_fin_despesas", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (proj_financeiro_dropdespesas.SelectedValue != "0")
                { com.Parameters.AddWithValue("@id_despesa", int.Parse(proj_financeiro_dropdespesas.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_despesa", null); }
                if (proj_financeiro_textvalor.Text != "")
                { com.Parameters.AddWithValue("@vl_despesa", float.Parse(salario_valor)); }
                else { com.Parameters.AddWithValue("@vl_despesa", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (proj_financeiro_dropdespesas.SelectedValue != compddl))
                    {
                        com.ExecuteNonQuery();
                        proj_financeiro_griddespesas.DataBind();
                        exibe_mensagem_projeto(7, "cadastro feito com sucesso!");
                    }
                    else
                    {
                        exibe_mensagem_projeto(7, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(7, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }
        
        /* CADASTRO DE BENEFICIOS ------------------ ABA REQUISITOS */

        protected void Button5_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                //string comp = "";
                string valida = "null";

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_beneficios", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        for (int count = 0; count < proj_requisitos_checkboxlist_beneficios.Items.Count; count++)
                        {
                            if (proj_requisitos_checkboxlist_beneficios.Items[count].Selected)
                            {
                                if (proj_requisitos_listbeneficios.Items.Count == 0)
                                {
                                    com.Parameters.AddWithValue("@beneficios", int.Parse(proj_requisitos_checkboxlist_beneficios.Items[count].Value));
                                    com.ExecuteNonQuery();
                                    com.Parameters.RemoveAt("@beneficios");
                                    //proj_requisitos_listbeneficios.DataBind();
                                }
                                else
                                {
                                    int insere = 0;
                                    for (int listcount = 0; listcount < (proj_requisitos_listbeneficios.Items.Count); listcount++)
                                    {                                        
                                        if (proj_requisitos_checkboxlist_beneficios.Items[count].Value == proj_requisitos_listbeneficios.Items[listcount].Value)
                                        {
                                            insere = 1;                                  
                                        }
                                    }
                                    if (insere == 0)
                                    {
                                        com.Parameters.AddWithValue("@beneficios", int.Parse(proj_requisitos_checkboxlist_beneficios.Items[count].Value));
                                        com.ExecuteNonQuery();
                                        com.Parameters.RemoveAt("@beneficios");
                                        proj_requisitos_listbeneficios.DataBind();
                                        exibe_mensagem_projeto(8, "cadastro feito com sucesso!");
                                    }
                                    //listcount = proj_requisitos_listbeneficios.Items.Count;
                                }
                            }
                          proj_requisitos_listbeneficios.DataBind();
                        }                        
                    }
                    else
                    {
                        exibe_mensagem_projeto(8, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(8, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        protected void limpa_campos_projeto ()
        {
            proj_produto_textnome.Text = "";
            proj_produto_empresa.Text = "";
            proj_produto_dropcargo.SelectedValue = "0";
            proj_dadoscadastrais_estado.SelectedValue = "0";
            proj_dadoscadastrais_dropcidade.DataBind();
            proj_produto_dt_inicio.Text = "";
            proj_produto_dt_fim.Text = "";
            proj_produto_drop_requisitante.SelectedValue = "0";
            proj_produto_drop_rh.SelectedValue = "0";
            proj_produto_list_req_tel.DataBind();
            proj_produto_list_req_email.DataBind();
            proj_produto_text_rh_tel.DataBind();
            proj_produto_list_rh_email.DataBind();
            proj_produto_droptipo.SelectedValue = "0";
            proj_produto_dropsegmento.SelectedValue = "0";
            proj_produto_droparea.DataBind();
            proj_produto_droparea.SelectedIndex = 0;
            proj_produto_dropsubdivisao.DataBind();
            proj_produto_dropsubdivisao.Items.Insert(0, "Escolha a opção");
            proj_produto_dropcaptacao.SelectedValue = "0";
            proj_produto_dropentrega.SelectedValue = "0";
            proj_produto_dropresponsavel.SelectedValue = "0";
            id_proj_concorrente.Value = null;
            proj_produto_textconcorrentes.Text = "";
            proj_produto_dt_inicio_busca.Text = "";
            proj_produto_dt_prevista_shortlist.Text = "";
            proj_produto_dt_entrega_shortlist.Text = "";
            proj_produto_quantidade_candidatos.Text = "";
            proj_produto_dropnivel.SelectedValue = "0";
            proj_produto_drop_equipe.SelectedIndex = 0;

            proj_requisitos_modelocontrato.SelectedValue = "5";
            proj_requisitos_texttamanhoequipe.Text = "";
            proj_requisitos_textexperiencia.Text = "";
            proj_requisitos_dropescolaridade.SelectedValue = "0";
            proj_requisitos_dropsuperiorimediato.SelectedValue = "0";
            proj_requisitos_textsalario.Text = "";
            proj_requisitos_textbonus.Text = "";
            proj_requisitos_totalcash.Text = "";
            proj_requisitos_textsalario_ini.Text = "";
            proj_requisitos_textsalario_fim.Text = "";
            proj_produto_nronovagas.Text = "";
            proj_produto_requisicao.Text = "";

            proj_financeiro_textcandidato.Text = "";
            proj_financeiro_textemailfatura.Text = "";
            proj_financeiro_textsegundaparcela.Text = "";
            proj_financeiro_textsalarioinicial.Text = "";
            proj_financeiro_textsalariofinal.Text = "";
            id_candidato.Value = null;
            proj_fin_id_linha.Value = null;
            adm_text_vencimento.Text = "";
            adm_text_fee.Text = "";
            proj_financeiro_dropdacao.SelectedIndex = 0;
            proj_financeiro_dropfaturar.SelectedIndex = 0;
            adm_text_porcentagem.Text = "";
            proj_financeiro_texts_fatura_impostos.Text = "";
            proj_financeiro_text_valor_fatura.Text = "";
            proj_financeiro_textsegundaparcela.Text = "";
            proj_financeiro_textsalarioinicial.Text = "";
            proj_financeiro_textsalariofinal.Text = "";
            adm_text_vencimento.Text = "";
            adm_text_fee.Text = "";
            proj_financeiro_dropembutirimposto.SelectedIndex = 0;
            adm_text_multiplicador.Text = "";

            Session["retorno_projeto"] = null;
            retorno_projeto.DataSource = Session["retorno_projeto"];
            retorno_projeto.DataBind();

            Session["label_modulo"] = "";
        }


        protected void grid_busca_projeto_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                //limpa os dados sem remover a sessão

                limpa_campos_projeto();

                Session["label_modulo"] = grid_busca_projeto.SelectedRow.Cells[1].Text.ToString();

                Session["IDprojeto"] = grid_busca_projeto.SelectedRow.Cells[1].Text.ToString();
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                //PREENCHE A LABEL EM DADOS CADASTRAIS DE PROJETO

                if (Session["IDprojeto"] != null)
                {
                    proj_produto_label_id.Text = "ID: " + Session["IDprojeto"].ToString();
                }
                else
                { proj_produto_label_id.Text = ""; }

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);

                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(retorno_grid_projeto);
                Session["retorno_projeto"] = retorno_grid_projeto;

                //APLICAÇÃO DO NEGRITO PARA A LINHA

                if (Session["grid_busca_projeto"] != null)
                {
                    grid_busca_projeto.DataSource = Session["grid_busca_projeto"];
                    grid_busca_projeto.DataBind();
                    foreach (GridViewRow row in grid_busca_projeto.Rows)
                    {
                        if (Session["IDprojeto"] != null)
                        {
                            if (Session["IDprojeto"].ToString() == grid_busca_projeto.DataKeys[row.RowIndex].Values["id_projeto"].ToString())
                            {
                                grid_busca_projeto.Rows[row.RowIndex].Font.Bold = true;
                            }
                        }
                    }
                }


                if (Session["retorno_projeto"] != null)
                {
                    retorno_projeto.DataSource = Session["retorno_projeto"];
                    retorno_projeto.DataBind();
                    if (retorno_projeto.Rows[0].Cells[1].Text != "&nbsp;")
                    {
                        Session["label_modulo"] = retorno_projeto.Rows[0].Cells[1].Text.ToString();
                        proj_produto_textnome.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[1].Text.ToString()); 
                    }
                    else { proj_produto_textnome.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[2].Text != "&nbsp;")
                    { proj_produto_empresa.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[2].Text); }
                    else { proj_produto_empresa.Text = ""; }
                    //proj_produto_dt_inicio.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[11].Text);
                    //proj_produto_dt_fim.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[5].Text);
                    if (retorno_projeto.Rows[0].Cells[7].Text == "&nbsp;")
                    { proj_produto_droptipo.SelectedValue = "0"; }
                    else { proj_produto_droptipo.SelectedValue = retorno_projeto.Rows[0].Cells[7].Text; }
                    if (retorno_projeto.Rows[0].Cells[3].Text == "&nbsp;")
                    { proj_produto_dropsegmento.SelectedValue = "0"; }
                    else { proj_produto_dropsegmento.SelectedValue = retorno_projeto.Rows[0].Cells[3].Text; }
                    if (retorno_projeto.Rows[0].Cells[4].Text == "&nbsp;")
                    { proj_produto_droparea.SelectedValue = "0"; }
                    else
                    {
                        proj_produto_droparea.SelectedValue = retorno_projeto.Rows[0].Cells[4].Text;
                        proj_produto_dropsubdivisao.DataBind();
                        proj_produto_dropsubdivisao.Items.Insert(0, "Escolha a opção");
                        if (retorno_projeto.Rows[0].Cells[5].Text == "&nbsp;")
                        { proj_produto_dropsubdivisao.SelectedIndex = 0; }
                        else { proj_produto_dropsubdivisao.SelectedValue = retorno_projeto.Rows[0].Cells[5].Text; }
                    }
                    if (retorno_projeto.Rows[0].Cells[6].Text == "&nbsp;")
                    { proj_produto_dropcargo.SelectedValue = "0"; }
                    else { proj_produto_dropcargo.SelectedValue = retorno_projeto.Rows[0].Cells[6].Text; }
                    if (retorno_projeto.Rows[0].Cells[8].Text == "&nbsp;")
                    { proj_produto_dropcaptacao.SelectedValue = "0"; }
                    else { proj_produto_dropcaptacao.SelectedValue = retorno_projeto.Rows[0].Cells[8].Text; }
                    if (retorno_projeto.Rows[0].Cells[9].Text == "&nbsp;")
                    { proj_produto_dropentrega.SelectedValue = "0"; }
                    else { proj_produto_dropentrega.SelectedValue = retorno_projeto.Rows[0].Cells[9].Text; }
                    if (retorno_projeto.Rows[0].Cells[10].Text == "&nbsp;")
                    { proj_produto_dropresponsavel.SelectedIndex = 0; }
                    else { proj_produto_dropresponsavel.SelectedValue = retorno_projeto.Rows[0].Cells[10].Text; }

                    if (retorno_projeto.Rows[0].Cells[31].Text != "&nbsp;")
                    {
                        proj_requisitos_dropescolaridade.DataBind();
                        proj_requisitos_dropescolaridade.SelectedValue = retorno_projeto.Rows[0].Cells[31].Text;
                    }
                    else { proj_requisitos_dropescolaridade.SelectedValue = "0"; }
                    if (retorno_projeto.Rows[0].Cells[32].Text != "&nbsp;")
                    {
                        proj_requisitos_dropsuperiorimediato.DataBind();
                        proj_requisitos_dropsuperiorimediato.SelectedValue = retorno_projeto.Rows[0].Cells[32].Text;
                    }

                    if (retorno_projeto.Rows[0].Cells[36].Text != "&nbsp;")
                    { proj_site_descricao.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[36].Text); }
                    else { proj_site_descricao.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[37].Text != "&nbsp;")
                    { proj_site_resumo.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[37].Text); }
                    else { proj_site_resumo.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[38].Text == "True")
                    { radio_mostrarnosite.SelectedValue = "1"; }
                    else { radio_mostrarnosite.SelectedValue = "0"; }
                    if (retorno_projeto.Rows[0].Cells[13].Text != "&nbsp;")
                    { proj_financeiro_textcandidato.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[13].Text); }
                    else { proj_financeiro_textcandidato.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[14].Text != "&nbsp;")
                    { proj_financeiro_textemailfatura.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[14].Text); }
                    else { proj_financeiro_textemailfatura.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[15].Text != "&nbsp;")
                    { proj_financeiro_textparticularidades.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[15].Text); }
                    else { proj_financeiro_textparticularidades.Text = ""; }
                    //if (retorno_projeto.Rows[0].Cells[17].Text != "&nbsp;")
                    //{ proj_financeiro_textsucesso.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[17].Text); }
                    //else { proj_financeiro_textsucesso.Text = ""; }
                    //if (retorno_projeto.Rows[0].Cells[18].Text != "&nbsp;")
                    //{ proj_financeiro_textretainer.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[18].Text); }
                    //else { proj_financeiro_textretainer.Text = ""; }
                    //if (retorno_projeto.Rows[0].Cells[19].Text != "&nbsp;")
                    //{ proj_financeiro_textprimeiraparcela.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[19].Text); }
                    //else { proj_financeiro_textprimeiraparcela.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[20].Text != "&nbsp;")
                    { proj_financeiro_textsegundaparcela.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[20].Text); }
                    else { proj_financeiro_textsegundaparcela.Text = ""; }
                    //if (retorno_projeto.Rows[0].Cells[21].Text != "&nbsp;")
                    //{ proj_financeiro_textterceiraparcela.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[21].Text); }
                    //else { proj_financeiro_textterceiraparcela.Text = ""; }
                    //if (retorno_projeto.Rows[0].Cells[22].Text != "&nbsp;")
                    //{ proj_radio_modopagamento.SelectedValue = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[22].Text); }
                    //else { proj_radio_modopagamento.SelectedValue = "2"; }
                    //if (retorno_projeto.Rows[0].Cells[25].Text != "&nbsp;")
                    //{ proj_radio_cobrarimpostos.SelectedValue = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[25].Text); }
                    //else { proj_radio_cobrarimpostos.SelectedValue = "2"; }
                    //if (retorno_projeto.Rows[0].Cells[24].Text != "&nbsp;")
                    //{ proj_financeiro_textfee.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[24].Text); }
                    //else { proj_financeiro_textfee.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[26].Text != "&nbsp;")
                    { proj_financeiro_textsalarioinicial.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[26].Text); }
                    else { proj_financeiro_textsalarioinicial.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[27].Text != "&nbsp;")
                    { proj_financeiro_textsalariofinal.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[27].Text); }
                    else { proj_financeiro_textsalariofinal.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[33].Text != "&nbsp;")
                    {
                        float value = float.Parse(HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[33].Text));
                        string result = value.ToString("f2");
                        result = result.Replace(".", ",");
                        proj_requisitos_textsalario.Text = result;
                        proj_financeiro_textsalarioinicial.Text = result;
                    }
                    else
                    {
                        proj_requisitos_textsalario.Text = "";
                        proj_financeiro_textsalarioinicial.Text = "";
                    }
                    if (retorno_projeto.Rows[0].Cells[34].Text != "&nbsp;")
                    {
                        float value = float.Parse(HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[34].Text));
                        string result = value.ToString("f2");
                        proj_requisitos_textbonus.Text = result;
                    }
                    else { proj_requisitos_textbonus.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[29].Text != "&nbsp;")
                    { proj_requisitos_texttamanhoequipe.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[29].Text); }
                    else { proj_requisitos_texttamanhoequipe.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[30].Text != "&nbsp;")
                    { proj_requisitos_textexperiencia.Text = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[30].Text); }
                    else { proj_requisitos_textexperiencia.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[35].Text != "&nbsp;")
                    {
                        float value = float.Parse(HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[35].Text));
                        string result = value.ToString("f2");
                        proj_requisitos_totalcash.Text = result;
                    }
                    else { proj_requisitos_totalcash.Text = ""; }

                    if (retorno_projeto.Rows[0].Cells[28].Text != "&nbsp;")
                    { proj_requisitos_modelocontrato.SelectedValue = retorno_projeto.Rows[0].Cells[28].Text; }
                    else { proj_requisitos_modelocontrato.SelectedValue = "5"; }

                    if (retorno_projeto.Rows[0].Cells[39].Text != "&nbsp;")
                    {
                        id_empresa.Value = retorno_projeto.Rows[0].Cells[39].Text;
                        proj_produto_drop_requisitante.DataBind();
                        proj_produto_drop_rh.DataBind();
                        if (retorno_projeto.Rows[0].Cells[40].Text != "&nbsp;")
                        { proj_produto_drop_requisitante.SelectedValue = retorno_projeto.Rows[0].Cells[40].Text; }
                        else { proj_produto_drop_requisitante.SelectedValue = "0"; }
                        if (retorno_projeto.Rows[0].Cells[41].Text != "&nbsp;")
                        { proj_produto_drop_rh.SelectedValue = retorno_projeto.Rows[0].Cells[41].Text; }
                        else { proj_produto_drop_rh.SelectedValue = "0"; }
                        proj_produto_list_req_tel.DataBind();
                        proj_produto_list_req_email.DataBind();
                        proj_produto_text_rh_tel.DataBind();
                        proj_produto_list_rh_email.DataBind();
                    }
                    if (retorno_projeto.Rows[0].Cells[42].Text != "&nbsp;")
                    {
                        proj_dadoscadastrais_estado.SelectedValue = retorno_projeto.Rows[0].Cells[42].Text;
                        proj_dadoscadastrais_dropcidade.DataBind();
                        if (retorno_projeto.Rows[0].Cells[43].Text != "&nbsp;")
                        { proj_dadoscadastrais_dropcidade.SelectedValue = retorno_projeto.Rows[0].Cells[43].Text; }
                        else { proj_dadoscadastrais_dropcidade.SelectedValue = "0"; }
                    }
                    else { proj_dadoscadastrais_estado.SelectedValue = "0"; }
                    
                    if (retorno_projeto.Rows[0].Cells[44].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[44].Text).ToString();
                        //string conversao = valor.Substring(0, 2) +  valor.Substring(3, 2) +  valor.Substring(6, 4);
                        
                        //string conversao = valor.Replace("/", "");
                        
                        //DateTime data = Convert.ToDateTime(valor, new CultureInfo("pt-BR", false));                        
                        //teste = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[3].Text);
                        proj_produto_dt_inicio.Text = valor;
                    }
                    else { proj_produto_dt_inicio.Text = ""; }
                    
                    if (retorno_projeto.Rows[0].Cells[45].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[45].Text).ToString();
                        //string conversao = valor.Substring(0, 2) +  valor.Substring(3, 2) +  valor.Substring(6, 4);
                        
                        //string conversao = valor.Replace("/", "");
                        
                        //DateTime data = Convert.ToDateTime(valor, new CultureInfo("pt-BR", false));                        
                        //teste = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[3].Text);
                        proj_produto_dt_fim.Text = valor;
                    }
                    else { proj_produto_dt_fim.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[46].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[46].Text).ToString();
                        proj_requisitos_textsalario_ini.Text = valor;
                    }
                    else { proj_requisitos_textsalario_ini.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[47].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[47].Text).ToString();
                        proj_requisitos_textsalario_fim.Text = valor;
                    }
                    else { proj_requisitos_textsalario_fim.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[48].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[48].Text).ToString();
                        //string teste = valor;
                        //string data = teste.Substring();
                        proj_produto_dt_prevista_shortlist.Text = valor;
                    }
                    else { proj_produto_dt_prevista_shortlist.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[49].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[49].Text).ToString();
                        proj_produto_dt_entrega_shortlist.Text = valor;
                    }
                    else { proj_produto_dt_entrega_shortlist.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[50].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[50].Text).ToString();
                        proj_produto_dt_inicio_busca.Text = valor;
                    }
                    else { proj_produto_dt_inicio_busca.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[51].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[51].Text).ToString();
                        proj_produto_quantidade_candidatos.Text = valor;
                    }
                    else { proj_produto_quantidade_candidatos.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[52].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[52].Text).ToString();
                        proj_produto_dropnivel.SelectedValue = valor;
                    }
                    else { proj_produto_dropnivel.SelectedValue = "0"; }
                    if (retorno_projeto.Rows[0].Cells[53].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[53].Text).ToString();
                        proj_produto_nronovagas.Text = valor;
                    }
                    else { proj_produto_nronovagas.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[54].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[54].Text).ToString();
                        proj_produto_requisicao.Text = valor;
                    }
                    else { proj_produto_requisicao.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[55].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[55].Text).ToString();
                        proj_site_titulo.Text = valor;
                    }
                    else { proj_site_titulo.Text = ""; }
                    if (retorno_projeto.Rows[0].Cells[56].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_projeto.Rows[0].Cells[56].Text).ToString();
                        proj_produto_drop_equipe.SelectedValue = valor;
                    }
                    else { proj_produto_drop_equipe.SelectedIndex = 0; }
                }
                //Response.Redirect("Projeto.aspx");
            }

            //REEDITA O LABEL COM A QUANTIDADE DE CLIENTES VINCULADOS AO PROJETO

            label_proj_clientes.Text = "O projeto possui" + proj_clientes_grid_clientes.Rows.Count.ToString() + "clientes";
        }
           
   
        //IMPORTAR DADOS FINANCEIROS

        /*
        protected void Button28_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                string idempresa = "";

                if (Request.Form[id_empresa.UniqueID] != null)
                {
                    idempresa = Request.Form[id_empresa.UniqueID];

                    SqlCommand com = new SqlCommand("sp_retorno_proj_financeiro", con);
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.AddWithValue("@id_empresa", int.Parse(idempresa));

                    SqlDataAdapter da = new SqlDataAdapter(com);
                    //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                    //Array teste = da.GetFillParameters();  
                    //da.Fill(dt_busca);
                    da.Fill(retorno_grid_financeiro);
                    Session["retorno_emp_financeiro"] = retorno_grid_financeiro;

                    if (Session["retorno_emp_financeiro"] != null)
                    {
                        proj_financeiro_grid_financeiro.DataSource = Session["retorno_emp_financeiro"];
                        proj_financeiro_grid_financeiro.DataBind();

                        if (proj_financeiro_grid_financeiro.Rows[0].Cells[3].Text != "&nbsp;")
                        { proj_financeiro_textsucesso.Text = HttpUtility.HtmlDecode(proj_financeiro_grid_financeiro.Rows[0].Cells[3].Text); }
                        else { proj_financeiro_textsucesso.Text = ""; }
                        if (proj_financeiro_grid_financeiro.Rows[0].Cells[4].Text != "&nbsp;")
                        { proj_financeiro_textretainer.Text = HttpUtility.HtmlDecode(proj_financeiro_grid_financeiro.Rows[0].Cells[4].Text); }
                        else { proj_financeiro_textretainer.Text = ""; }
                        if (proj_financeiro_grid_financeiro.Rows[0].Cells[5].Text != "&nbsp;")
                        { proj_financeiro_textprimeiraparcela.Text = HttpUtility.HtmlDecode(proj_financeiro_grid_financeiro.Rows[0].Cells[5].Text); }
                        else { proj_financeiro_textprimeiraparcela.Text = ""; }
                        if (proj_financeiro_grid_financeiro.Rows[0].Cells[6].Text != "&nbsp;")
                        { proj_financeiro_textsegundaparcela.Text = HttpUtility.HtmlDecode(proj_financeiro_grid_financeiro.Rows[0].Cells[6].Text); }
                        else { proj_financeiro_textsegundaparcela.Text = ""; }
                        if (proj_financeiro_grid_financeiro.Rows[0].Cells[7].Text != "&nbsp;")
                        { proj_financeiro_textterceiraparcela.Text = HttpUtility.HtmlDecode(proj_financeiro_grid_financeiro.Rows[0].Cells[7].Text); }
                        else { proj_financeiro_textterceiraparcela.Text = ""; }
                        if (proj_financeiro_grid_financeiro.Rows[0].Cells[8].Text != "&nbsp;")
                        { proj_radio_modopagamento.SelectedValue = HttpUtility.HtmlDecode(proj_financeiro_grid_financeiro.Rows[0].Cells[8].Text); }
                        else { proj_radio_modopagamento.SelectedValue = "2"; }
                        if (proj_financeiro_grid_financeiro.Rows[0].Cells[9].Text != "&nbsp;")
                        { proj_financeiro_dropvencimento.SelectedValue = HttpUtility.HtmlDecode(proj_financeiro_grid_financeiro.Rows[0].Cells[9].Text); }
                        else { proj_financeiro_dropvencimento.SelectedValue = "0"; }
                    }
                }
                else 
                {
                    exibe_mensagem_projeto(7, "escolha uma empresa na aba Projeto!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa na aba Projeto!')"); 
                }
            }
        }
         */

        protected void Button29_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_delete_proj_beneficios", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@id_beneficio", int.Parse(proj_requisitos_listbeneficios.SelectedValue.ToString()));
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (proj_requisitos_listbeneficios.SelectedValue != comp)
                        {
                            com.ExecuteNonQuery();
                            proj_requisitos_listbeneficios.DataBind();
                            exibe_mensagem_projeto(8, "exclusão feita com sucesso!");
                        }
                        else
                        {
                            exibe_mensagem_projeto(8, "exclusão feita sem sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(8, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_projeto(8, "exclusão feita com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                }
            }
        }

        protected void proj_produto_empresa_TextChanged(object sender, EventArgs e)
        {
            string idempresa = Request.Form[id_empresa.UniqueID];
            if (idempresa != null)
            {
                proj_produto_drop_requisitante.DataBind();
                proj_produto_drop_rh.DataBind();
            }
        }

        protected void proj_produto_drop_requisitante_SelectedIndexChanged(object sender, EventArgs e)
        {
            string teste;
            teste = proj_produto_drop_requisitante.SelectedValue.ToString();
            proj_produto_list_req_tel.DataBind();
            proj_produto_list_req_email.DataBind();
        }

        protected void proj_produto_drop_rh_SelectedIndexChanged(object sender, EventArgs e)
        {
            proj_produto_text_rh_tel.DataBind();
            proj_produto_list_rh_email.DataBind();
        }

        protected void ddlprojetostatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (projeto_clientes_drop_status.SelectedValue != "0")
            { projeto_clientes_drop_substatus.DataBind(); }
            else { projeto_clientes_drop_substatus.SelectedValue = "0"; }
        }

        protected void proj_clientes_grid_clientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                GridViewRow row = proj_clientes_grid_clientes.Rows[proj_clientes_grid_clientes.SelectedIndex];
                Session["IDcliente"] = row.Cells[15].Text;
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);



                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(retorno_cliente);
                Session["retorno_cliente"] = retorno_cliente;
                Session["label_modulo"] = proj_clientes_grid_clientes.SelectedRow.Cells[5].Text.ToString();
                //tratamento variavel do cliente
                Session["cliente_projeto"] = Session["IDprojeto"];
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void Button30_Click(object sender, EventArgs e)
        {
            proj_clientes_grid_clientes.DataBind();
            label_proj_clientes.Text = "O projeto possui" + proj_clientes_grid_clientes.Rows.Count.ToString() + "clientes";
        }

        protected void limpa_dados_projeto()
        {
            Session["IDprojeto"] = null;
            
            proj_produto_textnome.Text = "";
            proj_produto_empresa.Text = "";
            proj_produto_dropcargo.SelectedValue = "0";
            proj_dadoscadastrais_estado.SelectedValue = "0";
            proj_dadoscadastrais_dropcidade.DataBind();
            proj_produto_dt_inicio.Text = "";
            proj_produto_dt_fim.Text = "";
            proj_produto_drop_requisitante.SelectedValue = "0";
            proj_produto_drop_rh.SelectedValue = "0";
            proj_produto_list_req_tel.DataBind();
            proj_produto_list_req_email.DataBind();
            proj_produto_text_rh_tel.DataBind();
            proj_produto_list_rh_email.DataBind();
            proj_produto_droptipo.SelectedValue = "0";
            proj_produto_dropsegmento.SelectedValue = "0";
            proj_produto_droparea.DataBind();
            proj_produto_droparea.SelectedIndex = 0;
            proj_produto_dropsubdivisao.DataBind();
            proj_produto_dropsubdivisao.Items.Insert(0, "Escolha a opção");
            proj_produto_dropcaptacao.SelectedValue = "0";
            proj_produto_dropentrega.SelectedValue = "0";
            proj_produto_dropresponsavel.SelectedValue = "0";
            id_proj_concorrente.Value = null;
            proj_produto_textconcorrentes.Text = "";
            proj_produto_dt_inicio_busca.Text = "";
            proj_produto_dt_prevista_shortlist.Text = "";
            proj_produto_dt_entrega_shortlist.Text = "";
            proj_produto_quantidade_candidatos.Text = "";
            proj_produto_dropnivel.SelectedValue = "0";
            proj_produto_drop_equipe.SelectedIndex = 0;

            proj_requisitos_modelocontrato.SelectedValue = "5";
            proj_requisitos_texttamanhoequipe.Text = "";
            proj_requisitos_textexperiencia.Text = "";
            proj_requisitos_dropescolaridade.SelectedValue = "0";
            proj_requisitos_dropsuperiorimediato.SelectedValue = "0";
            proj_requisitos_textsalario.Text = "";
            proj_requisitos_textbonus.Text = "";
            proj_requisitos_totalcash.Text = "";
            proj_requisitos_textsalario_ini.Text = "";
            proj_requisitos_textsalario_fim.Text = "";
            proj_produto_nronovagas.Text = "";
            proj_produto_requisicao.Text = "";

            proj_financeiro_textcandidato.Text = "";
            proj_financeiro_textemailfatura.Text = "";
            proj_financeiro_textsegundaparcela.Text = "";
            proj_financeiro_textsalarioinicial.Text = "";
            proj_financeiro_textsalariofinal.Text = "";
            id_candidato.Value = null;
            proj_fin_id_linha.Value = null;
            adm_text_vencimento.Text = "";
            adm_text_fee.Text = "";
            proj_financeiro_dropdacao.SelectedIndex = 0;
            proj_financeiro_dropfaturar.SelectedIndex = 0;

            Session["retorno_projeto"] = null;
            retorno_projeto.DataSource = Session["retorno_projeto"];
            retorno_projeto.DataBind();

            Session["label_modulo"] = "";
        }

        protected void Button31_Click(object sender, EventArgs e)
        {
            limpa_dados_projeto();
        }

        protected void menuProjeto_MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            string cargo = "";
            cargo = Session["cargo"].ToString();
            if (index == 6)
            {
                DataSet retorno_placement = new DataSet();
                string cstr = conexao;
                using (SqlConnection con = new SqlConnection(cstr))
                {
                    con.Open();
                    int id_projeto = 1;
                    if (Session["IDprojeto"] != null)
                    {
                        id_projeto = int.Parse(Session["IDprojeto"].ToString());
                    }

                    SqlCommand com = new SqlCommand("sp_vw_proj_placement", con);
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.AddWithValue("@id_projeto", id_projeto);

                    SqlDataAdapter da = new SqlDataAdapter(com);
                    da.Fill(retorno_placement);
                    if ((retorno_placement.Tables[0].Rows != null) && (retorno_placement.Tables[0].Rows.Count != 0))
                    {
                        id_candidato.Value = retorno_placement.Tables[0].Rows[0][0].ToString();
                        proj_financeiro_textcandidato.Text = retorno_placement.Tables[0].Rows[0][1].ToString();
                    }
                    else
                    { 
                        id_candidato.Value = null;
                        proj_financeiro_textcandidato.Text = "";
                    }
                }
                
                if ((1 == 1))
                {
                    MultiView2.ActiveViewIndex = index;
                }
            }
            else
            {
                MultiView2.ActiveViewIndex = index;
            }
            proj_grid_status.DataBind();
        }

        /*RENDERIZAÇÃO DE COLUNAS DOS GRIDS*/
        
        protected override void Render(HtmlTextWriter writer)
        {
            for (int i = 0; i < this.proj_clientes_grid_clientes.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.proj_clientes_grid_clientes.UniqueID, "Select$" + i);
            }
            for (int i = 0; i < this.proj_gridobs.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.proj_gridobs.UniqueID, "Select$" + i);
            }
            base.Render(writer);
        }

        /*INCURSÃO DE SELEÇÃO NO GRID ---------------------------- ABA CLIENTES */

        protected void proj_clientes_grid_clientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.proj_clientes_grid_clientes, "Select$" + e.Row.RowIndex);
            }
        }

        /*INCURSÃO DE SELEÇÃO NO GRID ---------------------------- ABA IMPORTANTE */

        protected void proj_gridobs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.proj_gridobs, "Select$" + e.Row.RowIndex);
            }
        }

        protected void Button32_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                //string compddl = "0";
                string valida = "null";
                //float textsalario = 0;
                float bonus = 0;
                string salario_anterior = proj_requisitos_textsalario.Text;
                string salario = "";
                float salario_teste = 0;
                float totalcash = 0;
                string bonus_replace = "";
                if (proj_requisitos_textsalario.Text != "")
                {
                    salario = salario_anterior;//.Replace(".", "");
                    //salario = salario.Replace(",", ".");
                    //if (proj_requisitos_textsalario.Text != "")
                    //{ textsalario = float.Parse(proj_requisitos_textsalario.Text); }
                    salario_teste = float.Parse(salario.ToString());
                    if (proj_requisitos_textbonus.Text != "")
                    { bonus = float.Parse(proj_requisitos_textbonus.Text); }
                    totalcash = (salario_teste * 12) + (salario_teste * bonus);
                    //string totalcash_teste = totalcash.ToString();
                    //totalcash_teste = totalcash_teste.Remove(totalcash_teste.Length - 2, 2);
                    //totalcash = float.Parse(totalcash_teste);
                    bonus_replace = proj_requisitos_textbonus.Text;
                    //bonus_replace = bonus_replace.Replace(",", ".");
                }
                //string total_cash = totalcash.ToString();
                //total_cash = total_cash.Replace(",", ".");                

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_oferta", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                if (id_projeto != 0)
                { com.Parameters.AddWithValue("@id_projeto", id_projeto); }
                if (proj_requisitos_modelocontrato.SelectedValue != "5")
                { com.Parameters.AddWithValue("@tp_contrato", int.Parse(proj_requisitos_modelocontrato.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@tp_contrato", 5); }
                //if (proj_requisitos_texttamanhoequipe.Text != "")
                //{ com.Parameters.AddWithValue("@tamanho_equipe", int.Parse(proj_requisitos_texttamanhoequipe.Text)); }
                //else { com.Parameters.AddWithValue("@tamanho_equipe", null); }
                //if (proj_requisitos_textexperiencia.Text != "")
                //{ com.Parameters.AddWithValue("@experiencia", int.Parse(proj_requisitos_textexperiencia.Text)); }
                //else { com.Parameters.AddWithValue("@experiencia", null); }
                //if (proj_requisitos_dropescolaridade.SelectedValue != "0")
                //{ com.Parameters.AddWithValue("@escolaridade", int.Parse(proj_requisitos_dropescolaridade.SelectedValue.ToString())); }
                //else { com.Parameters.AddWithValue("@escolaridade", null); }
                //if (proj_requisitos_dropsuperiorimediato.SelectedValue != "0")
                //{ com.Parameters.AddWithValue("@superior_imediato", int.Parse(proj_requisitos_dropsuperiorimediato.SelectedValue.ToString())); }
                //else { com.Parameters.AddWithValue("@superior_imediato", null); }
                if (proj_requisitos_textsalario.Text != "")
                { com.Parameters.AddWithValue("@salario_mensal", float.Parse(salario)); }
                else { com.Parameters.AddWithValue("@salario_mensal", null); }
                if (proj_requisitos_textbonus.Text != "")
                { com.Parameters.AddWithValue("@bonus", float.Parse(bonus_replace)); }
                else { com.Parameters.AddWithValue("@bonus", null); }
                //com.Parameters.AddWithValue("@total_cash", float.Parse(total_cash));
                com.Parameters.AddWithValue("@total_cash", totalcash);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (proj_requisitos_textsalario.Text != ""))
                        {
                            com.ExecuteNonQuery();
                            proj_requisitos_totalcash.Text = totalcash.ToString();
                            exibe_mensagem_projeto(8, "cadastro feito com sucesso!");
                        }
                        else
                        {
                            exibe_mensagem_projeto(8, "cadastro feito sem sucesso!");
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(8, "cadastro feito sem sucesso!");
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        protected void Button33_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 2;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                //string compddl = "0";
                string valida = "null";
                //float textsalario = 0;
                float bonus = 0;
                string salario_anterior = proj_requisitos_textsalario.Text;
                string salario = "";
                float salario_teste = 0;
                float totalcash = 0;
                string bonus_replace = "";
                if (proj_requisitos_textsalario.Text != "")
                {
                    salario = salario_anterior.Replace(".", "");
                    salario = salario.Replace(",", ".");
                    //if (proj_requisitos_textsalario.Text != "")
                    //{ textsalario = float.Parse(proj_requisitos_textsalario.Text); }
                    salario_teste = float.Parse(salario.ToString());
                    if (proj_requisitos_textbonus.Text != "")
                    { bonus = float.Parse(proj_requisitos_textbonus.Text); }
                    totalcash = (salario_teste * 12) + (salario_teste * bonus);
                    //string totalcash_teste = totalcash.ToString();
                    //totalcash_teste = totalcash_teste.Remove(totalcash_teste.Length - 2, 2);
                    //totalcash = float.Parse(totalcash_teste);
                    bonus_replace = proj_requisitos_textbonus.Text;
                    bonus_replace = bonus_replace.Replace(",", ".");
                }
                //string total_cash = totalcash.ToString();
                //total_cash = total_cash.Replace(",", ".");                

                string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_oferta", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (proj_requisitos_modelocontrato.SelectedValue != "5")
                { com.Parameters.AddWithValue("@tp_contrato", int.Parse(proj_requisitos_modelocontrato.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@tp_contrato", 5); }
                //if (proj_requisitos_texttamanhoequipe.Text != "")
                //{ com.Parameters.AddWithValue("@tamanho_equipe", int.Parse(proj_requisitos_texttamanhoequipe.Text)); }
                //else { com.Parameters.AddWithValue("@tamanho_equipe", null); }
                //if (proj_requisitos_textexperiencia.Text != "")
                //{ com.Parameters.AddWithValue("@experiencia", int.Parse(proj_requisitos_textexperiencia.Text)); }
                //else { com.Parameters.AddWithValue("@experiencia", null); }
                //if (proj_requisitos_dropescolaridade.SelectedValue != "0")
                //{ com.Parameters.AddWithValue("@escolaridade", int.Parse(proj_requisitos_dropescolaridade.SelectedValue.ToString())); }
                //else { com.Parameters.AddWithValue("@escolaridade", null); }
                //if (proj_requisitos_dropsuperiorimediato.SelectedValue != "0")
                //{ com.Parameters.AddWithValue("@superior_imediato", int.Parse(proj_requisitos_dropsuperiorimediato.SelectedValue.ToString())); }
                //else { com.Parameters.AddWithValue("@superior_imediato", null); }
                if (proj_requisitos_textsalario.Text != "")
                { com.Parameters.AddWithValue("@salario_mensal", float.Parse(salario)); }
                else { com.Parameters.AddWithValue("@salario_mensal", null); }
                if (proj_requisitos_textbonus.Text != "")
                { com.Parameters.AddWithValue("@bonus", float.Parse(bonus_replace)); }
                else { com.Parameters.AddWithValue("@bonus", null); }
                //com.Parameters.AddWithValue("@total_cash", float.Parse(total_cash));
                com.Parameters.AddWithValue("@total_cash", totalcash);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (proj_requisitos_textsalario.Text != "")
                        {
                            com.ExecuteNonQuery();
                            proj_requisitos_totalcash.Text = totalcash.ToString();
                            exibe_mensagem_projeto(8, "cadastro feito com sucesso!");
                        }
                        else
                        {
                            exibe_mensagem_projeto(8, "cadastro feito sem sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(8, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        protected void Button34_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 0;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                //string comp = "";
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_proj_perfil", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        for (int count = 0; count < proj_oferta_checkboxlist_beneficios.Items.Count; count++)
                        {
                            if (proj_oferta_checkboxlist_beneficios.Items[count].Selected)
                            {
                                if (proj_oferta_listbeneficios.Items.Count == 0)
                                {
                                    com.Parameters.AddWithValue("@perfil", int.Parse(proj_oferta_checkboxlist_beneficios.Items[count].Value));
                                    com.ExecuteNonQuery();
                                    com.Parameters.RemoveAt("@perfil");
                                    //proj_requisitos_listbeneficios.DataBind();
                                }
                                else
                                {
                                    int insere = 0;
                                    for (int listcount = 0; listcount < (proj_oferta_listbeneficios.Items.Count); listcount++)
                                    {
                                        if (proj_oferta_checkboxlist_beneficios.Items[count].Value == proj_oferta_listbeneficios.Items[listcount].Value)
                                        {
                                            insere = 1;
                                        }
                                    }
                                    if (insere == 0)
                                    {
                                        com.Parameters.AddWithValue("@perfil", int.Parse(proj_oferta_checkboxlist_beneficios.Items[count].Value));
                                        com.ExecuteNonQuery();
                                        com.Parameters.RemoveAt("@perfil");
                                        proj_oferta_listbeneficios.DataBind();
                                    }
                                    //listcount = proj_requisitos_listbeneficios.Items.Count;
                                }
                            }
                            proj_oferta_listbeneficios.DataBind();
                        }
                    }
                    else
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        protected void Button35_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_delete_proj_perfil", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@id_perfil", int.Parse(proj_oferta_listbeneficios.SelectedValue.ToString()));
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (proj_oferta_listbeneficios.SelectedValue != comp)
                        {
                            com.ExecuteNonQuery();
                            proj_oferta_listbeneficios.DataBind();
                        }
                        else
                        {
                            exibe_mensagem_projeto(2, "exclusão feita sem sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_projeto(2, "exclusão feita com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                }
            }
        }

        //EXCLUSÃO DE ITENS DO GRID DE IDIOMA --------------------------------- ABA REQUISITOS

        protected void grid_idiomas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_cliente = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_idioma = 0;

                SqlCommand com = new SqlCommand("sp_proj_altera_idiomas", con);
                com.CommandType = CommandType.StoredProcedure;

                //GridViewRow row = cli_dadoscadastrais_gridtelefone.Rows[cli_dadoscadastrais_gridtelefone.SelectedIndex];
                //id_telefone = int.Parse(row.Cells[1].Text);
                id_idioma = int.Parse(grid_idiomas.DataKeys[grid_idiomas.SelectedIndex].Values["id"].ToString());

                com.Parameters.AddWithValue("@id", id_idioma);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        grid_idiomas.DataBind();
                        exibe_mensagem_projeto(2, "exclusão feita com sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                    }
                    else
                    {
                        exibe_mensagem_projeto(2, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                //valida = rowCount.Value.ToString();
                //if (valida != "0")
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                //}
            }
        }

        //EXCLUSÃO DE ITENS DO GRID DE ESCOLARIDADE --------------------------------- ABA REQUISITOS

        protected void grid_graduacao_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_cliente = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_graduacao = 0;

                SqlCommand com = new SqlCommand("sp_proj_altera_graduacao", con);
                com.CommandType = CommandType.StoredProcedure;

                //GridViewRow row = cli_dadoscadastrais_gridtelefone.Rows[cli_dadoscadastrais_gridtelefone.SelectedIndex];
                //id_telefone = int.Parse(row.Cells[1].Text);
                id_graduacao = int.Parse(grid_graduacao.DataKeys[grid_graduacao.SelectedIndex].Values["id"].ToString());

                com.Parameters.AddWithValue("@id", id_graduacao);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        grid_graduacao.DataBind();
                    }
                    else
                    {
                        exibe_mensagem_projeto(2, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_projeto(2, "exclusão feita com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                }
            }
        }

        //EXCLUSÃO DE ITENS DO GRID DE DESPESAS --------------------------------- ABA FINANCEIRO

        protected void proj_financeiro_griddespesas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_cliente = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_despesa = 0;

                SqlCommand com = new SqlCommand("sp_proj_altera_fin_despesas", con);
                com.CommandType = CommandType.StoredProcedure;

                //GridViewRow row = cli_dadoscadastrais_gridtelefone.Rows[cli_dadoscadastrais_gridtelefone.SelectedIndex];
                //id_telefone = int.Parse(row.Cells[1].Text);
                id_despesa = int.Parse(proj_financeiro_griddespesas.DataKeys[proj_financeiro_griddespesas.SelectedIndex].Values["id"].ToString());

                com.Parameters.AddWithValue("@id", id_despesa);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        proj_financeiro_griddespesas.DataBind();
                        exibe_mensagem_projeto(7, "exclusão feita com sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                    }
                    else
                    {
                        exibe_mensagem_projeto(7, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(7, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_projeto(7, "exclusão feita com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                }
            }
        }

        protected void exibe_mensagem_projeto(int indice, string mensagem)
        {
            int i = indice;
            string msg = mensagem;
            switch (i)
            {
                case 1:
                    //tratamento para produto
                    mensagem_proj_produto.Text = msg;
                    mensagem_proj_requisitos.Text = "";
                    mensagem_proj_site.Text = "";
                    mensagem_proj_clientes.Text = "";
                    mensagem_proj_havik.Text = "";
                    mensagem_proj_observacoes.Text = "";
                    mensagem_proj_financeiro.Text = "";
                    mensagem_proj_oferta.Text = "";
                    break;
                case 2:
                    //tratamento para requisitos
                    mensagem_proj_produto.Text = "";
                    mensagem_proj_requisitos.Text = msg;
                    mensagem_proj_site.Text = "";
                    mensagem_proj_clientes.Text = "";
                    mensagem_proj_havik.Text = "";
                    mensagem_proj_observacoes.Text = "";
                    mensagem_proj_financeiro.Text = "";
                    mensagem_proj_oferta.Text = "";
                    break;
                case 3:
                    //tratamento para site
                    mensagem_proj_produto.Text = "";
                    mensagem_proj_requisitos.Text = "";
                    mensagem_proj_site.Text = msg;
                    mensagem_proj_clientes.Text = "";
                    mensagem_proj_havik.Text = "";
                    mensagem_proj_observacoes.Text = "";
                    mensagem_proj_financeiro.Text = "";
                    mensagem_proj_oferta.Text = "";
                    break;
                case 4:
                    //tratamento para clientes
                    mensagem_proj_produto.Text = "";
                    mensagem_proj_requisitos.Text = "";
                    mensagem_proj_site.Text = "";
                    mensagem_proj_clientes.Text = msg;
                    mensagem_proj_havik.Text = "";
                    mensagem_proj_observacoes.Text = "";
                    mensagem_proj_financeiro.Text = "";
                    mensagem_proj_oferta.Text = "";
                    break;
                case 5:
                    //tratamento para havik
                    mensagem_proj_produto.Text = "";
                    mensagem_proj_requisitos.Text = "";
                    mensagem_proj_site.Text = "";
                    mensagem_proj_clientes.Text = "";
                    mensagem_proj_havik.Text = msg;
                    mensagem_proj_observacoes.Text = "";
                    mensagem_proj_financeiro.Text = "";
                    mensagem_proj_oferta.Text = "";
                    break;
                case 6:
                    //tratamento para observacoes
                    mensagem_proj_produto.Text = "";
                    mensagem_proj_requisitos.Text = "";
                    mensagem_proj_site.Text = "";
                    mensagem_proj_clientes.Text = "";
                    mensagem_proj_havik.Text = "";
                    mensagem_proj_observacoes.Text = msg;
                    mensagem_proj_financeiro.Text = "";
                    mensagem_proj_oferta.Text = "";
                    break;
                case 7:
                    //tratamento para financeiro
                    mensagem_proj_produto.Text = "";
                    mensagem_proj_requisitos.Text = "";
                    mensagem_proj_site.Text = "";
                    mensagem_proj_clientes.Text = "";
                    mensagem_proj_havik.Text = "";
                    mensagem_proj_observacoes.Text = "";
                    mensagem_proj_financeiro.Text = msg;
                    mensagem_proj_oferta.Text = "";
                    break;
                case 8:
                    //tratamento para oferta
                    mensagem_proj_produto.Text = "";
                    mensagem_proj_requisitos.Text = "";
                    mensagem_proj_site.Text = "";
                    mensagem_proj_clientes.Text = "";
                    mensagem_proj_havik.Text = "";
                    mensagem_proj_observacoes.Text = "";
                    mensagem_proj_financeiro.Text = "";
                    mensagem_proj_oferta.Text = msg;
                    break;                
                case 0:
                    //tratamento para mudança de abas
                    mensagem_proj_produto.Text = msg;
                    mensagem_proj_requisitos.Text = msg;
                    mensagem_proj_site.Text = msg;
                    mensagem_proj_clientes.Text = msg;
                    mensagem_proj_havik.Text = msg;
                    mensagem_proj_observacoes.Text = msg;
                    mensagem_proj_financeiro.Text = msg;
                    mensagem_proj_oferta.Text = msg;
                    break;
                default:
                    break;
            }
        }

        protected void proj_importante_salvar_doc_Click(object sender, EventArgs e)
        {
            int id_cliente = 0;
            int id_usuario = int.Parse(Session["IDusuario"].ToString());
            string tipo_conteudo = "";

            if (Session["IDprojeto"] != null)
            { id_cliente = int.Parse(Session["IDprojeto"].ToString()); }

            if (proj_upload_documento.HasFile)
            {
                if ((Session["IDprojeto"].ToString() != "") && (Session["IDprojeto"] != null))
                {
                    string filename = proj_upload_documento.FileName;
                    string tipo = proj_upload_documento.PostedFile.FileName.Substring(proj_upload_documento.PostedFile.FileName.LastIndexOf(".") + 1);
                    if ((tipo == "doc") || (tipo == "docx") || (tipo == "pdf") || (tipo == "xls") || (tipo == "xlsx"))
                    {
                        //filename = filename + "_" + proj_importante_drop_tipo_doc.SelectedItem.ToString() + "." + tipo;
                        Byte[] bytes = proj_upload_documento.FileBytes;
                        //Upload_Curriculum.SaveAs(savepath);                                       
                        if ((tipo == "doc") || (tipo == "docx"))
                        { tipo_conteudo = "application/vnd.ms-word"; }
                        if ((tipo == "xls") || (tipo == "xlsx"))
                        { tipo_conteudo = "application/vnd.ms-excel"; }
                        else { tipo_conteudo = "application/pdf"; }


                        string cstr = conexao;
                        using (SqlConnection con = new SqlConnection(cstr))
                        {
                            con.Open();

                            SqlCommand com = new SqlCommand("sp_proj_anexos", con);
                            com.CommandType = CommandType.StoredProcedure;

                            com.Parameters.AddWithValue("@tipo", 1);
                            com.Parameters.AddWithValue("@id_projeto", id_cliente);
                            com.Parameters.AddWithValue("@nome_arquivo", filename);
                            com.Parameters.AddWithValue("@tipo_arquivo", tipo_conteudo);
                            if (proj_importante_drop_tipo_doc.SelectedIndex != 0)
                            { com.Parameters.AddWithValue("@tipo_anexo", int.Parse(proj_importante_drop_tipo_doc.SelectedValue.ToString())); }
                            else { com.Parameters.AddWithValue("@tipo_anexo", null); }
                            com.Parameters.AddWithValue("@dados", bytes);
                            com.Parameters.AddWithValue("@usuario", id_usuario);


                            SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                            rowCount.Direction = ParameterDirection.Output;

                            if (proj_importante_drop_tipo_doc.SelectedIndex != 0)
                            {
                                com.ExecuteNonQuery();
                                proj_profissional_grid_anexos.DataBind();
                                exibe_mensagem_projeto(6, "cadastro de anexo feito com sucesso!");
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                            }
                            else
                            {
                                exibe_mensagem_projeto(6, "cadastro feito sem sucesso, favor selecionar um tipo de anexo!");
                            }
                        }

                        //if (cli_profissional_idioma_cv.SelectedIndex == 0)
                        //{
                        //    exibe_mensagem_cliente(2, "cadastro de currículum feito sem sucesso!"); 
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')");
                        //}
                    }
                }
            }
            else
            {
                exibe_mensagem_projeto(6, "cadastro de anexo feito sem sucesso!");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')");
            }
        }

        protected void proj_importante_abrir_doc_Click(object sender, EventArgs e)
        {
            string strQuery = "SELECT nome_arquivo, tipo_arquivo, dados FROM bh_proj_anexos where id_projeto=@id_projeto and tipo_anexo=@tipo_anexo";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@id_projeto", int.Parse(Session["IDprojeto"].ToString()));
            cmd.Parameters.Add("@tipo_anexo", int.Parse(proj_importante_drop_tipo_doc.SelectedValue).ToString());
            DataTable dt = GetData(cmd);
            //string teste = dt.Rows[0]["dados"].ToString();
            if ((dt != null) && (dt.Rows.Count != 0))
            {
                download(dt);
            }
            else
            {
                exibe_mensagem_projeto(6, "anexo não cadastrado na base!");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('CV não cadastrado na base!')"); 
            }
        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            String strConnString = conexao;
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }

        private void download(DataTable dt)
        {
            Byte[] bytes = (Byte[])dt.Rows[0]["dados"];
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = dt.Rows[0]["tipo_arquivo"].ToString();
            string teste = dt.Rows[0]["nome_arquivo"].ToString();
            string teste1 = dt.Rows[0]["tipo_arquivo"].ToString();
            Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["nome_arquivo"].ToString());
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void proj_profissional_grid_anexos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strQuery = "SELECT nome_arquivo, tipo_arquivo, dados FROM bh_proj_anexos where id=@id_linha"; //and tipo_anexo=@tipo_anexo";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@id_linha", int.Parse(proj_profissional_grid_anexos.DataKeys[proj_profissional_grid_anexos.SelectedIndex].Values["id"].ToString()));
            //cmd.Parameters.Add("@tipo_anexo", int.Parse(proj_profissional_grid_anexos.DataKeys[proj_profissional_grid_anexos.SelectedIndex].Values["tipo_anexo"].ToString()));
            DataTable dt = GetData(cmd);
            //string teste = dt.Rows[0]["dados"].ToString();
            if ((dt != null) && (dt.Rows.Count != 0))
            {
                download(dt);
            }
            else
            {
                exibe_mensagem_projeto(6, "anexo não cadastrado na base!");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('CV não cadastrado na base!')"); 
            }
        }

        protected void proj_produto_botao_empresa_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());

                SqlCommand com = new SqlCommand("sp_vw_cli_prof_empresa", con);
                com.CommandType = CommandType.StoredProcedure;

                if (proj_produto_empresa.Text != "")
                { com.Parameters.AddWithValue("@empresa", proj_produto_empresa.Text); }
                else { com.Parameters.AddWithValue("@empresa", ""); }
                SqlDataAdapter da = new SqlDataAdapter(com);

                da.Fill(ds_busca_popup_empresa);
                if (ds_busca_popup_empresa.Tables[0].Rows.Count < 120)
                {
                    //Session["grid_busca_popup_empresa"] = ds_busca_popup_empresa;
                    grid_popup_empresa.DataSource = ds_busca_popup_empresa;
                    grid_popup_empresa.DataBind();
                    grid_popup_empresa.SelectedIndex = -1;
                    Panel13_ModalPopupExtender.Show();
                }
                else
                {
                    grid_popup_empresa.DataSource = null;
                    grid_popup_empresa.DataBind();
                    Panel13_ModalPopupExtender.Show();
                }
            }
            //Session["cliente_filial"] = null;
            //Session["id_cliente_filial"] = null;
            //Session["id_empresa_popup"] = id_empresa.Value;
            //grid_popup_filial.DataBind();
            //grid_popup_filial.SelectedIndex = -1;
        }

        protected void grid_popup_empresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            proj_produto_empresa.Text = grid_popup_empresa.DataKeys[grid_popup_empresa.SelectedIndex].Values["nome"].ToString();
            id_empresa.Value = grid_popup_empresa.DataKeys[grid_popup_empresa.SelectedIndex].Values["id"].ToString();        
        }

        protected void proj_requisitos_cadastrar_curso_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                //string compddl = "0";
                string valida = "null";

                //string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                //SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_proj_certificacao", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                if (proj_produto_textcurso.Text != "0")
                { com.Parameters.AddWithValue("@descricao", proj_produto_textcurso.Text); }
                else { com.Parameters.AddWithValue("@descricao", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (proj_produto_textcurso.Text != ""))
                    {
                        com.ExecuteNonQuery();
                        proj_requisitos_certificacao.DataBind();
                        exibe_mensagem_projeto(2, "cadastro feito com sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                    }
                    else
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                /*valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }

        protected void proj_requisitos_certificacao_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                //string comp = "";
                string valida = "null";
                int id_certificacao = 0;

                SqlCommand com = new SqlCommand("sp_proj_altera_certificacao", con);
                com.CommandType = CommandType.StoredProcedure;

                //GridViewRow row = cli_dadoscadastrais_gridtelefone.Rows[cli_dadoscadastrais_gridtelefone.SelectedIndex];
                //id_telefone = int.Parse(row.Cells[1].Text);
                id_certificacao = int.Parse(proj_requisitos_certificacao.DataKeys[proj_requisitos_certificacao.SelectedIndex].Values["id"].ToString());

                com.Parameters.AddWithValue("@id", id_certificacao);
                com.Parameters.AddWithValue("@exibir", 0);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        proj_requisitos_certificacao.DataBind();
                    }
                    else
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_projeto(2, "cadastro feito com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                }
            }
        }

        protected void proj_fin_grid_financeiro_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = proj_fin_grid_financeiro.Rows[proj_fin_grid_financeiro.SelectedIndex];
                       

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id"].ToString() != "")
            { proj_fin_id_linha.Value = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id"].ToString()); }
            else { proj_fin_id_linha.Value = null; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_candidato"].ToString() != "")
            { id_candidato.Value = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_candidato"].ToString()); }
            else { id_candidato.Value = null; }
            
            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["candidato"].ToString() != "")
            { proj_financeiro_textcandidato.Text = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["candidato"].ToString()); }
            else { proj_financeiro_textcandidato.Text = ""; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["base_faturamento"].ToString() != "")
            {
                string base_faturamento = "";
                base_faturamento = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["base_faturamento"].ToString());
                base_faturamento = base_faturamento.Remove(base_faturamento.Length - 1);
                base_faturamento = base_faturamento.Remove(base_faturamento.Length - 1);
                proj_financeiro_textsalarioinicial.Text = base_faturamento.Replace(".", ",");
            }
            else { proj_financeiro_textsalarioinicial.Text = ""; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["salario_final"].ToString() != "")
            {
                string salario_final = "";
                salario_final = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["salario_final"].ToString());
                salario_final = salario_final.Remove(salario_final.Length - 1);
                salario_final = salario_final.Remove(salario_final.Length - 1);
                proj_financeiro_textsalariofinal.Text = salario_final.Replace(".", ",");
            }
            else { proj_financeiro_textsalariofinal.Text = ""; }
            
            
            
            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["mult_salario"].ToString() != "")
            {
                string mult_salario = "";
                mult_salario = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["mult_salario"].ToString());
                mult_salario = mult_salario.Replace(".", ",");
                mult_salario = mult_salario.Remove(mult_salario.Length - 1);
                mult_salario = mult_salario.Remove(mult_salario.Length - 1);
                adm_text_multiplicador.Text = mult_salario;
            }
            else { adm_text_multiplicador.Text = ""; }
            
            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["fee"].ToString() != "")
            {
                string fee = "";
                fee = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["fee"].ToString());
                fee = fee.Replace(".", ",");
                fee = fee.Remove(fee.Length - 1);
                fee = fee.Remove(fee.Length - 1);
                adm_text_fee.Text = fee;
            }
            else { adm_text_fee.Text = ""; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["email_contato"].ToString() != "")
            { proj_financeiro_textemailfatura.Text = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["email_contato"].ToString()); }
            else { proj_financeiro_textemailfatura.Text = ""; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["particularidades"].ToString() != "")
            { proj_financeiro_textparticularidades.Text = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["particularidades"].ToString()); }
            else { proj_financeiro_textparticularidades.Text = ""; }
                        
            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id1"].ToString() != "")
            {
                proj_financeiro_dropdacao.SelectedValue = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id1"].ToString());
                //proj_fin_carrega_acoes();
            }
            else { proj_financeiro_dropdacao.SelectedIndex = 0; }                       

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["percentual"].ToString() != "")
            {
                string porcentagem = "";
                porcentagem = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["percentual"].ToString());
                porcentagem.Replace(".", ",");
                porcentagem = porcentagem.Remove(porcentagem.Length - 1);
                porcentagem = porcentagem.Remove(porcentagem.Length - 1);
                adm_text_porcentagem.Text = porcentagem;
            }
            else { adm_text_porcentagem.Text = ""; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_impostos"].ToString() != "")
            { proj_financeiro_dropimpostos.SelectedValue = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_impostos"].ToString()); }
            else { proj_financeiro_dropimpostos.SelectedValue = null; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["embutir"].ToString() != "")
            { proj_financeiro_dropembutirimposto.SelectedValue = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["embutir"].ToString()); }
            else { proj_financeiro_dropembutirimposto.SelectedValue = null; }       
                        
            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_faturar"].ToString() != "")
            {
                proj_financeiro_dropfaturar.SelectedValue = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_faturar"].ToString());
                proj_fin_id_faturar.Value = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["id_faturar"].ToString());
            }
            else {}

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["data_vencimento"].ToString() != "")
            { adm_text_vencimento.Text = String.Format("{0:dd/MM/yyyy}", proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["data_vencimento"]); }
            else { adm_text_vencimento.Text = ""; }

            if (proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["ativo"].ToString() != "")
            {
                proj_fin_ativo.Value = HttpUtility.HtmlDecode(proj_fin_grid_financeiro.DataKeys[proj_fin_grid_financeiro.SelectedIndex].Values["ativo"].ToString());
            }
            else { }
            
            proj_fin_calcula_valor_total_com_fee(); 
            proj_fin_carrega_acoes();           
            proj_financeiro_calcula_impostos();
        }

        protected void proj_financeiro_textsalarioinicial_TextChanged(object sender, EventArgs e)
        {            
            proj_fin_calcula_valor_total_com_fee();
            proj_fin_carrega_acoes();
            //proj_fin_calcula_porcentagem();
        }

        protected void proj_financeiro_textsalariofinal_TextChanged(object sender, EventArgs e)
        {
            /*
            float salario_base = 0;
            float salario_final = 0;
            float fee = 0;
            float total = 0;
            if (proj_financeiro_textsalarioinicial.Text != "")
            {
                string conversor_salario = proj_financeiro_textsalarioinicial.Text;
                conversor_salario = conversor_salario.Replace(".", "");
                conversor_salario = conversor_salario.Replace(",", ".");
                salario_base = float.Parse(conversor_salario);
            }
            else { salario_base = 1; }
            if (proj_financeiro_textsalariofinal.Text != "")
            {
                string conversor_salario = proj_financeiro_textsalariofinal.Text;
                conversor_salario = conversor_salario.Replace(".", "");
                conversor_salario = conversor_salario.Replace(",", ".");
                salario_final = float.Parse(conversor_salario);
            }
            else { salario_final = 1; }
            if (adm_text_fee.Text != "")
            {
                string conversor_salario = adm_text_fee.Text;
                conversor_salario = conversor_salario.Replace(".", "");
                conversor_salario = conversor_salario.Replace(",", ".");
                fee = float.Parse(conversor_salario);
            }
            else { fee = 1; }
            if (salario_final == 1)
            {
                total = salario_base * fee;
                proj_financeiro_textsegundaparcela.Text = total.ToString();
                if (proj_financeiro_text_valor_fatura.Text != "")
                { proj_financeiro_text_valor_fatura.Text = proj_financeiro_textsegundaparcela.Text; }
            }
            else
            {
                total = salario_final * fee;
                proj_financeiro_textsegundaparcela.Text = total.ToString();
                if (proj_financeiro_text_valor_fatura.Text != "")
                { proj_financeiro_text_valor_fatura.Text = proj_financeiro_textsegundaparcela.Text; }
            }
            */
            proj_fin_calcula_valor_total_com_fee();
            proj_fin_carrega_acoes();
        }

        protected void proj_fin_calcula_porcentagem()
        {
            float valor_total = 0;
            float valor_fatura = 0;
            float percentual = 0;
            if (proj_financeiro_textsegundaparcela.Text != "")
            {
                string conversor_salario = proj_financeiro_textsegundaparcela.Text;
                //conversor_salario = conversor_salario.Replace(".", "");
                //conversor_salario = conversor_salario.Replace(",", ".");
                valor_total = float.Parse(conversor_salario);

                if ((adm_text_porcentagem.Text.Length > 0) || (adm_text_porcentagem.Text == "100"))
                {
                    string conversor_percentual = adm_text_porcentagem.Text;
                    //conversor_percentual = conversor_percentual.Replace(",", ".");
                    percentual = float.Parse(conversor_percentual) / 100;
                }
                else { percentual = 1; }
                valor_fatura = percentual * valor_total;
                proj_financeiro_text_valor_fatura.Text = valor_fatura.ToString();
                proj_fin_fee_valor.Value = valor_fatura.ToString();
            }
        }

        protected void adm_text_porcentagem_TextChanged(object sender, EventArgs e)
        {
            proj_fin_calcula_valor_total_com_fee();
            //proj_fin_carrega_acoes();
            proj_fin_calcula_porcentagem();
        }

        protected void proj_requisitos_superiorimediato_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void proj_financeiro_dropdacao_SelectedIndexChanged1(object sender, EventArgs e)
        {
            proj_fin_carrega_acoes();
        }

        protected void proj_fin_carrega_acoes()
        {
            DataSet retorno_percentual = new DataSet();

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_projeto = 1;
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }

                SqlCommand com = new SqlCommand("sp_vw_proj_acao_perc", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_percentual);

                if (retorno_percentual.Tables[0].Rows[0][0].ToString() != "")
                { Session["soma_notas"] = retorno_percentual.Tables[0].Rows[0][0].ToString(); }
                else { Session["soma_notas"] = "0"; }

                if (proj_financeiro_dropdacao.SelectedValue == "1") //RETAINER
                {
                    adm_text_porcentagem.Text = "";
                    proj_financeiro_textsalariofinal.Text = "";
                    adm_text_porcentagem.Enabled = true;
                    proj_financeiro_text_valor_fatura.Enabled = false;
                    proj_financeiro_textsalarioinicial.Enabled = true;
                    proj_financeiro_textsalariofinal.Enabled = false;
                    adm_text_fee.Enabled = true;
                    adm_text_multiplicador.Enabled = true;
                }
                else
                {
                    if (proj_financeiro_dropdacao.SelectedValue == "3") //SUCESSO
                    {
                        adm_text_porcentagem.Text = "100";
                        proj_financeiro_text_valor_fatura.Text = proj_financeiro_textsegundaparcela.Text;
                        adm_text_porcentagem.Enabled = false;
                        proj_financeiro_text_valor_fatura.Enabled = false;
                        proj_financeiro_textsalarioinicial.Enabled = false;
                        proj_financeiro_textsalariofinal.Enabled = true;
                        adm_text_fee.Enabled = true;
                        adm_text_multiplicador.Enabled = true;
                    }
                    else
                    {
                        if (proj_financeiro_dropdacao.SelectedValue == "4") //PLACEMENT
                        {
                            float soma_notas = float.Parse(Session["soma_notas"].ToString());
                            float percentual_total = float.Parse(Session["soma_notas"].ToString());
                            float percentual_placement = 0;
                            float valor_fatura = 0;
                            float valor_total = 0;
                            proj_fin_calcula_valor_total_com_fee();
                            if (proj_financeiro_textsegundaparcela.Text != "")// && 
                                //((proj_financeiro_textsegundaparcela.Text.Substring((proj_financeiro_textsegundaparcela.Text.Length - 2)) != ".") 
                                //|| (proj_financeiro_textsegundaparcela.Text.Substring((proj_financeiro_textsegundaparcela.Text.Length - 1)) != ".")
                                //|| (proj_financeiro_textsegundaparcela.Text.Substring((proj_financeiro_textsegundaparcela.Text.Length - 3)) != ".")))
                            {
                                string conversor_salario = proj_financeiro_textsegundaparcela.Text;
                                //conversor_salario = conversor_salario.Replace(".", "");
                                //conversor_salario = conversor_salario.Replace(",", ".");
                                valor_total = float.Parse(conversor_salario);
                            }
                            else
                            { valor_total = 0; }
                            valor_fatura = valor_total - soma_notas;
                            percentual_placement = (soma_notas / valor_total) * 100;
                            if (percentual_placement > 0)
                            {
                                percentual_placement = float.Parse("100") - percentual_placement;
                                adm_text_porcentagem.Text = percentual_placement.ToString();
                                proj_fin_calcula_porcentagem();
                            }
                            else { adm_text_porcentagem.Text = ""; }
                            adm_text_porcentagem.Enabled = false;
                            proj_financeiro_text_valor_fatura.Enabled = false;
                            proj_financeiro_textsalarioinicial.Enabled = false;
                            proj_financeiro_textsalarioinicial.Text = "";
                            proj_financeiro_textsalariofinal.Enabled = true;
                            adm_text_fee.Enabled = true;
                            adm_text_multiplicador.Enabled = true;
                        }
                        else
                        {
                            if (proj_financeiro_dropdacao.SelectedValue == "5") //OUTROS PARCELA UNICA
                            {
                                adm_text_porcentagem.Text = "";
                                string conversao = proj_financeiro_textsegundaparcela.Text;
                                //conversao = conversao.Replace(".", ",");
                                proj_financeiro_text_valor_fatura.Text = proj_financeiro_textsegundaparcela.Text;
                                adm_text_porcentagem.Enabled = false;
                                proj_financeiro_text_valor_fatura.Enabled = false;
                                proj_financeiro_textsalarioinicial.Enabled = true;
                                proj_financeiro_textsalariofinal.Enabled = false;
                                adm_text_fee.Enabled = false;
                                adm_text_multiplicador.Enabled = false;
                                adm_text_multiplicador.Text = "1";
                                adm_text_fee.Text = "100";
                                adm_text_porcentagem.Text = "100";
                                proj_financeiro_textsegundaparcela.Text = "";
                            }
                            else
                            { 
                                adm_text_porcentagem.Text = "";
                                proj_financeiro_textsalariofinal.Text = "";
                                proj_financeiro_textsalariofinal.Enabled = false;
                            }
                        }
                    }
                }
                //proj_fin_calcula_valor_total_com_fee();
            }
        }

        protected void adm_text_fee_TextChanged(object sender, EventArgs e)
        {
            proj_fin_calcula_valor_total_com_fee();
            proj_fin_carrega_acoes();
        }

        protected void proj_fin_calcula_valor_total_com_fee()
        {
            float salario_base = 0;
            float salario_final = 0;
            float fee = 0;
            float multiplicador = 0;
            float total = 0;
            if (adm_text_multiplicador.Text != "")
            {
                string conversor_numerico = adm_text_multiplicador.Text;
                //conversor_numerico = conversor_numerico.Replace(",", ".");
                multiplicador = float.Parse(conversor_numerico);
            }
            else { multiplicador = 1; }
            if (((proj_financeiro_textsalarioinicial.Text != "") && (proj_financeiro_textsalarioinicial.Text.Length > 3)) &&
                ((proj_financeiro_textsalarioinicial.Text.Substring((proj_financeiro_textsalarioinicial.Text.Length - 2)) != ".") 
                || (proj_financeiro_textsalarioinicial.Text.Substring((proj_financeiro_textsalarioinicial.Text.Length - 1)) != ".")
                || (proj_financeiro_textsalarioinicial.Text.Substring((proj_financeiro_textsalarioinicial.Text.Length - 3)) != ".")))
            {
                string conversor_salario = proj_financeiro_textsalarioinicial.Text;
                //conversor_salario = conversor_salario.Replace(".", "");
                //conversor_salario = conversor_salario.Replace(",", ".");
                salario_base = float.Parse(conversor_salario);
            }
            else { salario_base = 1; }
            if (proj_financeiro_textsalariofinal.Text != "") //&&
                
            {
                string conversor_salario = proj_financeiro_textsalariofinal.Text.ToString();
                //if ((conversor_salario.Substring((conversor_salario.Length - 2)) != ".")
                //|| (conversor_salario.Substring((conversor_salario.Length - 1)) != ".")
                //|| (conversor_salario.Substring((conversor_salario.Length - 3)) != "."))
                //{
                    //conversor_salario = conversor_salario.Replace(".", "");
                    //conversor_salario = conversor_salario.Replace(",", ".");
                    salario_final = float.Parse(conversor_salario);
                //}
                //else 
                //{
                //    conversor_salario = conversor_salario.Replace(",", ".");
                //    salario_final = float.Parse(conversor_salario);
                //}
            }
            else { salario_final = 1; }
            if (adm_text_fee.Text != "")
            {
                string conversor_salario = adm_text_fee.Text;
                //conversor_salario = conversor_salario.Replace(",", ".");
                fee = float.Parse(conversor_salario);
            }
            else { fee = 1; }
            if (salario_final == 1)
            {
                total = salario_base * (fee/100) * multiplicador;
                proj_financeiro_textsegundaparcela.Text = total.ToString();
            }
            else
            {
                total = salario_final * (fee / 100) * multiplicador;
                proj_financeiro_textsegundaparcela.Text = total.ToString();
            }
            proj_fin_calcula_porcentagem();
        }

        protected void proj_financeiro_dropimpostos_SelectedIndexChanged(object sender, EventArgs e)
        {
            proj_financeiro_calcula_impostos();
        }

        protected void proj_financeiro_calcula_impostos()
        {
            DataSet retorno_aliquota = new DataSet();
            proj_fin_calcula_porcentagem();
            proj_fin_calcula_valor_total_com_fee();
            float aliquota = 0;
            float aliquota_net = 0;
            float verificar = 0;
            float valor_bruto = 0;
            float valor_net = 0;
            float fee_valor = 0;
            if (proj_financeiro_text_valor_fatura.Text != "")
            {
                if (proj_financeiro_text_valor_fatura.Text.Substring((proj_financeiro_text_valor_fatura.Text.Length - 2)) != ".")
                {
                    string conversor_salario = proj_financeiro_text_valor_fatura.Text;
                    conversor_salario = conversor_salario.Replace(".", "");
                    conversor_salario = conversor_salario.Replace(",", ".");
                    valor_bruto = float.Parse(conversor_salario);
                }
                else { valor_bruto = float.Parse(proj_financeiro_text_valor_fatura.Text); }
            }
            /*
            if (proj_financeiro_texts_fatura_impostos.Text != "")
            {
                string conversor_salario = proj_financeiro_texts_fatura_impostos.Text;
                valor_fatura_imposto = float.Parse(conversor_salario);
            }
            */

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_imposto = 0;
                if (proj_financeiro_dropimpostos.SelectedIndex != 0)
                { id_imposto = int.Parse(proj_financeiro_dropimpostos.SelectedValue); }

                SqlCommand com = new SqlCommand("sp_vw_proj_aliquota", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_imposto", id_imposto);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_aliquota);

                if (retorno_aliquota.Tables[0].Rows.Count > 0)
                {
                    aliquota = float.Parse(retorno_aliquota.Tables[0].Rows[0][0].ToString());
                    aliquota_net = float.Parse(retorno_aliquota.Tables[0].Rows[0][1].ToString());
                    verificar = float.Parse(retorno_aliquota.Tables[0].Rows[0][2].ToString());
                    fee_valor = float.Parse(proj_fin_fee_valor.Value.ToString());

                    if (proj_financeiro_dropembutirimposto.SelectedValue == "1" && verificar == 1)
                    {
                        valor_bruto = fee_valor / aliquota;
                        valor_net = fee_valor;
                        proj_financeiro_texts_fatura_impostos.Text = valor_bruto.ToString();
                        proj_financeiro_text_valor_fatura.Text = valor_net.ToString();
                    }
                    else
                    {
                        if (proj_financeiro_dropembutirimposto.SelectedValue == "1" && verificar == 2)
                        {
                            valor_bruto = fee_valor / aliquota;
                            valor_net = valor_bruto * aliquota_net;
                            proj_financeiro_texts_fatura_impostos.Text = valor_bruto.ToString();
                            proj_financeiro_text_valor_fatura.Text = valor_net.ToString();
                        }
                        else
                        {
                            if (proj_financeiro_dropembutirimposto.SelectedValue == "2")
                            {
                                valor_bruto = fee_valor;
                                valor_net = fee_valor * aliquota_net;
                                proj_financeiro_texts_fatura_impostos.Text = valor_bruto.ToString();
                                proj_financeiro_text_valor_fatura.Text = valor_net.ToString();
                            }
                        }
                    }

                    /*
                    valor_net = valor_bruto / aliquota;
                    string converte = valor_net.ToString();
                    converte = converte.Replace(".", ",");
                    proj_financeiro_texts_fatura_impostos.Text = converte;
                    
                    if (proj_financeiro_dropimpostos.SelectedValue == "9") //NENHUM IMPOSTO - INVERSAO DE CAMPOS
                    {
                        string troca = "";
                        valor_net = valor_bruto * float.Parse("0.8367");
                        string converte_valor = valor_net.ToString();
                        converte_valor = converte_valor.Replace(".", ",");
                        proj_financeiro_texts_fatura_impostos.Text = converte_valor;
                        troca = proj_financeiro_texts_fatura_impostos.Text;
                        proj_financeiro_texts_fatura_impostos.Text = proj_financeiro_text_valor_fatura.Text;
                        proj_financeiro_text_valor_fatura.Text = troca;
                        
                        //CALCULO DO VALOR DA FATURA COM A RETENÇÃO

                        string converte_retencao = "";
                        converte_retencao = proj_financeiro_texts_fatura_impostos.Text;
                        converte_retencao = converte_retencao.Replace(",", ".");
                        float retencao = 0;
                        retencao = float.Parse(converte_retencao) / float.Parse("0.9385");
                        proj_financeiro_texts_fatura_impostos.Text = retencao.ToString();
                        proj_financeiro_text_valor_fatura.Text = (retencao * float.Parse("0.8367")).ToString();

                    }
                    */
                }
                else { proj_financeiro_texts_fatura_impostos.Text = ""; }
            }
        }

        protected void proj_financeiro_novo_cadastro_Click(object sender, EventArgs e)
        {
            proj_fin_id_linha.Value = null;
            proj_fin_grid_financeiro.SelectedIndex = -1;
            proj_fin_id_faturar.Value = null;
            proj_financeiro_dropembutirimposto.SelectedIndex = 0;
        }

        protected void proj_financeiro_cancelar_acao_Click(object sender, EventArgs e)
        {
            // ele vai colocar o status a cancelar na acao carregada entao tem que verificar se ha alguma acao carregada
            // e entao depois de verificar chamar uma procedure para colocar o status a cancelar

            //sp_proj_cancela_acao
            // @id_acao
            // @usuario
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_projeto = 1;
                string sessao = "0";
                if (Session["IDprojeto"] != null)
                { id_projeto = int.Parse(Session["IDprojeto"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";
                
                SqlCommand com = new SqlCommand("sp_proj_cancela_acao", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@usuario", id_usuario);
                if ((proj_fin_id_linha.Value != "") && (proj_fin_id_linha.Value != null))
                {
                    com.Parameters.AddWithValue("@id_acao", int.Parse(proj_fin_id_linha.Value));
                }
                else { com.Parameters.AddWithValue("@id_acao", null); }

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (id_usuario == int.Parse(proj_produto_dropentrega.SelectedValue.ToString()))
                    {
                        if ((valida != sessao) && (proj_fin_ativo.Value == "1") && (proj_fin_id_linha.Value != "") && (proj_fin_id_linha.Value != null))
                        {
                            com.ExecuteNonQuery();
                            proj_financeiro_griddespesas.DataBind();
                            exibe_mensagem_projeto(7, "cadastro feito com sucesso!");
                        }
                        else
                        {
                            exibe_mensagem_projeto(7, "Não é possível cancelar a ação!");                            
                        }
                    }
                    else
                    {
                        exibe_mensagem_projeto(7, "você não tem permissão para efetuar a operação neste projeto!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_projeto(7, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        protected void adm_text_multiplicador_TextChanged(object sender, EventArgs e)
        {
            proj_fin_calcula_valor_total_com_fee();
            proj_fin_carrega_acoes();
        }

        protected void proj_financeiro_dropembutirimposto_SelectedIndexChanged(object sender, EventArgs e)
        {
            proj_financeiro_calcula_impostos();
        }

    }
}