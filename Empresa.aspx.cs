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
using System.IO;
using System.Globalization;
using System.Threading;
using System.Drawing;
using System.Resources;

namespace HavikTeste
{
    public partial class Empresa : System.Web.UI.Page
    {
        DataSet retorno_grid_empresa = new DataSet();
        DataSet retorno_cliente = new DataSet();
        DataSet retorno_projeto = new DataSet();
        //int atualiza = 0;
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.Title = "Havik System - Empresa";

            if (Session["IDusuario"] == null)
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            //PREENCHE A LABEL EM DADOS CADASTRAIS DE EMPRESA

            if (Session["IDempresa"] != null)
            {
                emp_dadoscadastrasi_label_id.Text = "ID: " + Session["IDempresa"].ToString();
            }
            else
            { emp_dadoscadastrasi_label_id.Text = ""; }

            string user = "1";
            if (Session["IDusuario"] != null)
            { user = Session["IDusuario"].ToString(); }
            if (user == "28")
            { 
                menuEmpresa.Items[7].Enabled = false;
                menuEmpresa.Items[8].Enabled = false;
            }

            if (Session["grid_busca_empresa"] != null)
            {
                grid_busca_empresa.DataSource = Session["grid_busca_empresa"];
                grid_busca_empresa.DataBind();
                foreach (GridViewRow row in grid_busca_empresa.Rows)
                {
                    if (Session["IDempresa"] != null)
                    {
                        if (Session["IDempresa"].ToString() == grid_busca_empresa.DataKeys[row.RowIndex].Values["id_empresa"].ToString())
                        {
                            grid_busca_empresa.Rows[row.RowIndex].Font.Bold = true;
                        }
                    }
                }
            }

            //if (atualiza == 0)
            if(!IsPostBack)
            if (Session["retorno_empresa"] != null)
            { 
                retorno_empresa.DataSource = Session["retorno_empresa"];
                retorno_empresa.DataBind();
                if (retorno_empresa.Rows[0].Cells[3].Text.ToString() != "&nbsp;")
                {
                    Session["label_modulo"] = retorno_empresa.Rows[0].Cells[3].Text.ToString();
                    emp_dadoscadastrais_nometext.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[3].Text.ToString()); 
                }
                else { emp_dadoscadastrais_nometext.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[2].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_razaosocial.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[2].Text); }
                else { emp_dadoscadastrais_razaosocial.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[1].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_cnpj.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[1].Text); }
                else { emp_dadoscadastrais_cnpj.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[5].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_endereco.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[5].Text); }
                else { emp_dadoscadastrais_endereco.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[12].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_cep.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[12].Text); }
                else { emp_dadoscadastrais_cep.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[6].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_numero.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[6].Text); }
                else { emp_dadoscadastrais_numero.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[14].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_codpais.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[14].Text); }
                else { emp_dadoscadastrais_codpais.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[15].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_ddd.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[15].Text); }
                else { emp_dadoscadastrais_ddd.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[17].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_telefone.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[17].Text); }
                else { emp_dadoscadastrais_telefone.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[7].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_complemento.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[7].Text); }
                else { emp_dadoscadastrais_complemento.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[8].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_bairro.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[8].Text); }
                else { emp_dadoscadastrais_bairro.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[18].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_email.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[18].Text); }
                else { emp_dadoscadastrais_email.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[13].Text.ToString() != "&nbsp;")
                { emp_dadoscadastrais_site.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[13].Text); }
                else { emp_dadoscadastrais_site.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[11].Text == "&nbsp;")
                { emp_dadoscadastrais_radioofflimits.SelectedValue = "3"; }
                else { emp_dadoscadastrais_radioofflimits.SelectedValue = retorno_empresa.Rows[0].Cells[11].Text; }
                if (retorno_empresa.Rows[0].Cells[4].Text != "&nbsp;")
                    if (emp_dadoscadastrais_segmento.SelectedIndex == 0)
                { emp_dadoscadastrais_segmento.SelectedValue = retorno_empresa.Rows[0].Cells[4].Text; }
                if (retorno_empresa.Rows[0].Cells[21].Text != "&nbsp;")
                    if (emp_dadoscadastrais_pais.SelectedIndex == 0)
                { emp_dadoscadastrais_pais.SelectedValue = retorno_empresa.Rows[0].Cells[21].Text; }
                if (retorno_empresa.Rows[0].Cells[10].Text != "&nbsp;")
                {
                    emp_dadoscadastrais_estado.SelectedValue = retorno_empresa.Rows[0].Cells[10].Text;
                    emp_dadoscadastrais_dropcidade.DataBind();
                    emp_dadoscadastrais_dropcidade.Items.Insert(0, "Ecolha a opção");
                    if (retorno_empresa.Rows[0].Cells[9].Text != "&nbsp;")
                    { 
                        emp_dadoscadastrais_dropcidade.SelectedValue = retorno_empresa.Rows[0].Cells[9].Text;
                    }
                    else { emp_dadoscadastrais_dropcidade.SelectedIndex = 0; }
                }
                else { emp_dadoscadastrais_estado.SelectedValue = "0"; }
                if (retorno_empresa.Rows[0].Cells[23].Text.ToString() != "&nbsp;")
                { emp_financeiro_textsucesso.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[23].Text); }
                else { emp_financeiro_textsucesso.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[24].Text.ToString() != "&nbsp;")
                { emp_financeiro_textretainer.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[24].Text); }
                else { emp_financeiro_textretainer.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[25].Text.ToString() != "&nbsp;")
                { emp_financeiro_textprimeiraparcela.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[25].Text); }
                else { emp_financeiro_textprimeiraparcela.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[26].Text.ToString() != "&nbsp;")
                { emp_financeiro_textsegundaparcela.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[26].Text); }
                else { emp_financeiro_textsegundaparcela.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[27].Text.ToString() != "&nbsp;")
                { emp_financeiro_texterceiraparcela.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[27].Text); }
                else { emp_financeiro_texterceiraparcela.Text = ""; }
                if (retorno_empresa.Rows[0].Cells[28].Text != "&nbsp;")
                { emp_financeiro_radiopagamento.SelectedValue = retorno_empresa.Rows[0].Cells[28].Text; }
                else { emp_financeiro_radiopagamento.SelectedValue = "3"; }
                
                
                if (retorno_empresa.Rows[0].Cells[29].Text != "&nbsp;")
                {
                    emp_financeiro_dropvencimento.DataBind();
                    emp_financeiro_dropvencimento.SelectedValue = retorno_empresa.Rows[0].Cells[29].Text; }
                
                
                if (retorno_empresa.Rows[0].Cells[22].Text != "&nbsp;")
                {
                    emp_financeiro_dropkeyaccount.DataBind();
                    emp_financeiro_dropkeyaccount.SelectedValue = retorno_empresa.Rows[0].Cells[22].Text; }

                if (retorno_empresa.Rows[0].Cells[30].Text != "&nbsp;")
                { 
                    emp_mercado_dropnrodefuncionarios.DataBind();
                    emp_mercado_dropnrodefuncionarios.SelectedValue = retorno_empresa.Rows[0].Cells[30].Text;
                }

                if (retorno_empresa.Rows[0].Cells[32].Text != "&nbsp;")
                {
                    emp_mercado_droporigem.DataBind();
                    emp_mercado_droporigem.SelectedValue = retorno_empresa.Rows[0].Cells[32].Text;
                }
                if (retorno_empresa.Rows[0].Cells[31].Text != "&nbsp;")
                {
                    emp_mercado_dropfaturamento.DataBind();
                    emp_mercado_dropfaturamento.SelectedValue = retorno_empresa.Rows[0].Cells[31].Text;
                }
                if (retorno_empresa.Rows[0].Cells[33].Text != "&nbsp;")
                {
                    emp_dadoscadastrais_dropgrupo.SelectedValue = retorno_empresa.Rows[0].Cells[33].Text;
                }

                emp_filiais_gridfiliais.DataBind();
                //Session["retorno_empresa"] = null;

            }
        }

        
        protected void ddldadoscadastrais_estado_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList ddlcidade = (DropDownList)emp_dadoscadastrais.FindControl("emp_dadoscadastrais_dropcidade");

            //if (ddlcidade != null)
            //{
            //    ddlcidade.DataBind();
            //    ddlcidade.Items.Insert(0, "Escolha a opção");
            //}
            emp_dadoscadastrais_dropcidade.DataBind();
            emp_dadoscadastrais_dropcidade.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceDadosCadastraisCidade_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlestado = (DropDownList)emp_dadoscadastrais.FindControl("emp_dadoscadastrais_estado");

            if (ddlestado != null)
            {
                e.Command.Parameters["@ufcod"].Value = ddlestado.SelectedValue;
            }
        }

        protected void ddlestado_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList ddlcidade = (DropDownList)emp_filiais.FindControl("emp_filiais_cidade");

            //if (ddlcidade != null)
            //{
            //    ddlcidade.DataBind();
            //    ddlcidade.Items.Insert(0, "Escolha a opção");
            //}
            emp_filiais_cidade.DataBind();
            emp_filiais_cidade.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceCidade_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlestado = (DropDownList)emp_filiais.FindControl("emp_filiais_dropestado");

            if (ddlestado != null)
            {
                e.Command.Parameters["@ufcod"].Value = ddlestado.SelectedValue;
            }
        }

        protected void ddlstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList ddlstatus = (DropDownList)emp_havik.FindControl("emp_havik_dropsubstatus");

            //if (ddlstatus != null)
            //{
            //    ddlstatus.DataBind();
            //    ddlstatus.Items.Insert(0, "Escolha a opção");
            //}
            //emp_havik_dropsubstatus.DataBind();
            //emp_havik_dropsubstatus.Items.Insert(0, "Escolha a opção");
            if (emp_havik_dropstatus.SelectedValue != "8")
            {
                emp_havik_textdata.Enabled = true;
                emp_havik_texthora.Enabled = true;
                emp_havik_drop_entrevistador.Enabled = true;
            }
            else
            {
                emp_havik_textdata.Text = "";
                emp_havik_texthora.Text = "";
                emp_havik_drop_entrevistador.SelectedIndex = 0;
                emp_havik_textdata.Enabled = false;
                emp_havik_texthora.Enabled = false;
                emp_havik_drop_entrevistador.Enabled = false;
            }
        }

        protected void SqlDataSourceSubstatus_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)emp_havik.FindControl("emp_havik_dropstatus");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)emp_dadoscadastrais.FindControl("emp_dadoscadastrais_areaofflimits");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)emp_dadoscadastrais.FindControl("proj_produto_dropsubdivisao");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void SqlDataSourceArea_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)emp_dadoscadastrais.FindControl("emp_dadoscadastrais_segmento");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)emp_dadoscadastrais.FindControl("emp_dadoscadastrais_areaofflimits");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void SqlDataSourceDetails_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)emp_havik.FindControl("emp_havik_dropstatus");
            e.Command.Parameters["@Status"].Value = ddlstatus.SelectedValue;
        }

        /* CADASTRO DE EMPRESA -------- ABA DADOS CADASTRAIS */

        protected void Button3_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                //int id_empresa = 0;
                string comp = "";
                string valida = "0";
                int tipotel = 0;
                int id_empresa = 0;
                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                SqlCommand com = new SqlCommand("sp_emp_dadoscad", con);
                com.CommandType = CommandType.StoredProcedure;

                if ((emp_dadoscadastrais_radioofflimits.SelectedValue == "1") || (emp_dadoscadastrais_radioofflimits.SelectedValue == "2"))
                { com.Parameters.AddWithValue("@offlimits", int.Parse(emp_dadoscadastrais_radioofflimits.SelectedValue)); }
                else { com.Parameters.AddWithValue("@offlimits", 3); }
                com.Parameters.AddWithValue("@tipo_tel", tipotel);
                com.Parameters.AddWithValue("@tipo", i);
                if (id_empresa != 0)
                { com.Parameters.AddWithValue("@id_empresa", id_empresa); }
                else { com.Parameters.AddWithValue("@id_empresa", null); }
                com.Parameters.AddWithValue("@nome", emp_dadoscadastrais_nometext.Text);
                com.Parameters.AddWithValue("@razao_social", emp_dadoscadastrais_razaosocial.Text);
                if (emp_dadoscadastrais_cnpj.Text != "")
                { com.Parameters.AddWithValue("@cnpj", emp_dadoscadastrais_cnpj.Text); }
                else { com.Parameters.AddWithValue("@cnpj", null); }
                com.Parameters.AddWithValue("@endereco", emp_dadoscadastrais_endereco.Text);
                com.Parameters.AddWithValue("@cep", emp_dadoscadastrais_cep.Text);
                com.Parameters.AddWithValue("@numero", emp_dadoscadastrais_numero.Text);
                if (emp_dadoscadastrais_dropcidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cidade", emp_dadoscadastrais_dropcidade.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@cidade", null); }
                if (emp_dadoscadastrais_codpais.Text != "")
                { com.Parameters.AddWithValue("@cod_pais", int.Parse(emp_dadoscadastrais_codpais.Text)); }
                else { com.Parameters.AddWithValue("@cod_pais", null); }
                if (emp_dadoscadastrais_ddd.Text != "")
                { com.Parameters.AddWithValue("@ddd", int.Parse(emp_dadoscadastrais_ddd.Text)); }
                else { com.Parameters.AddWithValue("@ddd", null); }
                if (emp_dadoscadastrais_telefone.Text != "")
                { com.Parameters.AddWithValue("@telefone", int.Parse(emp_dadoscadastrais_telefone.Text)); }
                else { com.Parameters.AddWithValue("@telefone", null); }
                com.Parameters.AddWithValue("@complemento", emp_dadoscadastrais_complemento.Text);
                com.Parameters.AddWithValue("@bairro", emp_dadoscadastrais_bairro.Text);
                com.Parameters.AddWithValue("@email", emp_dadoscadastrais_email.Text);
                com.Parameters.AddWithValue("@site", emp_dadoscadastrais_site.Text);
                com.Parameters.AddWithValue("@segmento", emp_dadoscadastrais_segmento.SelectedValue);
                com.Parameters.AddWithValue("@pais", int.Parse(emp_dadoscadastrais_pais.SelectedValue));
                if (emp_dadoscadastrais_estado.SelectedIndex != 0)
                {com.Parameters.AddWithValue("@estado", emp_dadoscadastrais_estado.SelectedValue.ToString());}
                else { com.Parameters.AddWithValue("@estado", null); }
                if (emp_dadoscadastrais_dropgrupo.SelectedValue != "0")
                { com.Parameters.AddWithValue("@grupo", int.Parse(emp_dadoscadastrais_dropgrupo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@grupo", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;


                try
                {
                    //if (Session["IDempresa"] != null)
                    if ((emp_dadoscadastrais_nometext.Text.ToString() != comp) && (emp_dadoscadastrais_razaosocial.Text.ToString() != comp) &&
                        (emp_dadoscadastrais_segmento.SelectedIndex != 0) && (emp_dadoscadastrais_segmento.SelectedIndex != -1))
                    {
                        com.ExecuteNonQuery();
                        Session["label_modulo"] = emp_dadoscadastrais_nometext.Text;
                        valida = rowCount.Value.ToString();
                        exibe_mensagem_empresa(1, "cadastro feito com sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                        if (valida != "0")
                        {
                            Session["IDempresa"] = rowCount.Value;
                            exibe_mensagem_empresa(1, "cadastro feito com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                        }
                        else
                        {
                            Session["IDempresa"] = null;
                            exibe_mensagem_empresa(1, "cadastro feito sem sucesso!");
                            limpar_dados_empresa();
                        }

                        //GRAVAÇÃO DAS INFORMAÇÕES DEPOIS DE UM CADASTRO PARA PERSISTIR OS DADOS PELOS MÓDULOS

                        int idd_empresa = int.Parse(Session["IDempresa"].ToString());

                        SqlCommand comm = new SqlCommand("sp_retorno_empresa", con);
                        comm.CommandType = CommandType.StoredProcedure;

                        comm.Parameters.AddWithValue("@id_empresa", idd_empresa);

                        SqlDataAdapter da = new SqlDataAdapter(comm);
                        //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                        //Array teste = da.GetFillParameters();  
                        //da.Fill(dt_busca);
                        da.Fill(retorno_grid_empresa);
                        Session["retorno_empresa"] = retorno_grid_empresa;
                    }
                    else
                    {
                        exibe_mensagem_empresa(1, "cadastro feito sem sucesso, favor preencher os campos obrigatórios!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(1, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }

                //PREENCHE A LABEL EM DADOS CADASTRAIS DE EMPRESA

                if (Session["IDempresa"] != null)
                {
                    emp_dadoscadastrasi_label_id.Text = "ID: " + Session["IDempresa"].ToString();
                }
                else
                { emp_dadoscadastrasi_label_id.Text = ""; }

            }

        }

        /* ATUALIZAÇÃO -------- UPDATE ABA DADOS CADASTRAIS */

        protected void Button4_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                                
                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 1;
                string sessao = "0";
                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                int tipotel = 0;

                SqlCommand com = new SqlCommand("sp_emp_dadoscad", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@offlimits", int.Parse(emp_dadoscadastrais_radioofflimits.SelectedValue));
                com.Parameters.AddWithValue("@tipo_tel", tipotel);
                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                com.Parameters.AddWithValue("@nome", emp_dadoscadastrais_nometext.Text);
                com.Parameters.AddWithValue("@razao_social", emp_dadoscadastrais_razaosocial.Text);
                com.Parameters.AddWithValue("@cnpj", emp_dadoscadastrais_cnpj.Text);
                com.Parameters.AddWithValue("@endereco", emp_dadoscadastrais_endereco.Text);
                com.Parameters.AddWithValue("@cep", emp_dadoscadastrais_cep.Text);
                com.Parameters.AddWithValue("@numero", emp_dadoscadastrais_numero.Text);
                com.Parameters.AddWithValue("@cidade", emp_dadoscadastrais_dropcidade.SelectedValue.ToString());
                if (emp_dadoscadastrais_codpais.Text != "")
                { com.Parameters.AddWithValue("@cod_pais", int.Parse(emp_dadoscadastrais_codpais.Text)); }
                else { com.Parameters.AddWithValue("@cod_pais", null); }
                if (emp_dadoscadastrais_ddd.Text != "")
                { com.Parameters.AddWithValue("@ddd", int.Parse(emp_dadoscadastrais_ddd.Text)); }
                else { com.Parameters.AddWithValue("@ddd", null); }
                if (emp_dadoscadastrais_telefone.Text != "")
                { com.Parameters.AddWithValue("@telefone", int.Parse(emp_dadoscadastrais_telefone.Text)); }
                else { com.Parameters.AddWithValue("@telefone", null); }
                com.Parameters.AddWithValue("@complemento", emp_dadoscadastrais_complemento.Text);
                com.Parameters.AddWithValue("@bairro", emp_dadoscadastrais_bairro.Text);
                com.Parameters.AddWithValue("@email", emp_dadoscadastrais_email.Text);
                com.Parameters.AddWithValue("@site", emp_dadoscadastrais_site.Text);
                com.Parameters.AddWithValue("@segmento", emp_dadoscadastrais_segmento.SelectedValue);
                com.Parameters.AddWithValue("@pais", int.Parse(emp_dadoscadastrais_pais.SelectedValue));
                com.Parameters.AddWithValue("@estado", emp_dadoscadastrais_estado.SelectedValue.ToString());
                if (emp_dadoscadastrais_dropgrupo.SelectedValue != "0")
                { com.Parameters.AddWithValue("@grupo", int.Parse(emp_dadoscadastrais_dropgrupo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@grupo", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (emp_dadoscadastrais_nometext.Text.ToString() != comp)
                            if (emp_dadoscadastrais_razaosocial.Text.ToString() != comp)
                                if (emp_dadoscadastrais_segmento.SelectedValue != "0")
                                {
                                    exibe_mensagem_empresa(1, "atualização feito com sucesso!");
                                    com.ExecuteNonQuery();
                                }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(1, "atualização feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_empresa(1, "atualização feito com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                }
            }
        }

        /* ADIÇÃO DE NOVO STATUS ------ ABA HAVIK */

        protected void Button7_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                string comp = "0";
                string sessao = "0";
                int id_empresa = 0;
                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_emp_status", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                com.Parameters.AddWithValue("@id_status", emp_havik_dropstatus.SelectedValue);
                //if (emp_havik_dropsubstatus.SelectedIndex != 0)
                //{
                //    com.Parameters.AddWithValue("@id_substatus", emp_havik_dropsubstatus.SelectedValue);
                //}
                //else { com.Parameters.AddWithValue("@id_substatus", null); }
                com.Parameters.AddWithValue("@obs", emp_havik_observacoes.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);
                if ((emp_havik_textdata.Text != "") && (emp_havik_textdata.Text.Length == 8))
                {
                    string valor = emp_havik_textdata.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(2, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@dt_agendada", data);
                    }
                }
                else { com.Parameters.AddWithValue("@dt_agendada", null); }
                string teste = emp_havik_texthora.Text;
                if ((emp_havik_texthora.Text != "") && (teste.Length == 5))
                { com.Parameters.AddWithValue("@hora", emp_havik_texthora.Text); }
                else { com.Parameters.AddWithValue("@hora", null); }
                if (emp_havik_drop_entrevistador.SelectedIndex != 0)
                {
                    com.Parameters.AddWithValue("@follow", int.Parse(emp_havik_drop_entrevistador.SelectedValue));
                }
                else
                {
                    com.Parameters.AddWithValue("@follow", null);
                }

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if ((emp_havik_dropstatus.SelectedValue != comp) && (valida != sessao))
                        {
                            if (((emp_havik_dropstatus.SelectedValue != "8") || (emp_havik_dropstatus.SelectedValue != "3")) &&
                                (emp_havik_textdata.Text == "") &&
                                (emp_havik_texthora.Text == "") && (emp_havik_drop_entrevistador.SelectedIndex == 0))
                            {
                                com.ExecuteNonQuery();
                                emp_havik_grid_status.DataBind();
                                exibe_mensagem_empresa(2, "cadastro feito com sucesso!");
                            }
                            else
                            {
                                if (emp_havik_dropstatus.SelectedValue != "2")
                                {
                                    com.ExecuteNonQuery();
                                    emp_havik_grid_status.DataBind();
                                    exibe_mensagem_empresa(2, "cadastro feito com sucesso!");
                                }
                                else
                                {
                                    if ((emp_havik_textdata.Text != "") &&
                                        (emp_havik_texthora.Text != "") && (emp_havik_drop_entrevistador.SelectedIndex != 0))
                                    {
                                        com.ExecuteNonQuery();
                                        emp_havik_grid_status.DataBind();
                                        exibe_mensagem_empresa(2, "cadastro feito com sucesso!");
                                    }
                                    else
                                    {
                                        exibe_mensagem_empresa(2, "favor preencher os campos obrigatórios!");
                                    }
                                    
                                }
                            }
                        }
                        else
                        {
                            exibe_mensagem_empresa(2, "cadastre a empresa ou faça uma busca!");
                        }
                }
                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(2, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }

        }

        /* CADASTRO DE FILIAL ------ ABA FILIAIS */

        protected void Button13_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                int tipotel = 0;

                SqlCommand com = new SqlCommand("sp_emp_filiais", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                if (Session["IDfilial"] != null)
                { com.Parameters.AddWithValue("@id_filial", int.Parse(Session["IDfilial"].ToString())); }
                else
                { com.Parameters.AddWithValue("@id_filial", null); }
                com.Parameters.AddWithValue("@nome", emp_filiais_nome.Text);
                com.Parameters.AddWithValue("@endereco", emp_filiais_endereco.Text);
                if (emp_filiais_numero.Text != "")
                { com.Parameters.AddWithValue("@numero", int.Parse(emp_filiais_numero.Text)); }
                else
                { com.Parameters.AddWithValue("@numero", null); }
                com.Parameters.AddWithValue("@complemento", emp_filiais_complemento.Text);
                com.Parameters.AddWithValue("@bairro", emp_filiais_bairro.Text);
                com.Parameters.AddWithValue("@cidade", emp_filiais_cidade.SelectedValue.ToString());
                com.Parameters.AddWithValue("@estado", emp_filiais_dropestado.SelectedValue.ToString());
                com.Parameters.AddWithValue("@pais", emp_filiais_droppais.SelectedValue);
                com.Parameters.AddWithValue("@cep", emp_filiais_cep.Text);
                com.Parameters.AddWithValue("@site", emp_filiais_site.Text);
                if (emp_filiais_codpais.Text != "")
                { com.Parameters.AddWithValue("@cod_pais", int.Parse(emp_filiais_codpais.Text)); }
                else
                { com.Parameters.AddWithValue("@cod_pais", null); }
                if (emp_filiais_ddd.Text != "")
                { com.Parameters.AddWithValue("@ddd", int.Parse(emp_filiais_ddd.Text)); }
                else
                { com.Parameters.AddWithValue("@ddd", null); }
                com.Parameters.AddWithValue("@tipo_tel", tipotel);  
                if (emp_filiais_telefone.Text != "")
                { com.Parameters.AddWithValue("@telefone", int.Parse(emp_filiais_telefone.Text)); }
                else
                { com.Parameters.AddWithValue("@telefone", null); }
                if (emp_filiais_cod.Text != "")
                { com.Parameters.AddWithValue("@codigo", emp_filiais_cod.Text); }
                else
                { com.Parameters.AddWithValue("@codigo", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if ((emp_filiais_nome.Text.ToString() != comp) && (emp_filiais_bairro.Text.ToString() != comp) &&
                        (emp_filiais_telefone.Text.ToString() != comp) && (emp_filiais_cod.Text.ToString() != comp) &&
                        (emp_filiais_cidade.SelectedIndex != 0) && (emp_filiais_cidade.SelectedIndex != -1) &&
                        (emp_filiais_dropestado.SelectedIndex != 0) && (valida != sessao))
                        {
                            com.ExecuteNonQuery();
                            emp_filiais_gridfiliais.DataBind();
                            emp_filiais_nome.Text = "";
                            emp_filiais_droppais.SelectedIndex = 0;
                            emp_filiais_codpais.Text = "";
                            emp_filiais_ddd.Text = "";
                            emp_filiais_telefone.Text = "";
                            emp_filiais_site.Text = "";
                            emp_filiais_cod.Text = "";
                            emp_filiais_endereco.Text = "";
                            emp_filiais_dropestado.SelectedIndex = 0;
                            emp_filiais_cidade.DataBind();
                            emp_filiais_cidade.Items.Insert(0, "Escolha a opção");
                            emp_filiais_cidade.SelectedIndex = 0;
                            emp_filiais_cep.Text = "";
                            emp_filiais_numero.Text = "";
                            emp_filiais_complemento.Text = "";
                            emp_filiais_bairro.Text = "";
                            Session["IDfilial"] = null;
                            exibe_mensagem_empresa(3, "cadastro feito com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(3, "cadastre a empresa ou faça uma busca!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastre a empresa ou faça uma busca!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(3, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        /* ATUALIZAÇÃO DE CADASTRO DE FILIAL ---------  ABA FILIAIS */

        protected void Button14_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                string comp = "";
                string valida = "null";
                int tipotel = 0;

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_filiais", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                com.Parameters.AddWithValue("@nome", emp_filiais_nome.Text);
                com.Parameters.AddWithValue("@endereco", emp_filiais_endereco.Text);
                if (emp_filiais_numero.Text != "")
                { com.Parameters.AddWithValue("@numero", int.Parse(emp_filiais_numero.Text)); }
                else
                { com.Parameters.AddWithValue("@numero", null); }
                com.Parameters.AddWithValue("@complemento", emp_filiais_complemento.Text);
                com.Parameters.AddWithValue("@bairro", emp_filiais_bairro.Text);
                if ((emp_filiais_cidade.SelectedValue != "0") && (emp_filiais_cidade.SelectedValue != ""))
                { com.Parameters.AddWithValue("@cidade", emp_filiais_cidade.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@cidade", null); }
                com.Parameters.AddWithValue("@estado", emp_filiais_dropestado.SelectedValue.ToString());
                if (emp_filiais_droppais.SelectedValue != "0")
                { com.Parameters.AddWithValue("@pais", emp_filiais_droppais.SelectedValue); }
                else { com.Parameters.AddWithValue("@pais", null); }
                com.Parameters.AddWithValue("@cep", emp_filiais_cep.Text);
                com.Parameters.AddWithValue("@site", emp_filiais_site.Text);
                if (emp_filiais_codpais.Text != "")
                { com.Parameters.AddWithValue("@cod_pais", int.Parse(emp_filiais_codpais.Text)); }
                else
                { com.Parameters.AddWithValue("@cod_pais", null); }
                if (emp_filiais_codpais.Text != "")
                { com.Parameters.AddWithValue("@ddd", int.Parse(emp_filiais_ddd.Text)); }
                else
                { com.Parameters.AddWithValue("@ddd", null); }
                com.Parameters.AddWithValue("@tipo_tel", tipotel);
                if (emp_filiais_telefone.Text != "")
                { com.Parameters.AddWithValue("@telefone", int.Parse(emp_filiais_telefone.Text)); }
                else
                { com.Parameters.AddWithValue("@telefone", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (emp_filiais_nome.Text.ToString() != comp)
                        if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            exibe_mensagem_empresa(3, "cadastro feito com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(3, "cadastre a empresa ou faça uma busca!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastre a empresa ou faça uma busca!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(3, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {

        }

        /* CADASTRO DE INFO DE MERCADO ------ ABA MERCADO */

        protected void Button25_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                //string comp = "";
                string valida = "null";

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_mercado", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                if (emp_mercado_dropnrodefuncionarios.SelectedValue != "0")
                { com.Parameters.AddWithValue("@nrofuncionarios", int.Parse(emp_mercado_dropnrodefuncionarios.SelectedValue)); }
                else { com.Parameters.AddWithValue("@nrofuncionarios", null); }
                if (emp_mercado_dropfaturamento.SelectedValue != "0")
                { com.Parameters.AddWithValue("@faturamento", int.Parse(emp_mercado_dropfaturamento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@faturamento", null); }
                if (emp_mercado_droporigem.SelectedValue != "0")
                { com.Parameters.AddWithValue("@origem", int.Parse(emp_mercado_droporigem.SelectedValue)); }
                else { com.Parameters.AddWithValue("@origem", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if ((int.Parse(emp_mercado_droporigem.SelectedValue) != 0) && (valida != sessao))
                        {
                            com.ExecuteNonQuery();
                            exibe_mensagem_empresa(4, "atualização feita com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(4, "cadastre a empresa ou faça uma busca!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastre a empresa ou faça uma busca!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(4, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        /* INCLUSÃO DE NOTÍCIA -------- ABA MERCADO */

        protected void Button17_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                string comp = "";
                string valida = "null";

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_noticias", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                com.Parameters.AddWithValue("@noticias", emp_mercado_textnoticias.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (emp_mercado_textnoticias.Text != comp)
                        if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            emp_mercado_gridnoticias.DataBind();
                            emp_mercado_textnoticias.Text = "";
                            exibe_mensagem_empresa(4, "cadastro feito com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(4, "preencha o campo faltando!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('preencha o campo faltando!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(4, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }


        

        /* INSERÇÃO DE OBSERVAÇÃO ------- ABA OBSERVAÇÕES */

        protected void Button19_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                string comp = "";
                string valida = "null";

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_obs", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                com.Parameters.AddWithValue("@obs", emp_observacoes_textobs.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if ((emp_observacoes_textobs.Text != comp) && (valida != sessao))
                        {
                            com.ExecuteNonQuery();
                            emp_gridobs.DataBind();
                            exibe_mensagem_empresa(5, "atualização feita com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(5, "preencha o campo faltando!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('preencha o campo faltando!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(5, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        /* INSERÇÃO DE CONCORRENTES ---------- ABA MERCADO */

        protected void Button15_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                string valida = "null";
                string idempresa = Request.Form[id_concorrente.UniqueID];

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_concorrentes", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                if (idempresa != "")
                { com.Parameters.AddWithValue("@concorrentes", int.Parse(idempresa)); }
                else { com.Parameters.AddWithValue("@concorrentes", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (idempresa != "")
                        if (valida != sessao)
                        {
                            if (idempresa == "")
                            {
                                exibe_mensagem_empresa(4, "escolha uma empresa da lista e/ou cadastre uma nova!");
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa da lista ou cadastre uma nova!')");
                            }
                            else
                            {
                                string sql = "Select nome from bc_empresa_unq where " + @idempresa + "= id";
                                SqlDataAdapter da = new SqlDataAdapter(sql, conexao);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                string hidenfield = "";
                                hidenfield = dt.Rows[0]["nome"].ToString();
                                if (emp_mercado_textconcorrentes.Text == hidenfield)
                                {
                                    com.ExecuteNonQuery();
                                    emp_mercado_listconcorrentes.DataBind();
                                    exibe_mensagem_empresa(4, "atualização feita com sucesso!");
                                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                                    id_concorrente.Value = "";
                                    valida = rowCount.Value.ToString();
                                }
                                else 
                                {
                                    exibe_mensagem_empresa(4, "escolha uma empresa da lista e/ou cadastre uma nova!");
                                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa da lista ou cadastre uma nova!')"); 
                                }
                                if (valida != "0")
                                {
                                    Session["IDcliente"] = rowCount.Value;
                                    exibe_mensagem_empresa(4, "cadastro feito com sucesso!");
                                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                                }
                                else 
                                {
                                    exibe_mensagem_empresa(4, "cadastro feito sem sucesso!");
                                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                                }
                            }

                        }
                        else
                        {
                            exibe_mensagem_empresa(4, "preencha o campo faltando e/ou cadastre uma empresa!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('preencha o campo faltando ou cadastre uma empresa!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(4, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        /* INSERÇÃO DE DADOS FINANCEIROS ---------- ABA FINANCEIRO */

        protected void Button26_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                string valida = "null";
                string valor_retainer = emp_financeiro_textretainer.Text;
                string retainer = valor_retainer.Replace(".", "");
                //retainer = retainer.Replace(",", ".");
                string valor_sucesso = emp_financeiro_textsucesso.Text;
                string sucesso = valor_sucesso.Replace(".", "");
                //sucesso = sucesso.Replace(",", ".");

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_financeiro", con);
                com.CommandType = CommandType.StoredProcedure;



                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                if (emp_financeiro_textsucesso.Text != "")
                { com.Parameters.AddWithValue("@sucesso", float.Parse(sucesso)); }
                else
                { com.Parameters.AddWithValue("@sucesso", null); }
                if (emp_financeiro_textretainer.Text != "")
                { com.Parameters.AddWithValue("@retainer", float.Parse(retainer)); }
                else
                { com.Parameters.AddWithValue("@retainer", null); }
                if (emp_financeiro_textprimeiraparcela.Text != "")
                { com.Parameters.AddWithValue("@parcela_1", float.Parse(emp_financeiro_textprimeiraparcela.Text) / 100); }
                else
                { com.Parameters.AddWithValue("@parcela_1", null); }
                if (emp_financeiro_textsegundaparcela.Text != "")
                { com.Parameters.AddWithValue("@parcela_2", float.Parse(emp_financeiro_textsegundaparcela.Text) / 100); }
                else
                { com.Parameters.AddWithValue("@parcela_2", null); }
                if (emp_financeiro_texterceiraparcela.Text != "")
                { com.Parameters.AddWithValue("@parcela_3", float.Parse(emp_financeiro_texterceiraparcela.Text) / 100); }
                else
                { com.Parameters.AddWithValue("@parcela_3", null); }
                if (emp_financeiro_radiopagamento.SelectedValue != "0")
                { com.Parameters.AddWithValue("@pagamento", int.Parse(emp_financeiro_radiopagamento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@pagamento", null); }
                if (emp_financeiro_dropvencimento.SelectedValue != "0")
                { com.Parameters.AddWithValue("@vencimento", int.Parse(emp_financeiro_dropvencimento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@vencimento", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                        if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            exibe_mensagem_empresa(6, "atualização feita com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(6, "preencha o campo faltando ou cadastre uma empresa!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('preencha o campo faltando ou cadastre uma empresa!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(6, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        /* INCLUSÃO DE IMPOSTOS ------------- ABA FINANCEIRO */

        protected void Button21_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                string valida = "null";

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_fin_impostos", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                if (emp_financeiro_dropimpostos.SelectedValue != "0")
                { com.Parameters.AddWithValue("@imposto", int.Parse(emp_financeiro_dropimpostos.SelectedValue)); }
                else { com.Parameters.AddWithValue("@imposto", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (int.Parse(emp_financeiro_dropimpostos.SelectedValue) != 0)
                        if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            emp_financeiro_listimpostos.DataBind();
                            exibe_mensagem_empresa(6, "cadastro feito com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(6, "preencha o campo faltando ou cadastre uma empresa!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('preencha o campo faltando ou cadastre uma empresa!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(6, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }

        }

        /* INSERÇÃO E ATUALIZAÇÃO DE PARTICULARIDADES ------------------ ABA FINANCEIRO */

        protected void Button22_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string campo = "";
                string sessao = "0";
                string valida = "null";

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_fin_particularidades", con);
                com.CommandType = CommandType.StoredProcedure;

                if (emp_financeiro_textparticularidades.Text != campo) //verificação de campo vazio
                { i = 2; }

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                if (emp_financeiro_textparticularidades.Text != "")
                { com.Parameters.AddWithValue("@particularidades", emp_financeiro_textparticularidades.Text); }
                else { com.Parameters.AddWithValue("@particularidades", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (emp_financeiro_textparticularidades.Text != campo)
                        if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            exibe_mensagem_empresa(6, "atualização feita com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(6, "preencha o campo faltando ou cadastre uma empresa!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('preencha o campo faltando ou cadastre uma empresa!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(6, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }

        }

        /* PREENCHIMENTO DO CAMPO DE OBSERVAÇÕES ANTERIORES ------------------ ABA OBSERVAÇÕES */

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            emp_observacoes_textobs.Text = emp_gridobs.DataKeys[emp_gridobs.SelectedIndex].Value.ToString();
            //emp_observacoes_textobs.Text = emp_gridobs.SelectedRow.DataItem("obs").ToString();
            //emp_observacoes_textobs.Text = emp_gridobs.DataKeyNames["ob
            //emp_observacoes_textobs.Text = emp_gridobs.SelectedRow.Cells[2].Text;
            emp_gridobs.DataBind();
        }

        /* LIMPEZA DE OBSERVAÇÕES ----------------- ABA OBSERVAÇÕES */

        protected void Button20_Click(object sender, EventArgs e)
        {
            emp_observacoes_textobs.Text = "";
        }

        /* INSERÇÃO DE OFF LIMITS ----------------- ABA OBSERVAÇÕES */

        protected void Button2_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string campo = "";
                string sessao = "0";
                string valida = "null";

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_offlimits", con);
                com.CommandType = CommandType.StoredProcedure;

                if (emp_financeiro_textparticularidades.Text != campo) //verificação de campo vazio
                { i = 2; }

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                com.Parameters.AddWithValue("@offlimits", int.Parse(emp_dadoscadastrais_radioofflimits.SelectedValue));
                com.Parameters.AddWithValue("@id_area", int.Parse(emp_dadoscadastrais_areaofflimits.SelectedValue));
                com.Parameters.AddWithValue("@dt_ini", null);
                com.Parameters.AddWithValue("@dt_fim", null);
                if (emp_financeiro_dropkeyaccount.SelectedValue != "0")
                { com.Parameters.AddWithValue("@keyaccount", int.Parse(emp_financeiro_dropkeyaccount.SelectedValue)); }
                else { com.Parameters.AddWithValue("@keyaccount", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (//(emp_dadoscadastrais_radioofflimits.SelectedValue != "3") && (emp_dadoscadastrais_areaofflimits.SelectedValue != "0") && 
                        (valida != sessao))
                            {
                                com.ExecuteNonQuery();
                                emp_grid_offlimits.DataBind();
                                exibe_mensagem_empresa(1, "atualização feita com sucesso!");
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                            }
                            else
                            {
                                exibe_mensagem_empresa(1, "preencha o campo faltando ou cadastre uma empresa!");
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('preencha o campo faltando ou cadastre uma empresa!')"); 
                            }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(1, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        protected void emp_mercado_gridnoticias_SelectedIndexChanged(object sender, EventArgs e)
        {
            emp_mercado_textnoticias.Text = emp_mercado_gridnoticias.DataKeys[0].Value.ToString();
            emp_mercado_gridnoticias.DataBind();
        }

        /* SALVAR CONTRATO ----------- ABA FINANCEIRO */

        protected void Button23_Click(object sender, EventArgs e)
        {
            string savepath = @"\\servidor01\Publico\uploads\contrato";
            string tipo_conteudo = "";
            int id_empresa = 0;
            int id_usuario = int.Parse(Session["IDusuario"].ToString());

            if (Session["IDempresa"] != null)
            { id_empresa = int.Parse(Session["IDempresa"].ToString()); }

            if (Upload_Contrato.HasFile)
            {
                if ((Session["IDempresa"].ToString() != "") && (Session["IDempresa"] != null))
                {
                    string filename = Session["IDempresa"].ToString();
                    string tipo = Upload_Contrato.PostedFile.FileName.Substring(Upload_Contrato.PostedFile.FileName.LastIndexOf(".") + 1);
                    if ((tipo == "doc") || (tipo == "docx") || (tipo == "pdf"))
                    {
                        filename = filename + "_" + emp_financeiro_contrato.SelectedItem.ToString() + "." + tipo;
                        Byte[] bytes = Upload_Contrato.FileBytes;
                        //Upload_Curriculum.SaveAs(savepath);                                       
                        if ((tipo == "doc") || (tipo == "docx"))
                        { tipo_conteudo = "application/vnd.ms-word"; }
                        else { tipo_conteudo = "application/pdf"; }


                        string cstr = conexao;
                        using (SqlConnection con = new SqlConnection(cstr))
                        {
                            con.Open();

                            SqlCommand com = new SqlCommand("sp_emp_contrato", con);
                            com.CommandType = CommandType.StoredProcedure;

                            com.Parameters.AddWithValue("@tipo", 1);
                            com.Parameters.AddWithValue("@id_empresa", id_empresa);
                            com.Parameters.AddWithValue("@nome_arquivo", filename);
                            com.Parameters.AddWithValue("@tipo_arquivo", tipo_conteudo);
                            if (emp_financeiro_contrato.SelectedIndex != 0)
                            { com.Parameters.AddWithValue("@idioma", int.Parse(emp_financeiro_contrato.SelectedValue.ToString())); }
                            else { com.Parameters.AddWithValue("@idioma", null); }
                            com.Parameters.AddWithValue("@caminho", savepath);
                            com.Parameters.AddWithValue("@contrato", null);
                            com.Parameters.AddWithValue("@dados", bytes);
                            com.Parameters.AddWithValue("@usuario", id_usuario);


                            SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                            rowCount.Direction = ParameterDirection.Output;

                            com.ExecuteNonQuery();
                            exibe_mensagem_empresa(6, "cadastro feito com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                        }          

                        if (emp_financeiro_contrato.SelectedValue == "0")
                        {
                            exibe_mensagem_empresa(6, "cadastro feito sem sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')");
                        }
                    }
                }
            }
        }

        //ABRIR CONTRATO

        protected void Button24_Click(object sender, EventArgs e)
        {
            string strQuery = "SELECT nome_arquivo, tipo_arquivo, dados FROM bc_emp_contrato where id_empresa=@id_empresa and idioma=@idioma";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@id_empresa", int.Parse(Session["IDempresa"].ToString()));
            cmd.Parameters.Add("@idioma", int.Parse(emp_financeiro_contrato.SelectedValue).ToString());
            DataTable dt = GetData(cmd);
            //string teste = dt.Rows[0]["dados"].ToString();
            if ((dt != null) && (dt.Rows.Count != 0))
            {
                download(dt);
            }
            else 
            {
                exibe_mensagem_empresa(6, "contrato não cadastrado na base!");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('contrato não cadastrado na base!')"); 
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
            Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["nome_arquivo"].ToString());
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void grid_busca_empresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                limpar_dados_empresa();
                Session["label_modulo"] = retorno_empresa.Rows[0].Cells[3].Text.ToString();

                Session["IDempresa"] = grid_busca_empresa.SelectedRow.Cells[1].Text.ToString();
                int id_empresa = int.Parse(Session["IDempresa"].ToString());

                //PREENCHE A LABEL EM DADOS CADASTRAIS DE EMPRESA

                if (Session["IDempresa"] != null)
                {
                    emp_dadoscadastrasi_label_id.Text = "ID: " + Session["IDempresa"].ToString();
                }
                else
                { emp_dadoscadastrasi_label_id.Text = ""; }

                SqlCommand com = new SqlCommand("sp_retorno_empresa", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_empresa", id_empresa);

                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(retorno_grid_empresa);
                Session["retorno_empresa"] = retorno_grid_empresa;

                //PREENCHE O A LINHA SELECIONADA COM NEGRITO
                
                if (Session["grid_busca_empresa"] != null)
                {
                    grid_busca_empresa.DataSource = Session["grid_busca_empresa"];
                    grid_busca_empresa.DataBind();
                    foreach (GridViewRow row in grid_busca_empresa.Rows)
                    {
                        if (Session["IDempresa"] != null)
                        {
                            if (Session["IDempresa"].ToString() == grid_busca_empresa.DataKeys[row.RowIndex].Values["id_empresa"].ToString())
                            {
                                grid_busca_empresa.Rows[row.RowIndex].Font.Bold = true;
                            }
                        }
                    }
                }

                if (Session["retorno_empresa"] != null)
                {
                    retorno_empresa.DataSource = Session["retorno_empresa"];
                    retorno_empresa.DataBind();
                    if (retorno_empresa.Rows[0].Cells[3].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_nometext.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[3].Text.ToString()); }
                    else { emp_dadoscadastrais_nometext.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[2].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_razaosocial.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[2].Text); }
                    else { emp_dadoscadastrais_razaosocial.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[1].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_cnpj.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[1].Text); }
                    else { emp_dadoscadastrais_cnpj.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[5].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_endereco.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[5].Text); }
                    else { emp_dadoscadastrais_endereco.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[12].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_cep.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[12].Text); }
                    else { emp_dadoscadastrais_cep.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[6].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_numero.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[6].Text); }
                    else { emp_dadoscadastrais_numero.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[14].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_codpais.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[14].Text); }
                    else { emp_dadoscadastrais_codpais.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[15].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_ddd.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[15].Text); }
                    else { emp_dadoscadastrais_ddd.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[17].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_telefone.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[17].Text); }
                    else { emp_dadoscadastrais_telefone.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[7].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_complemento.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[7].Text); }
                    else { emp_dadoscadastrais_complemento.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[8].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_bairro.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[8].Text); }
                    else { emp_dadoscadastrais_bairro.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[18].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_email.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[18].Text); }
                    else { emp_dadoscadastrais_email.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[13].Text.ToString() != "&nbsp;")
                    { emp_dadoscadastrais_site.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[13].Text); }
                    else { emp_dadoscadastrais_site.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[11].Text == "&nbsp;")
                    { emp_dadoscadastrais_radioofflimits.SelectedValue = "3"; }
                    else { emp_dadoscadastrais_radioofflimits.SelectedValue = retorno_empresa.Rows[0].Cells[11].Text; }
                    if (retorno_empresa.Rows[0].Cells[4].Text != "&nbsp;")
                        if (emp_dadoscadastrais_segmento.SelectedIndex == 0)
                        { emp_dadoscadastrais_segmento.SelectedValue = retorno_empresa.Rows[0].Cells[4].Text; }
                    if (retorno_empresa.Rows[0].Cells[21].Text != "&nbsp;")
                        if (emp_dadoscadastrais_pais.SelectedIndex == 0)
                        { emp_dadoscadastrais_pais.SelectedValue = retorno_empresa.Rows[0].Cells[21].Text; }
                    if (retorno_empresa.Rows[0].Cells[10].Text != "&nbsp;")
                    {
                        emp_dadoscadastrais_estado.SelectedValue = retorno_empresa.Rows[0].Cells[10].Text;
                        emp_dadoscadastrais_dropcidade.DataBind();
                        emp_dadoscadastrais_dropcidade.Items.Insert(0, "Ecolha a opção");
                        if (retorno_empresa.Rows[0].Cells[9].Text != "&nbsp;")
                        {
                            emp_dadoscadastrais_dropcidade.SelectedValue = retorno_empresa.Rows[0].Cells[9].Text;
                        }
                        else { emp_dadoscadastrais_dropcidade.SelectedIndex = 0; }
                    }
                    if (retorno_empresa.Rows[0].Cells[23].Text.ToString() != "&nbsp;")
                    { emp_financeiro_textsucesso.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[23].Text); }
                    else { emp_financeiro_textsucesso.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[24].Text.ToString() != "&nbsp;")
                    { emp_financeiro_textretainer.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[24].Text); }
                    else { emp_financeiro_textretainer.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[25].Text.ToString() != "&nbsp;")
                    { emp_financeiro_textprimeiraparcela.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[25].Text); }
                    else { emp_financeiro_textprimeiraparcela.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[26].Text.ToString() != "&nbsp;")
                    { emp_financeiro_textsegundaparcela.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[26].Text); }
                    else { emp_financeiro_textsegundaparcela.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[27].Text.ToString() != "&nbsp;")
                    { emp_financeiro_texterceiraparcela.Text = HttpUtility.HtmlDecode(retorno_empresa.Rows[0].Cells[27].Text); }
                    else { emp_financeiro_texterceiraparcela.Text = ""; }
                    if (retorno_empresa.Rows[0].Cells[28].Text != "&nbsp;")
                    { emp_financeiro_radiopagamento.SelectedValue = retorno_empresa.Rows[0].Cells[28].Text; }
                    else { emp_financeiro_radiopagamento.SelectedValue = "3"; }


                    if (retorno_empresa.Rows[0].Cells[29].Text != "&nbsp;")
                    {
                        emp_financeiro_dropvencimento.DataBind();
                        emp_financeiro_dropvencimento.SelectedValue = retorno_empresa.Rows[0].Cells[29].Text;
                    }


                    if (retorno_empresa.Rows[0].Cells[22].Text != "&nbsp;")
                    {
                        emp_financeiro_dropkeyaccount.DataBind();
                        emp_financeiro_dropkeyaccount.SelectedValue = retorno_empresa.Rows[0].Cells[22].Text;
                    }

                    if (retorno_empresa.Rows[0].Cells[30].Text != "&nbsp;")
                    {
                        emp_mercado_dropnrodefuncionarios.DataBind();
                        emp_mercado_dropnrodefuncionarios.SelectedValue = retorno_empresa.Rows[0].Cells[30].Text;
                    }

                    if (retorno_empresa.Rows[0].Cells[32].Text != "&nbsp;")
                    {
                        emp_mercado_droporigem.DataBind();
                        emp_mercado_droporigem.SelectedValue = retorno_empresa.Rows[0].Cells[32].Text;
                    }
                    if (retorno_empresa.Rows[0].Cells[31].Text != "&nbsp;")
                    {
                        emp_mercado_dropfaturamento.DataBind();
                        emp_mercado_dropfaturamento.SelectedValue = retorno_empresa.Rows[0].Cells[31].Text;
                    }
                    if (retorno_empresa.Rows[0].Cells[33].Text != "&nbsp;")
                    {
                        emp_dadoscadastrais_dropgrupo.SelectedValue = retorno_empresa.Rows[0].Cells[33].Text;
                    }

                    //Session["retorno_empresa"] = null;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_empresa = 0;
                string sessao = "0";
                //string comp = "";
                string valida = "null";

                if (Session["IDempresa"] != null)
                { id_empresa = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_emp_mercado", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                if (emp_mercado_dropnrodefuncionarios.SelectedValue != "0")
                { com.Parameters.AddWithValue("@nrofuncionarios", int.Parse(emp_mercado_dropnrodefuncionarios.SelectedValue)); }
                else { com.Parameters.AddWithValue("@nrofuncionarios", null); }
                if (emp_mercado_dropfaturamento.SelectedValue != "0")
                { com.Parameters.AddWithValue("@faturamento", int.Parse(emp_mercado_dropfaturamento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@faturamento", null); }
                if (emp_mercado_droporigem.SelectedValue != "0")
                { com.Parameters.AddWithValue("@origem", int.Parse(emp_mercado_droporigem.SelectedValue)); }
                else { com.Parameters.AddWithValue("@origem", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (int.Parse(emp_mercado_droporigem.SelectedValue) != 0)
                        if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            exibe_mensagem_empresa(4, "atualização feita com sucesso!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('atualização feita com sucesso!')");
                        }
                        else
                        {
                            exibe_mensagem_empresa(4, "cadastre a empresa ou faça uma busca!");
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastre a empresa ou faça uma busca!')"); 
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(4, "cadastro feito sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); 
                    }
                }
            }
        }

        protected void emp_contato_grid_contatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDcliente"] = emp_contato_grid_contatos.SelectedRow.Cells[1].Text.ToString();
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
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void emp_projeto_grid_projetos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                //int selecao = emp_projeto_grid_projetos.SelectedIndex;
                //Session["IDprojeto"] = emp_projeto_grid_projetos.Rows[selecao].Cells[1].Text;
                GridViewRow row = emp_projeto_grid_projetos.Rows[emp_projeto_grid_projetos.SelectedIndex];
                Session["IDprojeto"] = row.Cells[1].Text;
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);



                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(retorno_projeto);
                Session["retorno_projeto"] = retorno_projeto;
                Response.Redirect("Projeto.aspx");
            }
        }

        protected void emp_filiais_gridfiliais_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = emp_filiais_gridfiliais.Rows[emp_filiais_gridfiliais.SelectedIndex];

            //emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cep"].toString();

            //if (row.Cells[2].Text != "")
            //{ emp_filiais_nome.Text = HttpUtility.HtmlDecode(row.Cells[2].Text); }
            //else { emp_filiais_nome.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["filial"].ToString() != "")
            { emp_filiais_nome.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["filial"].ToString()); }
            else { emp_filiais_nome.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["id"].ToString() != "")
            { Session["IDfilial"] = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["id"].ToString()); }
            else { Session["IDfilial"] = null; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["endereco"].ToString() != "")
            { emp_filiais_endereco.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["endereco"].ToString()); }
            else { emp_filiais_endereco.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["codigo"].ToString() != "")
            { emp_filiais_cod.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["codigo"].ToString()); }
            else { emp_filiais_cod.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cod_pais"].ToString() != "")
            { emp_filiais_codpais.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cod_pais"].ToString()); }
            else { emp_filiais_codpais.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["ddd"].ToString() != "")
            { emp_filiais_ddd.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["ddd"].ToString()); }
            else { emp_filiais_ddd.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["telefone"].ToString() != "")
            { emp_filiais_telefone.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["telefone"].ToString()); }
            else { emp_filiais_telefone.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["site"].ToString() != "")
            { emp_filiais_site.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["site"].ToString()); }
            else { emp_filiais_site.Text = ""; }
            
            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cep"].ToString() != "")
            { emp_filiais_cep.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cep"].ToString()); }
            else { emp_filiais_cep.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["numero"].ToString() != "")
            { emp_filiais_numero.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["numero"].ToString()); }
            else { emp_filiais_numero.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["complemento"].ToString() != "")
            { emp_filiais_complemento.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["complemento"].ToString()); }
            else { emp_filiais_complemento.Text = ""; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["bairro"].ToString() != "")
            { emp_filiais_bairro.Text = HttpUtility.HtmlDecode(emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["bairro"].ToString()); }
            else { emp_filiais_bairro.Text = ""; }

            if ((emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["estado"].ToString() != "") && (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["estado"].ToString() != "0"))
            {
                emp_filiais_dropestado.SelectedValue = emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["estado"].ToString();
                emp_filiais_cidade.DataBind();
                if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cidade"].ToString() != "0" &&
                    emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cidade"].ToString() != "1")
                {
                    emp_filiais_cidade.SelectedValue = emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cidade"].ToString();
                }
                else 
                { 
                    //emp_filiais_cidade.SelectedValue = "000000"; 
                    emp_filiais_cidade.SelectedIndex = 0;
                }
            }
            else { emp_filiais_dropestado.SelectedValue = "0"; }

            if (emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["pais"].ToString() != "")
            { emp_filiais_droppais.SelectedValue = emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["pais"].ToString(); }
            else { emp_filiais_droppais.SelectedValue = "0"; }
        }

        protected void limpar_dados_empresa()
        {

            Session["IDempresa"] = null;
            emp_dadoscadastrais_nometext.Text = "";
            emp_dadoscadastrais_cnpj.Text = "";
            emp_dadoscadastrais_endereco.Text = "";
            emp_dadoscadastrais_cep.Text = "";
            emp_dadoscadastrais_numero.Text = "";
            emp_dadoscadastrais_codpais.Text = "";
            emp_dadoscadastrais_ddd.Text = "";
            emp_dadoscadastrais_telefone.Text = "";
            emp_dadoscadastrais_email.Text = "";
            emp_dadoscadastrais_dropgrupo.SelectedValue = "0";
            emp_dadoscadastrais_razaosocial.Text = "";
            emp_dadoscadastrais_segmento.SelectedValue = "0";
            emp_dadoscadastrais_pais.SelectedValue = "0";
            emp_dadoscadastrais_estado.SelectedValue = "0";
            emp_dadoscadastrais_dropcidade.DataBind();
            emp_dadoscadastrais_complemento.Text = "";
            emp_dadoscadastrais_bairro.Text = "";
            emp_dadoscadastrais_site.Text = "";
            emp_dadoscadastrais_radioofflimits.SelectedValue = "3";
            emp_dadoscadastrais_data_ini.Text = "";
            emp_dadoscadastrais_data_fim.Text = "";
            emp_financeiro_dropkeyaccount.SelectedValue = "0";
            //emp_dadoscadastrais_areaofflimits.SelectedValue = "0";

            emp_havik_dropstatus.SelectedValue = "0";
            //emp_havik_dropsubstatus.DataBind();
            emp_havik_observacoes.Text = "";

            emp_filiais_nome.Text = "";
            emp_filiais_droppais.SelectedValue = "0";
            emp_filiais_codpais.Text = "";
            emp_filiais_ddd.Text = "";
            emp_filiais_telefone.Text = "";
            emp_filiais_site.Text = "";
            emp_filiais_endereco.Text = "";
            emp_filiais_dropestado.SelectedValue = "0";
            emp_filiais_cidade.DataBind();
            emp_filiais_cep.Text = "";
            emp_filiais_numero.Text = "";
            emp_filiais_complemento.Text = "";
            emp_filiais_bairro.Text = "";

            emp_mercado_dropnrodefuncionarios.SelectedValue = "0";
            emp_mercado_dropfaturamento.SelectedValue = "0";
            emp_mercado_droporigem.SelectedValue = "0";
            emp_mercado_textconcorrentes.Text = "";
            emp_mercado_textnoticias.Text = "";

            emp_observacoes_textobs.Text = "";

            emp_financeiro_textsucesso.Text = "";
            emp_financeiro_textretainer.Text = "";
            emp_financeiro_textprimeiraparcela.Text = "";
            emp_financeiro_textsegundaparcela.Text = "";
            emp_financeiro_texterceiraparcela.Text = "";
            emp_financeiro_dropimpostos.SelectedValue = "0";
            emp_financeiro_dropvencimento.SelectedValue = "0";
            emp_financeiro_radiopagamento.SelectedValue = "3";
            emp_financeiro_textparticularidades.Text = "";
            
            Session["label_modulo"] = "";

        }

        protected void limpar_modulo_empresa()
        {

            Session["IDempresa"] = null;
            emp_dadoscadastrais_nometext.Text = "";
            emp_dadoscadastrais_cnpj.Text = "";
            emp_dadoscadastrais_endereco.Text = "";
            emp_dadoscadastrais_cep.Text = "";
            emp_dadoscadastrais_numero.Text = "";
            emp_dadoscadastrais_codpais.Text = "";
            emp_dadoscadastrais_ddd.Text = "";
            emp_dadoscadastrais_telefone.Text = "";
            emp_dadoscadastrais_email.Text = "";
            emp_dadoscadastrais_dropgrupo.SelectedValue = "0";
            emp_dadoscadastrais_razaosocial.Text = "";
            emp_dadoscadastrais_segmento.SelectedValue = "0";
            emp_dadoscadastrais_pais.SelectedValue = "0";
            emp_dadoscadastrais_estado.SelectedValue = "0";
            emp_dadoscadastrais_dropcidade.DataBind();
            emp_dadoscadastrais_complemento.Text = "";
            emp_dadoscadastrais_bairro.Text = "";
            emp_dadoscadastrais_site.Text = "";
            emp_dadoscadastrais_radioofflimits.SelectedValue = "3";
            emp_dadoscadastrais_data_ini.Text = "";
            emp_dadoscadastrais_data_fim.Text = "";
            emp_financeiro_dropkeyaccount.SelectedValue = "0";
            //emp_dadoscadastrais_areaofflimits.SelectedValue = "0";

            emp_havik_dropstatus.SelectedValue = "0";
            //emp_havik_dropsubstatus.DataBind();
            emp_havik_observacoes.Text = "";

            emp_filiais_nome.Text = "";
            emp_filiais_droppais.SelectedValue = "0";
            emp_filiais_codpais.Text = "";
            emp_filiais_ddd.Text = "";
            emp_filiais_telefone.Text = "";
            emp_filiais_site.Text = "";
            emp_filiais_endereco.Text = "";
            emp_filiais_dropestado.SelectedValue = "0";
            emp_filiais_cidade.DataBind();
            emp_filiais_cep.Text = "";
            emp_filiais_numero.Text = "";
            emp_filiais_complemento.Text = "";
            emp_filiais_bairro.Text = "";

            emp_mercado_dropnrodefuncionarios.SelectedValue = "0";
            emp_mercado_dropfaturamento.SelectedValue = "0";
            emp_mercado_droporigem.SelectedValue = "0";
            emp_mercado_textconcorrentes.Text = "";
            emp_mercado_textnoticias.Text = "";

            emp_observacoes_textobs.Text = "";

            emp_financeiro_textsucesso.Text = "";
            emp_financeiro_textretainer.Text = "";
            emp_financeiro_textprimeiraparcela.Text = "";
            emp_financeiro_textsegundaparcela.Text = "";
            emp_financeiro_texterceiraparcela.Text = "";
            emp_financeiro_dropimpostos.SelectedValue = "0";
            emp_financeiro_dropvencimento.SelectedValue = "0";
            emp_financeiro_radiopagamento.SelectedValue = "3";
            emp_financeiro_textparticularidades.Text = "";

            Session["retorno_empresa"] = null;
            retorno_empresa.DataSource = Session["retorno_empresa"];
            retorno_empresa.DataBind();

            Session["label_modulo"] = "";

        }

        protected void emp_dadoscadastrais_limpar_Click(object sender, EventArgs e)
        {
            limpar_modulo_empresa();
        }

        protected void menuEmpresa_MenuItemClick(object sender, MenuEventArgs e)
        {
            int indice = int.Parse(e.Item.Value);
            menuEmpresa.Items[indice].Selected = true;
        }

        /*INCURSÃO DE SELEÇÃO NO GRID ------------------------------ ABA PROJETO */

        protected void emp_projeto_grid_projetos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.emp_projeto_grid_projetos, "Select$" + e.Row.RowIndex);
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            for (int i = 0; i < this.emp_projeto_grid_projetos.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.emp_projeto_grid_projetos.UniqueID, "Select$" + i);                
            }
            for (int i = 0; i < this.emp_gridobs.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.emp_gridobs.UniqueID, "Select$" + i);
            }
            base.Render(writer);
        }

        /*INCURSÃO DE OBSERVAÇÕES NO TEXTBOX ------------------------------- ABA OBSERVAÇÕES */

        protected void emp_gridobs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.emp_gridobs, "Select$" + e.Row.RowIndex);
            }
        }

        //EXCLUSÃO DE ITENS DO GRID DE OFFLIMITS --------------------------------- ABA DADOS CADASTRAIS

        protected void emp_grid_offlimits_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDempresa"] != null)
                { id_cliente = int.Parse(Session["IDempresa"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_offlimits = 0;

                SqlCommand com = new SqlCommand("sp_altera_emp_offlimits", con);
                com.CommandType = CommandType.StoredProcedure;

                //GridViewRow row = cli_dadoscadastrais_gridtelefone.Rows[cli_dadoscadastrais_gridtelefone.SelectedIndex];
                //id_telefone = int.Parse(row.Cells[1].Text);
                id_offlimits = int.Parse(emp_grid_offlimits.DataKeys[emp_grid_offlimits.SelectedIndex].Values["id"].ToString());

                com.Parameters.AddWithValue("@id", id_offlimits);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        emp_grid_offlimits.DataBind();
                        exibe_mensagem_empresa(1, "exclusão feita com sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                    }
                    else
                    {
                        exibe_mensagem_empresa(1, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_empresa(1, "exclusão feita sem sucesso!");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita sem sucesso!')"); 
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_empresa(1, "exclusão feita com sucesso!");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('exclusão feita com sucesso!')");
                }
            }
        }

        protected void exibe_mensagem_empresa(int indice, string mensagem)
        {
            int i = indice;
            string msg = mensagem;
            switch (i)
            {
                case 1:
                    //tratamento para dados cadastrais
                    mensagem_emp_dadoscadastrais.Text = msg;
                    mensagem_emp_havik.Text = "";
                    mensagem_emp_filiais.Text = "";
                    mensagem_emp_mercado.Text = "";
                    mensagem_emp_observacoes.Text = "";
                    mensagem_emp_financeiro.Text = "";
                    break;
                case 2:
                    //tratamento para havik
                    mensagem_emp_dadoscadastrais.Text = "";
                    mensagem_emp_havik.Text = msg;
                    mensagem_emp_filiais.Text = "";
                    mensagem_emp_mercado.Text = "";
                    mensagem_emp_observacoes.Text = "";
                    mensagem_emp_financeiro.Text = "";
                    break;
                case 3:
                    //tratamento para filiais
                    mensagem_emp_dadoscadastrais.Text = "";
                    mensagem_emp_havik.Text = "";
                    mensagem_emp_filiais.Text = msg;
                    mensagem_emp_mercado.Text = "";
                    mensagem_emp_observacoes.Text = "";
                    mensagem_emp_financeiro.Text = "";
                    break;
                case 4:
                    //tratamento para mercado
                    mensagem_emp_dadoscadastrais.Text = "";
                    mensagem_emp_havik.Text = "";
                    mensagem_emp_filiais.Text = "";
                    mensagem_emp_mercado.Text = msg;
                    mensagem_emp_observacoes.Text = "";
                    mensagem_emp_financeiro.Text = "";
                    break;
                case 5:
                    //tratamento para observacoes
                    mensagem_emp_dadoscadastrais.Text = "";
                    mensagem_emp_havik.Text = "";
                    mensagem_emp_filiais.Text = "";
                    mensagem_emp_mercado.Text = "";
                    mensagem_emp_observacoes.Text = msg;
                    mensagem_emp_financeiro.Text = "";
                    break;
                case 6:
                    //tratamento para financeiro
                    mensagem_emp_dadoscadastrais.Text = "";
                    mensagem_emp_havik.Text = "";
                    mensagem_emp_filiais.Text = "";
                    mensagem_emp_mercado.Text = "";
                    mensagem_emp_observacoes.Text = "";
                    mensagem_emp_financeiro.Text = msg;
                    break;                
                case 0:
                    //tratamento para mudança de abas
                    mensagem_emp_dadoscadastrais.Text = msg;
                    mensagem_emp_havik.Text = msg;
                    mensagem_emp_filiais.Text = msg;
                    mensagem_emp_mercado.Text = msg;
                    mensagem_emp_observacoes.Text = msg;
                    mensagem_emp_financeiro.Text = msg;
                    break;
                default:
                    break;
            }
        }

        protected void Button29_Click(object sender, EventArgs e)
        {
            emp_filiais_gridfiliais.DataBind();
            emp_filiais_nome.Text = "";
            emp_filiais_droppais.SelectedIndex = 0;
            emp_filiais_codpais.Text = "";
            emp_filiais_ddd.Text = "";
            emp_filiais_telefone.Text = "";
            emp_filiais_site.Text = "";
            emp_filiais_endereco.Text = "";
            emp_filiais_dropestado.SelectedIndex = 0;
            emp_filiais_cidade.DataBind();
            emp_filiais_cidade.Items.Insert(0, "Escolha a opção");
            emp_filiais_cidade.SelectedIndex = 0;
            emp_filiais_cep.Text = "";
            emp_filiais_numero.Text = "";
            emp_filiais_complemento.Text = "";
            emp_filiais_bairro.Text = "";
            Session["IDfilial"] = null;
        }

    }
}