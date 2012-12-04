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
    public partial class Cliente : System.Web.UI.Page
    {

        DataSet ds_busca_popup_empresa = new DataSet();
        
        DataSet retorno_grid_cliente = new DataSet();
        DataSet retorno_projeto = new DataSet();
        DataSet retorno_drop_entrevistador_follow = new DataSet();
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
              
                
        protected void Page_Load(object sender, EventArgs e)
        {
            //UM ERRO CATASTROFICO PARA O FIM DO MUNDO NO KIVAH LOKO DOIDO

            Page.Header.Title = "Havik System - Cliente";
            Page.MaintainScrollPositionOnPostBack = true;

            //PERGUNTA SHOW OU HIDDEN                     
            
            if (Session["IDusuario"] == null)
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            //CAMPOS DEFAULT DE PAIS / ESTADO / CIDADE
            
            if (!IsPostBack)
            {
                if (Session["IDcliente"] == null)
                {
                    //cli_dadoscadastrais_dropestado.SelectedValue = "35";
                    //cli_dadoscadastrais_dropestado.DataBind();
                    //cli_dadoscadastrais_dropcidade.DataBind();
                    //cli_dadoscadastrais_dropcidade.Items.Insert(0, "Escolha a opção");
                    //cli_dadoscadastrais_dropcidade.SelectedValue = "355030";
                    cli_dadoscadastrais_droppais.SelectedValue = "76";
                }
            }

            //ESCONDE O BOTAO DE CADASTRO DE EMAIL CASO NÃO HAJA CLIENTE CARREGADO

            if (Session["IDcliente"] != null)
            {
                cli_dadoscadastrais_adiciona_email.Visible = true;
            }
            else { cli_dadoscadastrais_adiciona_email.Visible = false; }

            //PREENCHE A LABEL EM DADOS CADASTRAIS DE CLIENTE

            if (Session["IDcliente"] != null)
            {
                cli_dadoscadastrais_label_id.Text = "ID: " + Session["IDcliente"].ToString();
            }
            else
            { cli_dadoscadastrais_label_id.Text = ""; }

            //RETORNO DOS DADOS DE FILIAL ------------ ABA PROFISSIONAL

            if ((Session["cliente_filial"] != null) && (Session["id_cliente_filial"] != null))
            {
                MultiView2.ActiveViewIndex = 2;
                txtPopupValue.Text = Session["cliente_filial"].ToString();
                grid_busca_cliente.DataBind();
            }

            //TRATAMENTO DE EXIBIÇÃO DOS CAMPOS RESTRITOS DE STATUS -------------- ABA HAVIK

            if (!IsPostBack)
            {
                if (Session["IDcliente"] == null)
                {
                    cli_havik_drop_projeto.DataBind();
                    cli_havik_drop_projeto.SelectedIndex = 0;
                    cli_havik_dropstatus.SelectedIndex = 0;
                    cli_havik_textdata.Enabled = false;
                    cli_havik_texthora.Enabled = false;
                    Label138.Visible = false;
                    cli_havik_drop_entrevistador.Visible = false;
                }
            }

            //VERIFICACAO DE PERSISTENCIA DE ABA

            if ((Session["persistencia_aba"] != null) && !IsPostBack)
            { 
                MultiView2.ActiveViewIndex = 4;
                Session["persistencia_aba"] = null;
            }
            else { Session["persistencia_aba"] = null; }            

            if (Session["grid_busca_cliente"] != null)
            {
                grid_busca_cliente.DataSource = Session["grid_busca_cliente"];
                grid_busca_cliente.DataBind();
                System.Drawing.Color c;

                foreach (GridViewRow row in grid_busca_cliente.Rows)
                {
                    if (grid_busca_cliente.DataKeys[row.RowIndex].Values["hexa"].ToString() != "&nbsp;")
                    {
                        c = System.Drawing.ColorTranslator.FromHtml(grid_busca_cliente.DataKeys[row.RowIndex].Values["hexa"].ToString());
                        grid_busca_cliente.Rows[row.RowIndex].BackColor = c;
                        if (Session["IDcliente"] != null)
                        {
                            if (Session["IDcliente"].ToString() == grid_busca_cliente.DataKeys[row.RowIndex].Values["id_cliente"].ToString())
                            {
                                grid_busca_cliente.Rows[row.RowIndex].Font.Bold = true;
                            }
                        }
                    }
                }
            }

            if (!IsPostBack)            
            if (Session["retorno_cliente"] != null)
            {
                retorno_cliente.DataSource = Session["retorno_cliente"];
                retorno_cliente.DataBind();

                //LIMPEZA DOS CAMPOS NÃO NECESSÁRIOS
                cli_havik_textdata.Enabled = false;
                cli_havik_texthora.Enabled = false;
                Label138.Visible = false;
                cli_havik_drop_entrevistador.Visible = false;
                
                
                if (retorno_cliente.Rows[0].Cells[1].Text != "&nbsp;")
                {
                    //TRATAMENTO DO LABEL AO TOPO DA TELA
                    //if ((Session["label_modulo"].ToString() == "") || (Session["label_modulo"].ToString() == null))
                    //{
                        Session["label_modulo"] = retorno_cliente.Rows[0].Cells[1].Text;
                        //Session["label_modulo"] = cli_dadoscadastrais_textnome.Text;
                    //}
                    
                    cli_dadoscadastrais_textnome.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[1].Text.ToString());
                }
                else { cli_dadoscadastrais_textnome.Text = ""; }
                
                if (retorno_cliente.Rows[0].Cells[6].Text != "&nbsp;")
                { 
                    cli_dadoscadastrais_textendereco.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[6].Text);
                }
                else { cli_dadoscadastrais_textendereco.Text = ""; }

                if (retorno_cliente.Rows[0].Cells[7].Text != "&nbsp;")
                {
                    cli_dadoscadastrais_textnro.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[7].Text);
                }
                else { cli_dadoscadastrais_textnro.Text = ""; }

                if (retorno_cliente.Rows[0].Cells[8].Text != "&nbsp;")
                {
                    cli_dadoscadastrais_textcomplemento.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[8].Text);
                }
                else { cli_dadoscadastrais_textcomplemento.Text = ""; }
                
                if (retorno_cliente.Rows[0].Cells[2].Text != "&nbsp;")
                { 
                    cli_dadoscadastrais_textcpf.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[2].Text.ToString());
                }
                else { cli_dadoscadastrais_textcpf.Text = ""; }

                if (retorno_cliente.Rows[0].Cells[3].Text != "&nbsp;")
                {
                    string valor = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[3].Text).ToString();
                    string conversao = valor.Replace("/", "");
                    cli_dadoscadastrais_textnascimento.Text = conversao;
                }
                else { cli_dadoscadastrais_textnascimento.Text = ""; }

                if (retorno_cliente.Rows[0].Cells[10].Text != "&nbsp;")
                { 
                    cli_dadoscadastrais_textbairro.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[10].Text.ToString());
                }
                else { cli_dadoscadastrais_textbairro.Text = ""; }

                if (retorno_cliente.Rows[0].Cells[9].Text != "&nbsp;")
                { 
                    cli_dadoscadastrais_textcep.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[9].Text);
                }
                else { cli_dadoscadastrais_textcep.Text = ""; }

                if (retorno_cliente.Rows[0].Cells[4].Text == "&nbsp;")
                { cli_dadoscadastrais_dropestadocivil.SelectedValue = "0"; }
                else 
                { 
                    cli_dadoscadastrais_dropestadocivil.SelectedValue = retorno_cliente.Rows[0].Cells[4].Text;
                }

                if (retorno_cliente.Rows[0].Cells[5].Text == "&nbsp;")
                { cli_dadoscadastrais_dropsexo.SelectedValue = "0"; }
                else 
                { 
                    cli_dadoscadastrais_dropsexo.SelectedValue = retorno_cliente.Rows[0].Cells[5].Text;
                }

                if (retorno_cliente.Rows[0].Cells[12].Text == "&nbsp;")
                { cli_dadoscadastrais_dropestado.SelectedValue = "0"; }
                else 
                {
                    cli_dadoscadastrais_dropestado.DataBind();
                    cli_dadoscadastrais_dropestado.SelectedValue = retorno_cliente.Rows[0].Cells[12].Text;
                    cli_dadoscadastrais_dropcidade.DataBind();
                    if (retorno_cliente.Rows[0].Cells[11].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_dropcidade.SelectedValue = retorno_cliente.Rows[0].Cells[11].Text;
                    }
                }
                if (retorno_cliente.Rows[0].Cells[13].Text == "&nbsp;")
                { cli_dadoscadastrais_droppais.SelectedValue = "0"; }
                else 
                { 
                    cli_dadoscadastrais_droppais.SelectedValue = retorno_cliente.Rows[0].Cells[13].Text;
                }
                
                if (retorno_cliente.Rows[0].Cells[17].Text == "&nbsp;")
                {
                    cli_hierarquia_drop_reporta.DataBind();
                    cli_hierarquia_drop_reporta.SelectedValue = "0";
                }
                else 
                {
                    cli_hierarquia_drop_reporta.DataBind();
                    cli_hierarquia_drop_reporta.SelectedValue = retorno_cliente.Rows[0].Cells[17].Text;
                }
                
                if (retorno_cliente.Rows[0].Cells[16].Text == "&nbsp;")
                {
                    cli_hierarquia_drop_reporta_a_quem.DataBind();
                    cli_hierarquia_drop_reporta_a_quem.SelectedValue = "0";
                }
                else 
                {
                    cli_hierarquia_drop_reporta_a_quem.DataBind();
                    cli_hierarquia_drop_reporta_a_quem.SelectedValue = retorno_cliente.Rows[0].Cells[16].Text;
                }
                
                if (retorno_cliente.Rows[0].Cells[18].Text != "&nbsp;")
                { 
                    cli_hierarquia_text_nro_subordinados.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[18].Text);
                }
                else { cli_hierarquia_text_nro_subordinados.Text = ""; }

                if (retorno_cliente.Rows[0].Cells[19].Text != "&nbsp;")
                { 
                    cli_hierarquia_text_subordinados_diretos.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[19].Text);
                }
                else { cli_hierarquia_text_subordinados_diretos.Text = ""; }
                if (retorno_cliente.Rows[0].Cells[20].Text != "&nbsp;")
                {
                    cli_dadoscadastrais_textnomemae.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[20].Text);
                }
                else { cli_dadoscadastrais_textnomemae.Text = ""; }
                if (retorno_cliente.Rows[0].Cells[21].Text != "&nbsp;")
                {
                    cli_dadoscadastrais_textnomepai.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[21].Text);
                }
                else { cli_dadoscadastrais_textnomepai.Text = ""; }
                if (retorno_cliente.Rows[0].Cells[22].Text != "&nbsp;")
                {
                    cli_dadoscadastrais_textrg.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[22].Text);
                }
                else { cli_dadoscadastrais_textrg.Text = ""; }
                if (retorno_cliente.Rows[0].Cells[23].Text != "&nbsp;")
                {
                    cli_dadoscadastrais_label_idade.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[23].Text) + " anos";
                }
                else { cli_dadoscadastrais_label_idade.Text = ""; }
                if (retorno_cliente.Rows[0].Cells[24].Text == "&nbsp;")
                { cli_dadoscadastrais_dropestadouf.SelectedValue = "0"; }
                else 
                {
                    cli_dadoscadastrais_dropestadouf.DataBind();
                    cli_dadoscadastrais_dropestadouf.SelectedValue = retorno_cliente.Rows[0].Cells[24].Text;
                    cli_dadoscadastrais_dropnaturalidade.DataBind();
                    if (retorno_cliente.Rows[0].Cells[25].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_dropnaturalidade.SelectedValue = retorno_cliente.Rows[0].Cells[25].Text;
                    }
                }
                cli_profissional_grid_anexos.DataBind();
                cli_projetos_grid_projetos.DataBind();
                cli_researcher_grid_relatorio.DataBind();
                cli_researcher_grid_media_geral.DataBind();
                cli_dadoscadastrais_grid_email.DataBind();
                cli_dadoscadastrais_gridtelefone.DataBind();
                cli_havik_drop_projeto.DataBind();
                cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                if (Session["cliente_projeto"] != null)
                {
                    cli_havik_radio_projetos.SelectedValue = "2";
                    cli_havik_drop_projeto.DataBind();
                    cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                    cli_havik_drop_projeto.SelectedValue = Session["cliente_projeto"].ToString(); 
                }

                cli_consultor_gridobs.SelectedIndex = -1;
            }
                            
        }        

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            cli_consultor_textobs.Text = cli_consultor_gridobs.DataKeys[cli_consultor_gridobs.SelectedIndex].Value.ToString();
            cli_consultor_gridobs.DataBind();
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            cli_researcher_textobs.Text = cli_researcher_gridobs.DataKeys[cli_researcher_gridobs.SelectedIndex].Value.ToString();
            cli_researcher_gridobs.DataBind();
        }
               

        protected void SqlDataSourceHavikProjeto_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlgerente = (DropDownList)cli_havik.FindControl("cli_havik_drop_gerente");

            if (ddlgerente != null)
            {
                e.Command.Parameters["@id_gerente"].Value = ddlgerente.SelectedValue;
            }
        }

        protected void ddldadoscadastrais_estado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cli_dadoscadastrais_dropestado.SelectedValue != "0")
            { 
                cli_dadoscadastrais_dropcidade.DataBind();
                cli_dadoscadastrais_dropcidade.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void SqlDataSourceDadosCadastraisCidade_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlestado = (DropDownList)cli_dadoscadastrais.FindControl("cli_dadoscadastrais_dropestado");

            if (ddlestado != null)
            {
                e.Command.Parameters["@ufcod"].Value = ddlestado.SelectedValue;
            }
        }

        protected void ddlstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cli_havik_dropstatus.SelectedValue != "0")
            { 
                cli_havik_dropsubstatus.DataBind();
                cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
            }
                cli_havik_textdata.Enabled = false;
                cli_havik_texthora.Enabled = false;
                Label138.Visible = false;
                cli_havik_drop_entrevistador.Visible = false;  
                cli_havik_textdata.Text = "";
                cli_havik_texthora.Text = "";
                cli_havik_drop_entrevistador.DataBind();
                cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                cli_havik_drop_entrevistador.SelectedIndex = 0;

        }

        protected void SqlDataSourceSubstatus_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)cli_havik.FindControl("cli_havik_dropstatus");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
        {           
            cli_profissional_dropsubdivisao.DataBind();
            cli_profissional_dropsubdivisao.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)cli_profissional.FindControl("cli_profissional_dropsegmento");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)cli_profissional.FindControl("cli_profissional_droparea");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void SqlDataSourceDetails_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DropDownList ddlseg = (DropDownList)cli_profissional.FindControl("cli_profissional_dropsegmento");
            e.Command.Parameters["@Category"].Value = ddlseg.SelectedValue;
            DropDownList ddlarea = (DropDownList)cli_profissional.FindControl("cli_profissional_droparea");
            e.Command.Parameters["@Product"].Value = ddlarea.SelectedValue;
            DropDownList ddlstatus = (DropDownList)cli_havik.FindControl("cli_havik_dropstatus");
            e.Command.Parameters["@Status"].Value = ddlstatus.SelectedValue;
        }

        /* CADASTRO DE CLIENTE ----------- ABA DADOS CADASTRAIS */

        protected void cadastro_cliente()
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 0;                                
                string comp = "";
                string valida = "0";
                int valida_data = 0;
                int erro = 0;
                string email = "";
                string nome = "";

                // ERRO = 1 - EMAIL JÁ EXISTE NA BASE E NOME NÃO
                // ERRO = 2 - NOME JÁ EXISTE NA BASE E EMAIL NÃO
                // ERRO = 3 - NOME E EMAIL JÁ EXISTEM NA BASE
                // 
                                
                SqlCommand ver_email = new SqlCommand("sp_vw_cli_verifica_email", con);
                ver_email.CommandType = CommandType.StoredProcedure;

                email = cli_dadoscadastrais_textemail.Text.ToString();

                ver_email.Parameters.AddWithValue("@email", email);
                SqlParameter retorno_email = ver_email.Parameters.Add("@retorno", SqlDbType.Int);
                retorno_email.Direction = ParameterDirection.Output;

                ver_email.ExecuteNonQuery();
                
                SqlCommand ver_nome = new SqlCommand("sp_vw_cli_verifica_nome", con);
                ver_nome.CommandType = CommandType.StoredProcedure;

                nome = cli_dadoscadastrais_textnome.Text.ToString();

                ver_nome.Parameters.AddWithValue("@nome", nome);
                SqlParameter retorno_nome = ver_nome.Parameters.Add("@retorno", SqlDbType.Int);
                retorno_nome.Direction = ParameterDirection.Output;

                ver_nome.ExecuteNonQuery();

                if (retorno_nome.Value.ToString() == "1" && retorno_email.Value.ToString() == "0")
                {
                    erro = 1;
                }
                else
                {
                    if (retorno_nome.Value.ToString() == "0" && retorno_email.Value.ToString() == "1")
                    {
                        erro = 2;
                    }
                    else
                    {
                        if (retorno_nome.Value.ToString() == "0" && retorno_email.Value.ToString() == "0")
                        {
                            erro = 3;
                        }
                    }
                }

                if (Session["IDcliente"] != null)
                { 
                    id_cliente = int.Parse(Session["IDcliente"].ToString());
                    erro = 0;
                }

                SqlCommand com = new SqlCommand("sp_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                if (cli_dadoscadastrais_textnascimento.Text != "")
                {
                    string valor = cli_dadoscadastrais_textnascimento.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0,2).ToString());
                    mes = int.Parse(valor.Substring(2,2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@dt_nascimento", data);
                    }
                }
                else 
                { 
                    com.Parameters.AddWithValue("@dt_nascimento", null);
                    valida_data = 1;
                }


                com.Parameters.AddWithValue("@tipo", i);
                if (id_cliente != 0)
                { com.Parameters.AddWithValue("@id_cliente", id_cliente); }
                else { com.Parameters.AddWithValue("@id_cliente", null); }
                com.Parameters.AddWithValue("@nome", cli_dadoscadastrais_textnome.Text);
                if (cli_dadoscadastrais_textcpf.Text != "")
                { com.Parameters.AddWithValue("@cpf", cli_dadoscadastrais_textcpf.Text); }
                else { com.Parameters.AddWithValue("@cpf", null); }
                if (cli_dadoscadastrais_dropestadocivil.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@estado_civil", cli_dadoscadastrais_dropestadocivil.SelectedValue); }
                else { com.Parameters.AddWithValue("@estado_civil", null); }
                if (cli_dadoscadastrais_dropsexo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@sexo", cli_dadoscadastrais_dropsexo.SelectedValue); }
                else { com.Parameters.AddWithValue("@sexo", null); }
                com.Parameters.AddWithValue("@endereco", cli_dadoscadastrais_textendereco.Text);
                string cep = cli_dadoscadastrais_textcep.Text;
                if (cep.Length < 9)
                {
                    com.Parameters.AddWithValue("@cep", cli_dadoscadastrais_textcep.Text);
                }
                else { com.Parameters.AddWithValue("@cep", null); }
                com.Parameters.AddWithValue("@bairro", cli_dadoscadastrais_textbairro.Text);
                if ((cli_dadoscadastrais_dropcidade.SelectedValue != "") && (cli_dadoscadastrais_dropcidade.SelectedValue != "Escolha a opção"))
                { com.Parameters.AddWithValue("@cidade", cli_dadoscadastrais_dropcidade.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@cidade", null); }
                if (cli_dadoscadastrais_dropestado.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@estado", cli_dadoscadastrais_dropestado.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@estado", null); }
                if (cli_dadoscadastrais_droppais.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@pais", int.Parse(cli_dadoscadastrais_droppais.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@pais", null); }
                com.Parameters.AddWithValue("@RG", cli_dadoscadastrais_textrg.Text);
                com.Parameters.AddWithValue("@pai", cli_dadoscadastrais_textnomepai.Text);
                com.Parameters.AddWithValue("@mae", cli_dadoscadastrais_textnomemae.Text);
                com.Parameters.AddWithValue("@numero", cli_dadoscadastrais_textnro.Text);
                com.Parameters.AddWithValue("@complemento", cli_dadoscadastrais_textcomplemento.Text);
                if ((cli_dadoscadastrais_dropnaturalidade.SelectedValue != "") && (cli_dadoscadastrais_dropnaturalidade.SelectedValue != "Escolha a opção"))
                { com.Parameters.AddWithValue("@naturalidade", cli_dadoscadastrais_dropnaturalidade.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@naturalidade", null); }
                if (cli_dadoscadastrais_dropestadouf.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@uf_naturalidade", cli_dadoscadastrais_dropestadouf.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@uf_naturalidade", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if ((cli_dadoscadastrais_textnome.Text.ToString() != comp) && (cli_dadoscadastrais_dropsexo.SelectedValue != "0") &&
                        ((cli_dadoscadastrais_textemail.Text != "") || (erro == 0 && cli_dadoscadastrais_grid_email.Rows.Count > 0)) &&
                        (cli_dadoscadastrais_dropestado.SelectedValue != "0") && (cli_dadoscadastrais_dropcidade.SelectedIndex != 0) &&
                        (cli_dadoscadastrais_dropcidade.SelectedIndex != -1))
                        {
                            if (erro != 3)
                            {
                                com.ExecuteNonQuery();
                                Session["label_modulo"] = cli_dadoscadastrais_textnome.Text;

                                valida = rowCount.Value.ToString();
                                if (valida != "0")
                                {
                                    Session["IDcliente"] = rowCount.Value;
                                    exibe_mensagem_cliente(1, "cadastro feito com sucesso!");
                                    cadastra_email();
                                    //Habilita o botão para cadastrar mais emails e limpa o campo de email para evitar duplicidade
                                    cli_dadoscadastrais_adiciona_email.Visible = true;
                                    cli_dadoscadastrais_textemail.Text = "";

                                    if (erro == 1)
                                    {
                                        exibe_mensagem_cliente(1, "cadastro feito com sucesso, mas email já está registrado na base, favor verificar!");
                                    }
                                    else
                                    {
                                        if (erro == 2)
                                        {
                                            exibe_mensagem_cliente(1, "cadastro feito com sucesso, mas nome já está registrado na base, favor verificar!");
                                        }
                                        else 
                                        {
                                            exibe_mensagem_cliente(1, "cadastro feito com sucesso!");
                                        }
                                    }
                                    
                                }
                                else
                                {
                                    Session["IDcliente"] = null;
                                    exibe_mensagem_cliente(1, "cadastro feito sem sucesso favor preecher o campo nome, sexo e email!");
                                    limpar_dados_cliente();
                                }
                                //GRAVAÇÃO DAS INFORMAÇÕES DEPOIS DE UM CADASTRO PARA PERSISTIR OS DADOS PELOS MÓDULOS

                                int idd_cliente = int.Parse(Session["IDcliente"].ToString());

                                SqlCommand comm = new SqlCommand("sp_retorno_cliente", con);
                                comm.CommandType = CommandType.StoredProcedure;

                                comm.Parameters.AddWithValue("@id_cliente", idd_cliente);

                                SqlDataAdapter da = new SqlDataAdapter(comm);
                                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                                //Array teste = da.GetFillParameters();  
                                //da.Fill(dt_busca);
                                da.Fill(retorno_grid_cliente);
                                Session["retorno_cliente"] = retorno_grid_cliente;
                                grid_busca_cliente.DataBind();
                                foreach (GridViewRow row in grid_busca_cliente.Rows)//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                                {//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                                    if (Session["IDcliente"].ToString() == grid_busca_cliente.DataKeys[row.RowIndex].Values["id_cliente"].ToString())
                                    {
                                        grid_busca_cliente.Rows[row.RowIndex].Font.Bold = true;
                                    }
                                    else { grid_busca_cliente.Rows[row.RowIndex].Font.Bold = false; }
                                }
                            }
                            else
                            {
                                exibe_mensagem_cliente(1, "email e nome já existem na base, verificar se o cliente já está registrado!");
                            }
                        }
                        else 
                        {
                            exibe_mensagem_cliente(1, "cadastro feito sem sucesso favor preecher o campo nome, sexo, e-mail, cidade e estado!");
                        }
                }
                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNQ_CLI_CPF"))
                    {
                        exibe_mensagem_cliente(1, "CPF já existe na base!");
                    }
                }

                //PREENCHE A LABEL EM DADOS CADASTRAIS DE CLIENTE

                if (Session["IDcliente"] != null)
                {
                    cli_dadoscadastrais_label_id.Text = "ID: " + Session["IDcliente"].ToString();
                }
                else
                { cli_dadoscadastrais_label_id.Text = ""; }                                
            }
        }

        protected void Button35_Click(object sender, EventArgs e)
        {
            cadastro_cliente();
        }

        /* CADASTRO DE STATUS ----------- ABA HAVIK */

        protected void Button32_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";
                int follow = 0;
                int entrevistador = 0;

                SqlCommand com = new SqlCommand("sp_cli_status", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if ((cli_havik_drop_projeto.SelectedIndex != 0) && (cli_havik_drop_projeto.SelectedIndex != -1))
                { com.Parameters.AddWithValue("@id_projeto", int.Parse(cli_havik_drop_projeto.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_projeto", null); }
                if (cli_havik_dropstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_status", int.Parse(cli_havik_dropstatus.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_status", null); }
                if ((cli_havik_dropsubstatus.SelectedIndex != 0) && (cli_havik_dropsubstatus.SelectedIndex != -1))
                { com.Parameters.AddWithValue("@id_substatus", int.Parse(cli_havik_dropsubstatus.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_substatus", null); }
                if ((cli_havik_dropmotivo.SelectedIndex != 0) && (cli_havik_dropmotivo.SelectedIndex != -1))
                { com.Parameters.AddWithValue("@motivo", int.Parse(cli_havik_dropmotivo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@motivo", null); }
                if ((cli_havik_drop_indicadopor.SelectedIndex != 0) && (cli_havik_drop_indicadopor.SelectedIndex != -1))
                { com.Parameters.AddWithValue("@indicado", int.Parse(cli_havik_drop_indicadopor.SelectedValue)); }
                else { com.Parameters.AddWithValue("@indicado", null); }
                if ((cli_havik_textdata.Text != "") && (cli_havik_textdata.Text.Length == 8))
                {
                    string valor = cli_havik_textdata.Text;
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
                if (cli_havik_textobservacoes.Text != "")
                { com.Parameters.AddWithValue("@obs", cli_havik_textobservacoes.Text); }
                else { com.Parameters.AddWithValue("@obs", null); }
                if ((cli_havik_dropsubstatus.SelectedIndex != 0) && (cli_havik_dropsubstatus.SelectedIndex != -1))
                {
                    if (retorno_follow_entrevistador.Rows.Count != 0)
                    {
                        if (retorno_follow_entrevistador.Rows[0].Cells[0].Text == "1")
                        {
                            entrevistador = 1;
                            if (cli_havik_drop_entrevistador.SelectedIndex != 0)
                            {
                                com.Parameters.AddWithValue("@entrevistador", int.Parse(cli_havik_drop_entrevistador.SelectedValue));
                                com.Parameters.AddWithValue("@follow", null);
                            }
                            else
                            {
                                com.Parameters.AddWithValue("@entrevistador", null);
                                com.Parameters.AddWithValue("@follow", null);
                            }
                        }
                        if (retorno_follow_entrevistador.Rows[0].Cells[1].Text == "1")
                        {
                            follow = 1;
                            if (cli_havik_drop_entrevistador.SelectedIndex != 0)
                            {
                                com.Parameters.AddWithValue("@entrevistador", null);
                                com.Parameters.AddWithValue("@follow", int.Parse(cli_havik_drop_entrevistador.SelectedValue));
                            }
                            else
                            {
                                com.Parameters.AddWithValue("@entrevistador", null);
                                com.Parameters.AddWithValue("@follow", null);
                            }
                        }
                    }
                    else
                    {
                        com.Parameters.AddWithValue("@entrevistador", null);
                        com.Parameters.AddWithValue("@follow", null);
                    }
                }
                else 
                {
                    com.Parameters.AddWithValue("@entrevistador", null);
                    com.Parameters.AddWithValue("@follow", null);
                }

                string teste = cli_havik_texthora.Text;
                if ((cli_havik_texthora.Text != "") && (teste.Length == 5))
                { com.Parameters.AddWithValue("@hora", cli_havik_texthora.Text); }
                else { com.Parameters.AddWithValue("@hora", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;


                SqlCommand ind = new SqlCommand("sp_cli_indicado", con);
                ind.CommandType = CommandType.StoredProcedure;
                
                ind.Parameters.AddWithValue("@id_cliente", id_cliente);
                if ((cli_havik_drop_indicadopor.SelectedIndex != 0) && (cli_havik_drop_indicadopor.SelectedIndex != -1))
                { ind.Parameters.AddWithValue("@indicado", int.Parse(cli_havik_drop_indicadopor.SelectedValue)); }
                else { ind.Parameters.AddWithValue("@indicado", null); }
                if ((cli_havik_drop_projeto.SelectedIndex != 0) && (cli_havik_drop_projeto.SelectedIndex != -1))
                { ind.Parameters.AddWithValue("@id_projeto", int.Parse(cli_havik_drop_projeto.SelectedValue)); }
                else { ind.Parameters.AddWithValue("@id_projeto", null); }
                ind.Parameters.AddWithValue("@usuario", id_usuario);
                SqlParameter rowCountInd = ind.Parameters.Add("@retorno", SqlDbType.Int);
                rowCountInd.Direction = ParameterDirection.Output;


                try
                {
                    if (valida != sessao)
                    {
                        //VERIFICAÇÃO DA INDICAÇÃO
                        if (((cli_havik_drop_projeto.SelectedIndex == 0) || (cli_havik_drop_projeto.SelectedIndex == -1)) && (cli_havik_drop_indicadopor.SelectedIndex != 0))
                        {
                            exibe_mensagem_cliente(5, "indicação adicionado sem sucesso, favor selecionar um projeto!");
                        }
                        else 
                        {
                            //VERIFICAÇÃO DOS CAMPOS MINIMOS PARA REGISTRO DA INDICAÇÃO
                            if (((cli_havik_drop_projeto.SelectedIndex != 0) && (cli_havik_drop_projeto.SelectedIndex != -1)) && (cli_havik_drop_indicadopor.SelectedIndex != 0))
                            {
                                ind.ExecuteNonQuery();
                                cli_havik_textdata.Text = "";
                                cli_havik_texthora.Text = "";
                                cli_havik_drop_projeto.DataBind();
                                cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                                Session["cliente_projeto"] = null;
                                cli_havik_grid_status.DataBind();
                                cli_havik_dropstatus.SelectedIndex = 0;
                                cli_havik_dropsubstatus.DataBind();
                                cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                                cli_havik_drop_entrevistador.DataBind();
                                cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                                cli_havik_drop_entrevistador.SelectedIndex = 0;
                                cli_projetos_grid_projetos.DataBind();
                                cli_havik_drop_indicadopor.SelectedIndex = 0;
                                exibe_mensagem_cliente(5, "indicação registrada com sucesso!");
                            }
                            else
                            {
                                //CASOS GERAIS PARA INSERÇÃO DE STATUS
                                if (((cli_havik_dropstatus.SelectedValue.ToString() != compddl) && (cli_havik_drop_projeto.SelectedIndex != 0)
                                    && (cli_havik_dropsubstatus.SelectedIndex != 0) && (cli_havik_drop_projeto.SelectedIndex != -1)))
                                {
                                    if (cli_havik_drop_entrevistador.Visible == true)
                                    {
                                        if (entrevistador == 1)
                                        {
                                            if ((cli_havik_textdata.Text != "") && (cli_havik_textdata.Text.Length == 8) && (cli_havik_drop_entrevistador.SelectedIndex != 0) &&
                                                (cli_havik_texthora.Text != "") && (cli_havik_texthora.Text.Length == 5))
                                            {
                                                if (cli_havik_dropmotivo.Items.Count > 1)
                                                {
                                                    if (cli_havik_dropmotivo.SelectedIndex != 0)
                                                    {
                                                        com.ExecuteNonQuery();
                                                        cli_havik_textdata.Text = "";
                                                        cli_havik_texthora.Text = "";
                                                        cli_havik_drop_projeto.DataBind();
                                                        cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                                                        Session["cliente_projeto"] = null;
                                                        cli_havik_grid_status.DataBind();
                                                        cli_havik_dropstatus.SelectedIndex = 0;
                                                        cli_havik_dropsubstatus.DataBind();
                                                        cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                                                        cli_havik_drop_entrevistador.DataBind();
                                                        cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                                                        cli_havik_drop_entrevistador.SelectedIndex = 0;
                                                        cli_projetos_grid_projetos.DataBind();
                                                        cli_havik_drop_indicadopor.SelectedIndex = 0;
                                                        exibe_mensagem_cliente(5, "status adicionado com sucesso!");
                                                    }
                                                    else { exibe_mensagem_cliente(5, "por favor selecione um motivo da lista!"); }
                                                }
                                                else
                                                {
                                                    com.ExecuteNonQuery();
                                                    cli_havik_textdata.Text = "";
                                                    cli_havik_texthora.Text = "";
                                                    cli_havik_drop_projeto.DataBind();
                                                    cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                                                    Session["cliente_projeto"] = null;
                                                    cli_havik_grid_status.DataBind();
                                                    cli_havik_dropstatus.SelectedIndex = 0;
                                                    cli_havik_dropsubstatus.DataBind();
                                                    cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                                                    cli_havik_drop_entrevistador.DataBind();
                                                    cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                                                    cli_havik_drop_entrevistador.SelectedIndex = 0;
                                                    cli_projetos_grid_projetos.DataBind();
                                                    cli_havik_drop_indicadopor.SelectedIndex = 0;
                                                    exibe_mensagem_cliente(5, "status adicionado com sucesso!");
                                                }
                                            }
                                            else
                                            {                                                
                                                exibe_mensagem_cliente(5, "status adicionado sem sucesso, favor colocar data/hora e follow/entrevistador!");
                                            }
                                        }
                                        if (follow == 1)
                                        {
                                            if ((cli_havik_textdata.Text != "") && (cli_havik_textdata.Text.Length == 8) && (cli_havik_drop_entrevistador.SelectedIndex != 0))
                                            {
                                                if (cli_havik_dropmotivo.Items.Count > 1)
                                                {
                                                    if (cli_havik_dropmotivo.SelectedIndex != 0)
                                                    {
                                                        com.ExecuteNonQuery();
                                                        cli_havik_textdata.Text = "";
                                                        cli_havik_texthora.Text = "";
                                                        cli_havik_drop_projeto.DataBind();
                                                        cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                                                        Session["cliente_projeto"] = null;
                                                        cli_havik_grid_status.DataBind();
                                                        cli_havik_dropstatus.SelectedIndex = 0;
                                                        cli_havik_dropsubstatus.DataBind();
                                                        cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                                                        cli_havik_drop_entrevistador.DataBind();
                                                        cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                                                        cli_havik_drop_entrevistador.SelectedIndex = 0;
                                                        cli_projetos_grid_projetos.DataBind();
                                                        cli_havik_drop_indicadopor.SelectedIndex = 0;
                                                        exibe_mensagem_cliente(5, "status adicionado com sucesso!");
                                                    }
                                                    else { exibe_mensagem_cliente(5, "por favor selecione um motivo da lista!"); }
                                                }
                                                else
                                                {
                                                    com.ExecuteNonQuery();
                                                    cli_havik_textdata.Text = "";
                                                    cli_havik_texthora.Text = "";
                                                    cli_havik_drop_projeto.DataBind();
                                                    cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                                                    Session["cliente_projeto"] = null;
                                                    cli_havik_grid_status.DataBind();
                                                    cli_havik_dropstatus.SelectedIndex = 0;
                                                    cli_havik_dropsubstatus.DataBind();
                                                    cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                                                    cli_havik_drop_entrevistador.DataBind();
                                                    cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                                                    cli_havik_drop_entrevistador.SelectedIndex = 0;
                                                    cli_projetos_grid_projetos.DataBind();
                                                    cli_havik_drop_indicadopor.SelectedIndex = 0;
                                                    exibe_mensagem_cliente(5, "status adicionado com sucesso!");
                                                }
                                            }
                                            else
                                            {
                                                exibe_mensagem_cliente(5, "status adicionado sem sucesso, favor colocar data e follow/entrevistador!");
                                            }
                                        }

                                    }
                                    else
                                    {
                                        if (cli_havik_dropmotivo.Items.Count > 1)
                                        {
                                            if (cli_havik_dropmotivo.SelectedIndex != 0)
                                            {
                                                com.ExecuteNonQuery();
                                                cli_havik_textdata.Text = "";
                                                cli_havik_texthora.Text = "";
                                                cli_havik_drop_projeto.DataBind();
                                                cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                                                Session["cliente_projeto"] = null;
                                                cli_havik_grid_status.DataBind();
                                                cli_havik_dropstatus.SelectedIndex = 0;
                                                cli_havik_dropsubstatus.DataBind();
                                                cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                                                cli_havik_drop_entrevistador.DataBind();
                                                cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                                                cli_havik_drop_entrevistador.SelectedIndex = 0;
                                                cli_projetos_grid_projetos.DataBind();
                                                cli_havik_drop_indicadopor.SelectedIndex = 0;
                                                exibe_mensagem_cliente(5, "status adicionado com sucesso!");
                                            }
                                            else { exibe_mensagem_cliente(5, "por favor selecione um motivo da lista!"); }
                                        }
                                        else
                                        {
                                            com.ExecuteNonQuery();
                                            cli_havik_textdata.Text = "";
                                            cli_havik_texthora.Text = "";
                                            cli_havik_drop_projeto.DataBind();
                                            cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
                                            Session["cliente_projeto"] = null;
                                            cli_havik_grid_status.DataBind();
                                            cli_havik_dropstatus.SelectedIndex = 0;
                                            cli_havik_dropsubstatus.DataBind();
                                            cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                                            cli_havik_drop_entrevistador.DataBind();
                                            cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                                            cli_havik_drop_entrevistador.SelectedIndex = 0;
                                            cli_projetos_grid_projetos.DataBind();
                                            cli_havik_drop_indicadopor.SelectedIndex = 0;
                                            exibe_mensagem_cliente(5, "status adicionado com sucesso!");
                                        }
                                    }
                                }
                                else
                                {
                                    exibe_mensagem_cliente(5, "status adicionado sem sucesso, favor preencher os campos mínimos!");
                                    
                                }
                            }
                        }
                    }
                    else 
                    {
                        exibe_mensagem_cliente(5, "status adicionado sem sucesso!");
                        
                    }
                }


                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(5, "status adicionado sem sucesso!");                        
                    }
                }
            }
        }

        /* CADASTRO DE EMAIL ----------- ABA DADOS CADASTRAIS */       

        protected void Button22_Click(object sender, EventArgs e)
        {
            cadastra_email();
        }

        protected void cadastra_email()
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_cli_email", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_dadoscadastrais_textemail.Text != "")
                { com.Parameters.AddWithValue("@descricao", cli_dadoscadastrais_textemail.Text); }
                else { com.Parameters.AddWithValue("@descricao", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);
                com.Parameters.AddWithValue("@exibir", 1);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (cli_dadoscadastrais_textemail.Text != ""))
                    {
                        com.ExecuteNonQuery();
                        cli_dadoscadastrais_grid_email.DataBind();
                        exibe_mensagem_cliente(1, "cadastro feito com sucesso!");
                    }
                    else
                    {
                        exibe_mensagem_cliente(1, "cadastre um cliente e/ou preencha o campo de email!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(1, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        /* CADASTRO DE TELEFONE ----------- ABA DADOS CADASTRAIS */
        
        protected void Button23_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";                
                
                SqlCommand com = new SqlCommand("sp_cli_telefone", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_dadoscadastrais_textcodpais.Text != "")
                { com.Parameters.AddWithValue("@cod_pais", cli_dadoscadastrais_textcodpais.Text); }
                else { com.Parameters.AddWithValue("@cod_pais", null); }
                if (cli_dadoscadastrais_textddd.Text != "")
                { com.Parameters.AddWithValue("@ddd", int.Parse(cli_dadoscadastrais_textddd.Text)); }
                else { com.Parameters.AddWithValue("@ddd", null); }
                if (cli_dadoscadastrais_texttelefone.Text != "")
                { com.Parameters.AddWithValue("@telefone", cli_dadoscadastrais_texttelefone.Text); }
                else { com.Parameters.AddWithValue("@telefone", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);
                com.Parameters.AddWithValue("@exibir", 1);
                com.Parameters.AddWithValue("@tp_telefone", int.Parse(cli_dadoscadastrais_drop_tipotel.SelectedValue));

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((cli_dadoscadastrais_texttelefone.Text != "") && (cli_dadoscadastrais_drop_tipotel.SelectedValue != "0") && (cli_dadoscadastrais_drop_tipotel.SelectedValue != ""))
                    {
                        if (valida != sessao)
                            {
                                com.ExecuteNonQuery();
                                cli_dadoscadastrais_gridtelefone.DataBind();
                                exibe_mensagem_cliente(1, "cadastro feito com sucesso!");
                            }
                    }
                    else
                    {
                        exibe_mensagem_cliente(1, "cadastre um cliente ou preencha todos os campos requeridos antes!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(1, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        /* ATUALIZAÇÃO DE CLIENTE ----------- ABA DADOS CADASTRAIS */

        protected void atualiza_cadastro_cliente()
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 2;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                int valida_data = 0;

                SqlCommand com = new SqlCommand("sp_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                if (cli_dadoscadastrais_textnascimento.Text != "")
                {
                    string valor = cli_dadoscadastrais_textnascimento.Text;
                    string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor.Substring(0, 2).ToString());
                    mes = int.Parse(valor.Substring(2, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@dt_nascimento", data);
                    }
                }
                else
                {
                    com.Parameters.AddWithValue("@dt_nascimento", null);
                    valida_data = 1;
                }


                com.Parameters.AddWithValue("@tipo", i);
                if (id_cliente != 0)
                { com.Parameters.AddWithValue("@id_cliente", id_cliente); }
                else { com.Parameters.AddWithValue("@id_cliente", null); }
                com.Parameters.AddWithValue("@nome", cli_dadoscadastrais_textnome.Text);
                if (cli_dadoscadastrais_textcpf.Text != "")
                { com.Parameters.AddWithValue("@cpf", cli_dadoscadastrais_textcpf.Text); }
                else { com.Parameters.AddWithValue("@cpf", null); }
                if (cli_dadoscadastrais_dropestadocivil.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@estado_civil", cli_dadoscadastrais_dropestadocivil.SelectedValue); }
                else { com.Parameters.AddWithValue("@estado_civil", null); }
                if (cli_dadoscadastrais_dropsexo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@sexo", cli_dadoscadastrais_dropsexo.SelectedValue); }
                else { com.Parameters.AddWithValue("@sexo", null); }
                com.Parameters.AddWithValue("@endereco", cli_dadoscadastrais_textendereco.Text);
                com.Parameters.AddWithValue("@cep", cli_dadoscadastrais_textcep.Text);
                com.Parameters.AddWithValue("@bairro", cli_dadoscadastrais_textbairro.Text);
                if ((cli_dadoscadastrais_dropcidade.SelectedValue != "") && (cli_dadoscadastrais_dropcidade.SelectedValue != "Escolha a opção"))
                { com.Parameters.AddWithValue("@cidade", cli_dadoscadastrais_dropcidade.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@cidade", null); }
                if (cli_dadoscadastrais_dropestado.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@estado", cli_dadoscadastrais_dropestado.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@estado", null); }
                if (cli_dadoscadastrais_droppais.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@pais", int.Parse(cli_dadoscadastrais_droppais.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@pais", null); }
                com.Parameters.AddWithValue("@RG", cli_dadoscadastrais_textrg.Text);
                com.Parameters.AddWithValue("@pai", cli_dadoscadastrais_textnomepai.Text);
                com.Parameters.AddWithValue("@mae", cli_dadoscadastrais_textnomemae.Text);
                com.Parameters.AddWithValue("@numero", cli_dadoscadastrais_textnro.Text);
                com.Parameters.AddWithValue("@complemento", cli_dadoscadastrais_textcomplemento.Text);
                if ((cli_dadoscadastrais_dropnaturalidade.SelectedValue != "") && (cli_dadoscadastrais_dropnaturalidade.SelectedValue != "Escolha a opção"))
                { com.Parameters.AddWithValue("@naturalidade", cli_dadoscadastrais_dropnaturalidade.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@naturalidade", null); }
                if (cli_dadoscadastrais_dropestadouf.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@uf_naturalidade", cli_dadoscadastrais_dropestadouf.SelectedValue.ToString()); }
                else { com.Parameters.AddWithValue("@uf_naturalidade", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (valida != sessao)
                        if (cli_dadoscadastrais_textnome.Text.ToString() != comp)
                        {
                            com.ExecuteNonQuery();
                            grid_busca_cliente.DataBind();
                            System.Drawing.Color c;

                            foreach (GridViewRow row in grid_busca_cliente.Rows)
                            {
                                if (grid_busca_cliente.DataKeys[row.RowIndex].Values["hexa"].ToString() != "&nbsp;")
                                {
                                    c = System.Drawing.ColorTranslator.FromHtml(grid_busca_cliente.DataKeys[row.RowIndex].Values["hexa"].ToString());
                                    grid_busca_cliente.Rows[row.RowIndex].BackColor = c;
                                }
                            }
                            valida = rowCount.Value.ToString();
                            if (valida != "0")
                            {
                                exibe_mensagem_cliente(1, "atualização feita com sucesso!");
                            }

                            int idd_cliente = int.Parse(Session["IDcliente"].ToString());

                            SqlCommand comm = new SqlCommand("sp_retorno_cliente", con);
                            comm.CommandType = CommandType.StoredProcedure;

                            comm.Parameters.AddWithValue("@id_cliente", idd_cliente);

                            SqlDataAdapter da = new SqlDataAdapter(comm);
                            //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                            //Array teste = da.GetFillParameters();  
                            //da.Fill(dt_busca);
                            da.Fill(retorno_grid_cliente);
                            Session["retorno_cliente"] = retorno_grid_cliente;
                            grid_busca_cliente.DataBind();
                            foreach (GridViewRow row in grid_busca_cliente.Rows)//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                            {//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                                if (Session["IDcliente"].ToString() == grid_busca_cliente.DataKeys[row.RowIndex].Values["id_cliente"].ToString())
                                {
                                    grid_busca_cliente.Rows[row.RowIndex].Font.Bold = true;
                                }
                                else { grid_busca_cliente.Rows[row.RowIndex].Font.Bold = false; }
                            }
                        }
                        else 
                        {
                            exibe_mensagem_cliente(1, "atualização feita sem sucesso!");
                        }
                }
                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(1, "atualização feita sem sucesso!");
                    }
                }
            }
        }

        protected void Button46_Click(object sender, EventArgs e)
        {
            atualiza_cadastro_cliente();
        }

        /* INSERÇÃO DE DADOS PROFISSIONAIS ----------- ABA PROFISSIONAL */

        protected void Button43_Click(object sender, EventArgs e)
        {           
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                string idempresa = Request.Form[id_empresa.UniqueID];
                string salario_anterior = cli_profissional_textsalario.Text;
                //string salario = salario_anterior.Replace(".", "");
                //salario = salario.Replace(",", ".");

                SqlCommand com = new SqlCommand("sp_cli_profissional", con);
                com.CommandType = CommandType.StoredProcedure;

                if (cli_profissional_dataentrada.Text != "")
                {
                    if (cli_profissional_dataentrada.Text.Length == 8)
                    {
                        string valor = cli_profissional_dataentrada.Text;
                        string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                        int dia = 0;
                        int mes = 0;
                        dia = int.Parse(valor.Substring(0, 2).ToString());
                        mes = int.Parse(valor.Substring(2, 2).ToString());
                        if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                        {
                            DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                            com.Parameters.AddWithValue("@dt_inicio", data);
                        }
                        else { sessao = "null"; }
                    }
                    else { sessao = "null"; }
                }
                else 
                {                    
                    com.Parameters.AddWithValue("@dt_inicio", null);
                }

                if (cli_profissional_datasaida.Text != "")
                {
                    if (cli_profissional_datasaida.Text.Length == 8)
                    {
                        string valor = cli_profissional_datasaida.Text;
                        string conversao = valor.Substring(0, 2) + "/" + valor.Substring(2, 2) + "/" + valor.Substring(4, 4);
                        int dia = 0;
                        int mes = 0;
                        dia = int.Parse(valor.Substring(0, 2).ToString());
                        mes = int.Parse(valor.Substring(2, 2).ToString());
                        if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                        {
                            DateTime data = Convert.ToDateTime(conversao, new CultureInfo("en-GB", false));
                            com.Parameters.AddWithValue("@dt_saida", data);
                        }
                        else { sessao = "null"; }
                    }
                    else { sessao = "null"; }
                }
                else 
                {
                    com.Parameters.AddWithValue("@dt_saida", null); 
                }

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (Session["id_linha_cliente_profissional"] != null)
                { com.Parameters.AddWithValue("@id_linha", int.Parse(Session["id_linha_cliente_profissional"].ToString())); }
                else { com.Parameters.AddWithValue("@id_linha", null); }
                if (idempresa != "")
                { com.Parameters.AddWithValue("@id_empresa", idempresa); }
                else { com.Parameters.AddWithValue("@id_empresa", null); }                
                if (cli_profissional_dropcargo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_cargo", int.Parse(cli_profissional_dropcargo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_cargo", null); }
                if (cli_profissional_textsalario.Text != "")
                { com.Parameters.AddWithValue("@salario", float.Parse(salario_anterior)); }
                else { com.Parameters.AddWithValue("@salario", null); }
                if (cli_profissional_textbonus.Text != "")
                { 
                    float teste = float.Parse(cli_profissional_textbonus.Text);
                    string conversao = cli_profissional_textbonus.Text;
                    //conversao = conversao.Replace(",", ".");
                    com.Parameters.AddWithValue("@bonus", float.Parse(conversao)); 
                }
                else { com.Parameters.AddWithValue("@bonus", null); }
                if (cli_profissional_textvariavel.Text != "")
                {                    
                    string conversao = cli_profissional_textvariavel.Text;
                    //conversao = conversao.Replace(".", "");
                    //conversao = conversao.Replace(",", ".");
                    com.Parameters.AddWithValue("@vrl_mensal", float.Parse(conversao));
                }
                else { com.Parameters.AddWithValue("@vrl_mensal", null); }
                if (txtPopupValue.Text != "" && id_filial.Value != null)
                { com.Parameters.AddWithValue("@filial", int.Parse(id_filial.Value.ToString())); }
                else { com.Parameters.AddWithValue("@filial", null); }
                com.Parameters.AddWithValue("@realizacoes", null);
                if (cli_profissional_drop_tp_contato.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@tp_contato", int.Parse(cli_profissional_drop_tp_contato.SelectedValue)); }
                else { com.Parameters.AddWithValue("@tp_contato", null); }
                if (cli_profissional_dropmodelo_contrato.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@tp_contrato", int.Parse(cli_profissional_dropmodelo_contrato.SelectedValue)); }
                else { com.Parameters.AddWithValue("@tp_contrato", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if ((cli_profissional_empresatext.Text.ToString() != comp) && (cli_profissional_dropcargo.SelectedIndex != 0) && (valida != sessao))
                    {
                        if (idempresa == "")
                        {
                            exibe_mensagem_cliente(2, "escolha uma empresa da lista ou cadastre uma nova!");  
                        }
                        else
                        {
                            string sql = "Select nome from bc_empresa_unq where " + @idempresa + "= id";
                            SqlDataAdapter da = new SqlDataAdapter(sql, conexao);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if ((cli_profissional_empresatext.Text != "" && id_empresa.Value != null) || (cli_profissional_empresatext.Text == "" && id_empresa.Value == null) ||
                                    (cli_profissional_empresatext.Text == "" && id_empresa.Value == "") || (cli_profissional_empresatext.Text == "" && id_empresa.Value != null) ||
                                    (cli_profissional_empresatext.Text == "" && id_empresa.Value != ""))
                            {
                                if ((txtPopupValue.Text != "" && id_filial.Value != null) || (txtPopupValue.Text == "" && id_filial.Value == null) ||
                                    (txtPopupValue.Text == "" && id_filial.Value == "") || (txtPopupValue.Text == "" && id_filial.Value != null) ||
                                    (txtPopupValue.Text == "" && id_filial.Value != ""))
                                
                                {
                                    com.ExecuteNonQuery();
                                    id_empresa.Value = "";
                                    cli_profissional_grid_cadastro.DataBind();
                                    valida = rowCount.Value.ToString();
                                    cli_profissional_empresatext.Text = "";
                                    cli_profissional_drop_tp_contato.SelectedIndex = 0;
                                    cli_profissional_dropcargo.SelectedIndex = 0;
                                    cli_profissional_dataentrada.Text = "";
                                    cli_profissional_datasaida.Text = "";
                                    cli_profissional_textsalario.Text = "";
                                    cli_profissional_textbonus.Text = "";
                                    cli_profissional_textvariavel.Text = "";
                                    cli_profissional_dropmodelo_contrato.SelectedIndex = 0;
                                    txtPopupValue.Text = "";
                                    Session["cliente_filial"] = null;
                                    id_filial.Value = "";
                                    Session["id_linha_cliente_profissional"] = null;
                                    cli_profissional_grid_cadastro.SelectedIndex = -1;
                                    exibe_mensagem_cliente(2, "cadastro feito com sucesso!");
                                }
                                else
                                {
                                    exibe_mensagem_cliente(2, "favor escolher uma filial cadastrada!");
                                }
                            }
                            else
                            {
                                exibe_mensagem_cliente(2, "escolha uma empresa da lista ou cadastre uma nova!");
                            }
                        }
                    }
                    else 
                    {
                        exibe_mensagem_cliente(2, "cadastro feito sem sucesso!"); 
                    }
                }
                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(2, "cadastro feito sem sucesso!"); 
                    }
                }
            }
        }

        /* INSERÇÃO DE BENEFICIOS ----------- ABA PROFISSIONAL */

        protected void Button45_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 0;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_cli_beneficios", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        for (int count = 0; count < cli_profissional_checkboxlist_beneficios.Items.Count; count++)
                        {
                            if (cli_profissional_checkboxlist_beneficios.Items[count].Selected)
                            {
                                if (cli_profissional_listabeneficios.Items.Count == 0)
                                {
                                    com.Parameters.AddWithValue("@beneficios", int.Parse(cli_profissional_checkboxlist_beneficios.Items[count].Value));
                                    com.ExecuteNonQuery();
                                    com.Parameters.RemoveAt("@beneficios");
                                }
                                else
                                {
                                    int insere = 0;
                                    for (int listcount = 0; listcount < (cli_profissional_listabeneficios.Items.Count); listcount++)
                                    {
                                        if (cli_profissional_checkboxlist_beneficios.Items[count].Value == cli_profissional_listabeneficios.Items[listcount].Value)
                                        {
                                            insere = 1;
                                        }
                                    }
                                    if (insere == 0)
                                    {
                                        com.Parameters.AddWithValue("@beneficios", int.Parse(cli_profissional_checkboxlist_beneficios.Items[count].Value));
                                        com.ExecuteNonQuery();
                                        com.Parameters.RemoveAt("@beneficios");
                                        cli_profissional_listabeneficios.DataBind();
                                        exibe_mensagem_cliente(2, "benefício cadastrado com sucesso!");
                                    }
                                }
                            }
                            cli_profissional_listabeneficios.DataBind();
                        }
                    }
                    else
                    {
                        exibe_mensagem_cliente(2, "benefício cadastrado sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(2, "benefício cadastrado sem sucesso!");
                    }
                }
            }
        }

        /* INSERÇÃO DE IDIOMAS ----------- ABA ACADEMICO */
        
        protected void Button29_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";
                string idempresa = Request.Form[id_empresa.UniqueID];

                SqlCommand com = new SqlCommand("sp_cli_idiomas", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_academico_dropidioma.SelectedValue != "0")
                { com.Parameters.AddWithValue("@idioma", int.Parse(cli_academico_dropidioma.SelectedValue)); }
                else { com.Parameters.AddWithValue("@idioma", null); }
                if (cli_academico_dropnivel.SelectedValue != "0")
                { com.Parameters.AddWithValue("@nvl_idioma", int.Parse(cli_academico_dropnivel.SelectedValue)); }
                else { com.Parameters.AddWithValue("@nvl_idioma", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (cli_academico_dropidioma.SelectedValue.ToString() != compddl)
                            if (cli_academico_dropnivel.SelectedValue.ToString() != compddl)
                            {
                                com.ExecuteNonQuery();
                                cli_academico_grid_idiomas.DataBind();
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                            }
                            else
                            { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }
            }
        }

        /* INSERÇÃO DE CURSOS ----------- ABA ACADEMICO */


        protected void Button30_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_cli_cursos", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_academico_textcertificacao.Text != "0")
                { com.Parameters.AddWithValue("@curso", cli_academico_textcertificacao.Text); }
                else { com.Parameters.AddWithValue("@curso", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (cli_academico_textcertificacao.Text != ""))
                            {
                                com.ExecuteNonQuery();
                                cli_academico_grid_cursos.DataBind();
                                exibe_mensagem_cliente(3, "certificação cadastrada com sucesso!");
                            }
                            else
                            {
                                exibe_mensagem_cliente(3, "certificação cadastrada sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(3, "certificação cadastrada sem sucesso!");
                    }
                }
            }
        }

        /* INSERÇÃO DE DADOS ACADÊMICOS ----------- ABA ACADEMICO */

        protected void Button28_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                string idgraduacao = Request.Form[id_graduacao.UniqueID];

                SqlCommand com = new SqlCommand("sp_cli_academico", con);
                com.CommandType = CommandType.StoredProcedure;                               

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_academico_dropescolaridade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_escolaridade", int.Parse(cli_academico_dropescolaridade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_escolaridade", null); }
                if (cli_academico_textinstituicao.Text != "")
                { com.Parameters.AddWithValue("@instituicao", cli_academico_textinstituicao.Text); }
                else { com.Parameters.AddWithValue("@instituicao", null); }
                if (idgraduacao != "")
                { com.Parameters.AddWithValue("@id_graduacao", idgraduacao); }
                else { com.Parameters.AddWithValue("@id_graduacao", null); }
                if ((cli_academico_text_ano_conclusao.Text != "") && (cli_academico_text_ano_conclusao.Text.Length < 5))
                { com.Parameters.AddWithValue("@ano_conclusao", cli_academico_text_ano_conclusao.Text); }
                else { com.Parameters.AddWithValue("@ano_conclusao", null); }
                if (cli_academico_drop_meses.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@mes_conclusao", cli_academico_drop_meses.SelectedIndex); }
                else { com.Parameters.AddWithValue("@mes_conclusao", null); }
                if (cli_academico_dropanocursando.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_ano_formacao", cli_academico_dropanocursando.SelectedValue); }
                else { com.Parameters.AddWithValue("@id_ano_formacao", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);                

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (valida != sessao)
                    {
                        if (idgraduacao == "")
                        {
                            exibe_mensagem_cliente(3, "escolha uma graduação da lista ou cadastre uma nova!");
                        }
                        else
                        {
                            string sql = "Select descricao from br_graduacao where " + @idgraduacao + "= id";
                            SqlDataAdapter da = new SqlDataAdapter(sql, conexao);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            string hidenfield = "";
                            hidenfield = dt.Rows[0]["descricao"].ToString();
                            if (cli_academico_textcurso.Text == hidenfield)
                            {
                                com.ExecuteNonQuery();
                                cli_academico_grid_graduacao.DataBind();
                                id_graduacao.Value = "";
                                valida = rowCount.Value.ToString();
                                cli_academico_textcurso.Text = "";
                            }
                            else 
                            {
                                exibe_mensagem_cliente(3, "escolha uma graduação da lista ou cadastre uma nova!");
                            }
                            if (valida != "0")
                            {
                                exibe_mensagem_cliente(3, "cadastro feito com sucesso!");
                            }
                        }
                    }
                    else 
                    {
                        exibe_mensagem_cliente(3, "cadastro feito sem sucesso!");
                    }
                }
                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(3, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        /* INSERÇÃO DE IDIOMAS ----------- ABA ACADEMICO */

        protected void Button29_Click1(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string compddl = "0";
                string valida = "null";                

                SqlCommand com = new SqlCommand("sp_cli_idiomas", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_academico_dropidioma.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@idioma", int.Parse(cli_academico_dropidioma.SelectedValue)); }
                else { com.Parameters.AddWithValue("@idioma", null); }
                if (cli_academico_dropnivel.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@nvl_idioma", int.Parse(cli_academico_dropnivel.SelectedValue)); }
                else { com.Parameters.AddWithValue("@nvl_idioma", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (cli_academico_dropidioma.SelectedValue.ToString() != compddl) && (cli_academico_dropnivel.SelectedValue.ToString() != compddl))
                            {
                                com.ExecuteNonQuery();
                                cli_academico_grid_idiomas.DataBind();
                                exibe_mensagem_cliente(3, "cadastro feito com sucesso!");
                            }
                            else
                            {
                                exibe_mensagem_cliente(3, "cadastro feito sem sucesso!");
                            }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(3, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        /* INSERÇÃO DE PROJETOS POR GERENTE ----------- ABA HAVIK */

        protected void Button31_Click(object sender, EventArgs e)
        {
            int i = 1;
            int id_usuario = int.Parse(Session["IDusuario"].ToString());
            int id_cliente = 1;
            int id_projeto = 0;
            string sessao = "0";
            if (Session["IDprojeto"] != null)
            {
                id_projeto = int.Parse(Session["IDprojeto"].ToString());
            }
            else { sessao = "null"; }
            string valida = "null";

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_cli_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                com.Parameters.AddWithValue("@id_projeto", id_projeto);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (Session["IDprojeto"] != null)
                    {
                        com.ExecuteNonQuery();
                        valida = rowCount.Value.ToString();
                        cli_havik_grid_status.DataBind();
                        cli_projetos_grid_projetos.DataBind();
                        if (valida != sessao)
                            if (id_projeto != 0)
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito com sucesso!')");
                            }
                            else
                            { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito sem sucesso!')"); }
                    }
                    else { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito sem sucesso!')"); }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito sem sucesso!')"); }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito com sucesso!')");
                }

                cli_havik_drop_projeto.DataBind();
                cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");

            }
        }        

        /* REGISTRO DE POTENCIAL ----------- ABA CONSULTOR POTENCIAL */

        protected void Button39_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_cli_consultor", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_consultor_potencial_inteligencia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_inteligencia", int.Parse(cli_consultor_potencial_inteligencia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_inteligencia", null); }
                if (cli_consultor_potencial_maturidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_maturidade", int.Parse(cli_consultor_potencial_maturidade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_maturidade", null); }
                if (cli_consultor_potencial_visao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_visao", int.Parse(cli_consultor_potencial_visao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_visao", null); }
                if (cli_consultor_potencial_confianca.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_confianca", int.Parse(cli_consultor_potencial_confianca.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_confianca", null); }
                if (cli_consultor_potencial_honestidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_honestidade", int.Parse(cli_consultor_potencial_honestidade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_honestidade", null); }
                if (cli_consultor_potencial_punch.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_punch", int.Parse(cli_consultor_potencial_punch.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_punch", null); }
                if (cli_consultor_potencial_carisma.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_carisma", int.Parse(cli_consultor_potencial_carisma.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_carisma", null); }
                if (cli_consultor_apresentacao_saudacao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@a_saudacao", int.Parse(cli_consultor_apresentacao_saudacao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@a_saudacao", null); }
                if (cli_consultor_apresentacao_impressao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@a_impressao", int.Parse(cli_consultor_apresentacao_impressao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@a_impressao", null); }
                if (cli_consultor_apresentacao_levantou.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@a_levantou", int.Parse(cli_consultor_apresentacao_levantou.SelectedValue)); }
                else { com.Parameters.AddWithValue("@a_levantou", null); }
                if (cli_consultor_apresentacao_profissionalismo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@a_profissionalismo", int.Parse(cli_consultor_apresentacao_profissionalismo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@a_profissionalismo", null); }
                if (cli_consultor_comunicacao_senso.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_senso", int.Parse(cli_consultor_comunicacao_senso.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_senso", null); }
                if (cli_consultor_comunicacao_eloquencia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_eloquencia", int.Parse(cli_consultor_comunicacao_eloquencia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_eloquencia", null); }
                if (cli_consultor_comunicacao_objetivo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_objetivo", int.Parse(cli_consultor_comunicacao_objetivo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_objetivo", null); }
                if (cli_consultor_comunicacao_energia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_energia", int.Parse(cli_consultor_comunicacao_energia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_energia", null); }
                if (cli_consultor_comunicacao_ouvinte.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_ouvinte", int.Parse(cli_consultor_comunicacao_ouvinte.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_ouvinte", null); }
                if (cli_consultor_comunicacao_mkt.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_mkt", int.Parse(cli_consultor_comunicacao_mkt.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_mkt", null); }
                if (cli_consultor_comunicacao_credibilidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_credibilidade", int.Parse(cli_consultor_comunicacao_credibilidade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_credibilidade", null); }
                if (cli_consultor_comunicacao_estruturado.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_estruturado", int.Parse(cli_consultor_comunicacao_estruturado.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_estruturado", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if ((cli_consultor_potencial_inteligencia.SelectedIndex != 0) && (cli_consultor_potencial_maturidade.SelectedIndex != 0) &&
                            (cli_consultor_potencial_visao.SelectedIndex != 0) && (cli_consultor_potencial_confianca.SelectedIndex != 0) &&
                            (cli_consultor_potencial_honestidade.SelectedIndex != 0) && (cli_consultor_potencial_punch.SelectedIndex != 0) &&
                            (cli_consultor_potencial_carisma.SelectedIndex != 0) &&

                            (cli_consultor_apresentacao_saudacao.SelectedIndex != 0) &&
                            (cli_consultor_apresentacao_impressao.SelectedIndex != 0) && (cli_consultor_apresentacao_levantou.SelectedIndex != 0) &&
                            (cli_consultor_apresentacao_profissionalismo.SelectedIndex != 0) &&

                            (cli_consultor_comunicacao_senso.SelectedIndex != 0) && (cli_consultor_comunicacao_eloquencia.SelectedIndex != 0) &&
                            (cli_consultor_comunicacao_objetivo.SelectedIndex != 0) && (cli_consultor_comunicacao_energia.SelectedIndex != 0) &&
                            (cli_consultor_comunicacao_ouvinte.SelectedIndex != 0) && (cli_consultor_comunicacao_mkt.SelectedIndex != 0) &&
                            (cli_consultor_comunicacao_credibilidade.SelectedIndex != 0) && (cli_consultor_comunicacao_estruturado.SelectedIndex != 0))
                                                    {
                                                        com.ExecuteNonQuery();
                                                        cli_consultor_grid_media_geral.DataBind();
                                                        cli_consultor_grid_relatorio.DataBind();
                                                        exibe_mensagem_cliente(8, "entrevista registrada com sucesso!");
                                                    }
                                                    else
                                                    {
                                                        exibe_mensagem_cliente(8, "entrevista registrada sem sucesso!");
                                                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(8, "entrevista registrada sem sucesso!");
                    }
                }
            }
        }

        /* REGISTRO DE COMUNICACAO ----------- ABA RESEARCHER COMUNICACAO */

        protected void Button34_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";

                //string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                //SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_cli_researcher_comunicacao", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_researcher_comunicacao_senso.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_senso", int.Parse(cli_researcher_comunicacao_senso.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_senso", null); }
                if (cli_researcher_comunicacao_eloquencia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_eloquencia", int.Parse(cli_researcher_comunicacao_eloquencia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_eloquencia", null); }
                if (cli_researcher_comunicacao_objetivo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_objetivo", int.Parse(cli_researcher_comunicacao_objetivo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_objetivo", null); }
                if (cli_researcher_comunicacao_energia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_energia", int.Parse(cli_researcher_comunicacao_energia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_energia", null); }
                if (cli_researcher_comunicacao_ouvinte.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_ouvinte", int.Parse(cli_researcher_comunicacao_ouvinte.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_ouvinte", null); }
                if (cli_researcher_comunicacao_mkt.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_mkt", int.Parse(cli_researcher_comunicacao_mkt.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_mkt", null); }
                if (cli_researcher_comunicacao_credibilidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_credibilidade", int.Parse(cli_researcher_comunicacao_credibilidade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_credibilidade", null); }
                if (cli_researcher_comunicacao_estruturado.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_estruturado", int.Parse(cli_researcher_comunicacao_estruturado.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_estruturado", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if ((cli_researcher_comunicacao_senso.SelectedIndex != 0) || (cli_researcher_comunicacao_eloquencia.SelectedIndex != 0) ||
                            (cli_researcher_comunicacao_objetivo.SelectedIndex != 0) || (cli_researcher_comunicacao_energia.SelectedIndex != 0) ||
                            (cli_researcher_comunicacao_ouvinte.SelectedIndex != 0) || (cli_researcher_comunicacao_mkt.SelectedIndex != 0) ||
                            (cli_researcher_comunicacao_credibilidade.SelectedIndex != 0) || (cli_researcher_comunicacao_estruturado.SelectedIndex != 0))
                                                    {
                                                        com.ExecuteNonQuery();
                                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                                                        cli_researcher_grid_media_geral.DataBind();
                                                        cli_researcher_grid_relatorio.DataBind();
                                                    }
                                                    else
                                                    { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); }
                }
            }
        }

        /* REGISTRO DE POTENCIAL ----------- ABA RESEARCHER COMUNICACAO */

        protected void Button36_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                //string compddl = "0";
                string valida = "null";
                int contador_comunicacao = 0;
                int contador_potencial = 0;

                //string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                //SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_cli_researcher", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_researcher_potencial_inteligencia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_inteligencia", int.Parse(cli_researcher_potencial_inteligencia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_inteligencia", null); }
                if (cli_researcher_potencial_maturidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_maturidade", int.Parse(cli_researcher_potencial_maturidade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_maturidade", null); }
                if (cli_researcher_potencial_visao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_visao", int.Parse(cli_researcher_potencial_visao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_visao", null); }
                if (cli_researcher_potencial_confianca.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_confianca", int.Parse(cli_researcher_potencial_confianca.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_confianca", null); }
                if (cli_researcher_potencial_honestidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_honestidade", int.Parse(cli_researcher_potencial_honestidade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_honestidade", null); }
                if (cli_researcher_potencial_punch.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_punch", int.Parse(cli_researcher_potencial_punch.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_punch", null); }
                if (cli_researcher_potencial_carisma.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@p_carisma", int.Parse(cli_researcher_potencial_carisma.SelectedValue)); }
                else { com.Parameters.AddWithValue("@p_carisma", null); }
                if (cli_researcher_comunicacao_senso.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_senso", int.Parse(cli_researcher_comunicacao_senso.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_senso", null); }
                if (cli_researcher_comunicacao_eloquencia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_eloquencia", int.Parse(cli_researcher_comunicacao_eloquencia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_eloquencia", null); }
                if (cli_researcher_comunicacao_objetivo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_objetivo", int.Parse(cli_researcher_comunicacao_objetivo.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_objetivo", null); }
                if (cli_researcher_comunicacao_energia.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_energia", int.Parse(cli_researcher_comunicacao_energia.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_energia", null); }
                if (cli_researcher_comunicacao_ouvinte.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_ouvinte", int.Parse(cli_researcher_comunicacao_ouvinte.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_ouvinte", null); }
                if (cli_researcher_comunicacao_mkt.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_mkt", int.Parse(cli_researcher_comunicacao_mkt.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_mkt", null); }
                if (cli_researcher_comunicacao_credibilidade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_credibilidade", int.Parse(cli_researcher_comunicacao_credibilidade.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_credibilidade", null); }
                if (cli_researcher_comunicacao_estruturado.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@c_estruturado", int.Parse(cli_researcher_comunicacao_estruturado.SelectedValue)); }
                else { com.Parameters.AddWithValue("@c_estruturado", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        if (cli_researcher_potencial_inteligencia.SelectedIndex != 0)
                        { contador_potencial += 1; }
                        if (cli_researcher_potencial_maturidade.SelectedIndex != 0)
                        { contador_potencial += 1; }
                        if (cli_researcher_potencial_visao.SelectedIndex != 0)
                        { contador_potencial += 1; }
                        if (cli_researcher_potencial_confianca.SelectedIndex != 0)
                        { contador_potencial += 1; }
                        if (cli_researcher_potencial_honestidade.SelectedIndex != 0)
                        { contador_potencial += 1; }
                        if (cli_researcher_potencial_punch.SelectedIndex != 0)
                        { contador_potencial += 1; }
                        if (cli_researcher_potencial_carisma.SelectedIndex != 0)
                        { contador_potencial += 1; }

                        if (cli_researcher_comunicacao_senso.SelectedIndex != 0)
                        { contador_comunicacao += 1; }
                        if (cli_researcher_comunicacao_eloquencia.SelectedIndex != 0)
                        { contador_comunicacao += 1; }
                        if (cli_researcher_comunicacao_objetivo.SelectedIndex != 0)
                        { contador_comunicacao += 1; }
                        if (cli_researcher_comunicacao_energia.SelectedIndex != 0)
                        { contador_comunicacao += 1; }
                        if (cli_researcher_comunicacao_ouvinte.SelectedIndex != 0)
                        { contador_comunicacao += 1; }
                        if (cli_researcher_comunicacao_mkt.SelectedIndex != 0)
                        { contador_comunicacao += 1; }
                        if (cli_researcher_comunicacao_credibilidade.SelectedIndex != 0)
                        { contador_comunicacao += 1; }
                        if (cli_researcher_comunicacao_estruturado.SelectedIndex != 0)
                        { contador_comunicacao += 1; }

                        if ((contador_potencial >= 3) && (contador_comunicacao >= 4))
                        {
                            com.ExecuteNonQuery();
                            cli_researcher_grid_media_geral.DataBind();
                            cli_researcher_grid_relatorio.DataBind();
                            contador_potencial = 0;
                            contador_comunicacao = 0;
                            exibe_mensagem_cliente(6, "entrevista registrada com sucesso!");
                        }
                        else
                        {
                            exibe_mensagem_cliente(6, "entrevista registrada sem sucesso, preencha o número mínimo de campos!");
                        }
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(6, "entrevista registrada sem sucesso!");
                    }
                }
            }
           
        }

        /* REGISTRO DE RELATORIO ----------- ABA RESEARCHER RELATORIO */

        protected void Button37_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                string salario_anterior = cli_researcher_relatorio_textsalario.Text;
                string salario = salario_anterior.Replace(".", "");
                salario = salario.Replace(",", ".");

                //string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                //SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_cli_researcher_relatorio", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_researcher_relatorio_textsalario.Text != "")
                { com.Parameters.AddWithValue("@salario", salario); }
                else { com.Parameters.AddWithValue("@salario", null); }
                if ((cli_researcher_relatorio_drive.SelectedValue != "0") && (cli_researcher_relatorio_drive.SelectedValue != ""))
                { com.Parameters.AddWithValue("@movimento", int.Parse(cli_researcher_relatorio_drive.SelectedValue)); }
                else { com.Parameters.AddWithValue("@movimento", null); }
                if ((cli_researcher_relatorio_radio_mudanca.SelectedValue != "0") && (cli_researcher_relatorio_radio_mudanca.SelectedValue != ""))
                { com.Parameters.AddWithValue("@mudanca", int.Parse(cli_researcher_relatorio_radio_mudanca.SelectedValue)); }
                else { com.Parameters.AddWithValue("@mudanca", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (cli_researcher_relatorio_textsalario.Text != comp)
                        {
                            exibe_mensagem_cliente(7, "cadastro feito com sucesso!");
                            com.ExecuteNonQuery();
                            cli_researcher_grid_relatorio.DataBind();
                            cli_researcher_grid_media_geral.DataBind();
                        }
                        else
                        {
                            exibe_mensagem_cliente(7, "cadastro feito sem sucesso!");
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(7, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        /* REGISTRO DE RELATORIO ----------- ABA CONSULTOR RELATORIO */

        protected void Button40_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";
                string salario_anterior = cli_consultor_relatorio_textsalario.Text;
                string salario = salario_anterior.Replace(".", "");
                salario = salario.Replace(",", ".");

                //string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                //SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand com = new SqlCommand("sp_cli_consultor_relatorio", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_consultor_relatorio_textsalario.Text != "")
                { com.Parameters.AddWithValue("@salario", salario); }
                else { com.Parameters.AddWithValue("@salario", null); }
                if ((cli_consultor_relatorio_drive.SelectedValue != "0") && (cli_consultor_relatorio_drive.SelectedValue != ""))
                { com.Parameters.AddWithValue("@movimento", int.Parse(cli_consultor_relatorio_drive.SelectedValue)); }
                else { com.Parameters.AddWithValue("@movimento", null); }
                if ((cli_consultor_relatorio_radio_mudanca.SelectedValue != "0") && (cli_consultor_relatorio_radio_mudanca.SelectedValue != ""))
                { com.Parameters.AddWithValue("@mudanca", int.Parse(cli_consultor_relatorio_radio_mudanca.SelectedValue)); }
                else { com.Parameters.AddWithValue("@mudanca", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (cli_consultor_relatorio_textsalario.Text != comp)
                        {
                            exibe_mensagem_cliente(9, "cadastro feito com sucesso!");
                            com.ExecuteNonQuery();
                            cli_consultor_grid_relatorio.DataBind();
                            cli_consultor_grid_media_geral.DataBind();
                            mensagem_cli_consultor_relatorio.ForeColor = System.Drawing.Color.Blue;
                        }
                        else
                        {
                            exibe_mensagem_cliente(9, "cadastro feito sem sucesso!");
                            mensagem_cli_consultor_relatorio.ForeColor = System.Drawing.Color.Red;
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(9, "cadastro feito sem sucesso!");
                        mensagem_cli_consultor_relatorio.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        /* REGISTRO DE HIERARQUIA ----------- ABA HIERARQUIA */

        protected void registra_hierarquia()
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 0;
                string sessao = "0";
                string valida = "null";

                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_cli_hierarquia", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@tipo", i);
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_hierarquia_drop_reporta.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@reportase", int.Parse(cli_hierarquia_drop_reporta.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@reportase", null); }
                if (cli_hierarquia_drop_reporta_a_quem.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@reportados", int.Parse(cli_hierarquia_drop_reporta_a_quem.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@reportados", null); }
                if (cli_hierarquia_text_nro_subordinados.Text != "")
                {com.Parameters.AddWithValue("@qtd_subordinados", int.Parse(cli_hierarquia_text_nro_subordinados.Text));}
                else {com.Parameters.AddWithValue("@qtd_subordinados", null);}
                if (cli_hierarquia_text_subordinados_diretos.Text != "")
                {com.Parameters.AddWithValue("@qtd_subordinados_diretos", int.Parse(cli_hierarquia_text_subordinados_diretos.Text));}
                else {com.Parameters.AddWithValue("@qtd_subordinados_diretos", null);}
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        exibe_mensagem_cliente(10, "cadastro feita com sucesso!");
                    }
                    else
                    {
                        exibe_mensagem_cliente(10, "preencha o campo faltando!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(10, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        protected void Button47_Click(object sender, EventArgs e)
        {
            registra_hierarquia();
        }

        /* REGISTRO DE OBSERVAÇÃO ----------- ABA CONSULTOR OBSERVACAO */

        protected void Button48_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 0;
                string sessao = "0";
                string comp = "";
                string valida = "null";

                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }

                int id_linha = 0;
                int row_usuario = 0;

                if (cli_consultor_gridobs.SelectedIndex > -1)
                {
                    id_linha = int.Parse(cli_consultor_gridobs.DataKeys[cli_consultor_gridobs.SelectedIndex].Values["id"].ToString());
                    row_usuario = int.Parse(cli_consultor_gridobs.DataKeys[cli_consultor_gridobs.SelectedIndex].Values["usuario_alteracao"].ToString());
                }

                SqlCommand com = new SqlCommand("sp_cli_consultor_obs", con);
                com.CommandType = CommandType.StoredProcedure;

                
                com.Parameters.AddWithValue("@tipo", i);
                if (id_linha != 0)
                { com.Parameters.AddWithValue("@id_linha", id_linha); }
                else { com.Parameters.AddWithValue("@id_linha", null); }
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                com.Parameters.AddWithValue("@obs", cli_consultor_textobs.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                SqlCommand perguntas = new SqlCommand("sp_cli_consultor", con);
                perguntas.CommandType = CommandType.StoredProcedure;

                perguntas.Parameters.AddWithValue("@tipo", i);
                perguntas.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_consultor_potencial_inteligencia.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@p_inteligencia", int.Parse(cli_consultor_potencial_inteligencia.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@p_inteligencia", null); }
                if (cli_consultor_potencial_maturidade.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@p_maturidade", int.Parse(cli_consultor_potencial_maturidade.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@p_maturidade", null); }
                if (cli_consultor_potencial_visao.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@p_visao", int.Parse(cli_consultor_potencial_visao.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@p_visao", null); }
                if (cli_consultor_potencial_confianca.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@p_confianca", int.Parse(cli_consultor_potencial_confianca.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@p_confianca", null); }
                if (cli_consultor_potencial_honestidade.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@p_honestidade", int.Parse(cli_consultor_potencial_honestidade.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@p_honestidade", null); }
                if (cli_consultor_potencial_punch.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@p_punch", int.Parse(cli_consultor_potencial_punch.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@p_punch", null); }
                if (cli_consultor_potencial_carisma.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@p_carisma", int.Parse(cli_consultor_potencial_carisma.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@p_carisma", null); }
                if (cli_consultor_apresentacao_saudacao.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@a_saudacao", int.Parse(cli_consultor_apresentacao_saudacao.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@a_saudacao", null); }
                if (cli_consultor_apresentacao_impressao.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@a_impressao", int.Parse(cli_consultor_apresentacao_impressao.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@a_impressao", null); }
                if (cli_consultor_apresentacao_levantou.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@a_levantou", int.Parse(cli_consultor_apresentacao_levantou.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@a_levantou", null); }
                if (cli_consultor_apresentacao_profissionalismo.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@a_profissionalismo", int.Parse(cli_consultor_apresentacao_profissionalismo.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@a_profissionalismo", null); }
                if (cli_consultor_comunicacao_senso.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_senso", int.Parse(cli_consultor_comunicacao_senso.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_senso", null); }
                if (cli_consultor_comunicacao_eloquencia.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_eloquencia", int.Parse(cli_consultor_comunicacao_eloquencia.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_eloquencia", null); }
                if (cli_consultor_comunicacao_objetivo.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_objetivo", int.Parse(cli_consultor_comunicacao_objetivo.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_objetivo", null); }
                if (cli_consultor_comunicacao_energia.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_energia", int.Parse(cli_consultor_comunicacao_energia.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_energia", null); }
                if (cli_consultor_comunicacao_ouvinte.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_ouvinte", int.Parse(cli_consultor_comunicacao_ouvinte.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_ouvinte", null); }
                if (cli_consultor_comunicacao_mkt.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_mkt", int.Parse(cli_consultor_comunicacao_mkt.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_mkt", null); }
                if (cli_consultor_comunicacao_credibilidade.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_credibilidade", int.Parse(cli_consultor_comunicacao_credibilidade.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_credibilidade", null); }
                if (cli_consultor_comunicacao_estruturado.SelectedIndex != 0)
                { perguntas.Parameters.AddWithValue("@c_estruturado", int.Parse(cli_consultor_comunicacao_estruturado.SelectedValue)); }
                else { perguntas.Parameters.AddWithValue("@c_estruturado", null); }
                perguntas.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCountPergunta = perguntas.Parameters.Add("@retorno", SqlDbType.Int);
                rowCountPergunta.Direction = ParameterDirection.Output;

                try
                {
                    if (cli_consultor_textobs.Text != comp)
                        {
                            if ((row_usuario == 0) || (id_usuario == row_usuario))
                            {
                                if (((cli_consultor_potencial_inteligencia.SelectedIndex != 0) && (cli_consultor_potencial_maturidade.SelectedIndex != 0) &&
                            (cli_consultor_potencial_visao.SelectedIndex != 0) && (cli_consultor_potencial_confianca.SelectedIndex != 0) &&
                            (cli_consultor_potencial_honestidade.SelectedIndex != 0) && (cli_consultor_potencial_punch.SelectedIndex != 0) &&
                            (cli_consultor_potencial_carisma.SelectedIndex != 0) &&

                            (cli_consultor_apresentacao_saudacao.SelectedIndex != 0) &&
                            (cli_consultor_apresentacao_impressao.SelectedIndex != 0) && (cli_consultor_apresentacao_levantou.SelectedIndex != 0) &&
                            (cli_consultor_apresentacao_profissionalismo.SelectedIndex != 0) &&

                            (cli_consultor_comunicacao_senso.SelectedIndex != 0) && (cli_consultor_comunicacao_eloquencia.SelectedIndex != 0) &&
                            (cli_consultor_comunicacao_objetivo.SelectedIndex != 0) && (cli_consultor_comunicacao_energia.SelectedIndex != 0) &&
                            (cli_consultor_comunicacao_ouvinte.SelectedIndex != 0) && (cli_consultor_comunicacao_mkt.SelectedIndex != 0) &&
                            (cli_consultor_comunicacao_credibilidade.SelectedIndex != 0) && (cli_consultor_comunicacao_estruturado.SelectedIndex != 0))) //&& (cli_consultor_gridobs.SelectedIndex != 0)))
                                {
                                    perguntas.ExecuteNonQuery();
                                    cli_consultor_grid_media_geral.DataBind();
                                    cli_consultor_grid_relatorio.DataBind();
                                    exibe_mensagem_cliente(8, "entrevista registrada com sucesso!");

                                    cli_consultor_apresentacao_impressao.SelectedValue = "0";
                                    cli_consultor_apresentacao_levantou.SelectedValue = "0";
                                    cli_consultor_apresentacao_saudacao.SelectedValue = "0";
                                    cli_consultor_apresentacao_profissionalismo.SelectedValue = "0";
                                    cli_consultor_comunicacao_senso.SelectedValue = "0";
                                    cli_consultor_comunicacao_energia.SelectedValue = "0";
                                    cli_consultor_comunicacao_credibilidade.SelectedValue = "0";
                                    cli_consultor_comunicacao_eloquencia.SelectedValue = "0";
                                    cli_consultor_comunicacao_ouvinte.SelectedValue = "0";
                                    cli_consultor_comunicacao_estruturado.SelectedValue = "0";
                                    cli_consultor_comunicacao_objetivo.SelectedValue = "0";
                                    cli_consultor_comunicacao_mkt.SelectedValue = "0";
                                    cli_consultor_potencial_inteligencia.SelectedValue = "0";
                                    cli_consultor_potencial_confianca.SelectedValue = "0";
                                    cli_consultor_potencial_punch.SelectedValue = "0";
                                    cli_consultor_potencial_maturidade.SelectedValue = "0";
                                    cli_consultor_potencial_honestidade.SelectedValue = "0";
                                    cli_consultor_potencial_carisma.SelectedValue = "0";
                                    cli_consultor_potencial_visao.SelectedValue = "0";
                                 
                                    com.ExecuteNonQuery();
                                    cli_consultor_gridobs.DataBind();
                                    cli_consultor_gridobs.SelectedIndex = -1;
                                    cli_consultor_textobs.Text = "";
                                    exibe_mensagem_cliente(8, "entrevista registrada com sucesso!");
                                    mensagem_cli_consultor_entrevista.ForeColor = System.Drawing.Color.Blue;
                                }
                                else
                                {
                                    if (cli_consultor_gridobs.SelectedIndex != -1)
                                    {
                                        com.ExecuteNonQuery();
                                        cli_consultor_gridobs.DataBind();
                                        cli_consultor_gridobs.SelectedIndex = -1;
                                        cli_consultor_textobs.Text = "";
                                        exibe_mensagem_cliente(8, "entrevista registrada com sucesso!");
                                        mensagem_cli_consultor_entrevista.ForeColor = System.Drawing.Color.Blue;
                                    }
                                    else
                                    {
                                        exibe_mensagem_cliente(8, "entrevista registrada sem sucesso, notas e observação obrigatórios!");
                                        mensagem_cli_consultor_entrevista.ForeColor = System.Drawing.Color.Red;
                                    }
                                }
                            }
                            else 
                            { 
                                exibe_mensagem_cliente(8, "usuário não pode alterar observação selecionada!");
                                mensagem_cli_consultor_entrevista.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        else
                        { 
                            exibe_mensagem_cliente(8, "preencha o campo faltando!");
                            mensagem_cli_consultor_entrevista.ForeColor = System.Drawing.Color.Red;
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(8, "cadastro feito sem sucesso!");
                        mensagem_cli_consultor_entrevista.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        /* LIMPEZA DE OBSERVAÇÃO ----------- ABA CONSULTOR OBSERVACAO */

        protected void Button49_Click(object sender, EventArgs e)
        {
            cli_consultor_textobs.Text = "";
            cli_consultor_gridobs.SelectedIndex = -1;
        }

        /* INSERÇÃO DE OBSERVAÇÃO ----------- ABA RESEARCHER OBSERVACAO */

        protected void Button50_Click(object sender, EventArgs e)
        {         
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 0;
                string sessao = "0";
                string comp = "";

                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }

                SqlCommand com = new SqlCommand("sp_cli_researcher_obs", con);
                com.CommandType = CommandType.StoredProcedure;

                int id_linha = 0;
                int row_usuario = 0;

                if (cli_researcher_gridobs.SelectedIndex > -1)
                {                    
                    id_linha = int.Parse(cli_researcher_gridobs.DataKeys[cli_researcher_gridobs.SelectedIndex].Values["id"].ToString());
                    row_usuario = int.Parse(cli_researcher_gridobs.DataKeys[cli_researcher_gridobs.SelectedIndex].Values["usuario_alteracao"].ToString());
                }


                com.Parameters.AddWithValue("@tipo", i);
                if (id_linha != 0)
                { com.Parameters.AddWithValue("@id_linha", id_linha); }
                else { com.Parameters.AddWithValue("@id_linha", null); }
                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                com.Parameters.AddWithValue("@obs", cli_researcher_textobs.Text);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;                

                int erro = 1;
                int id_enquete = 0;
                foreach (GridViewRow row in cli_grid_resposta.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("cli_check");
                    if (cb != null && cb.Checked)
                    {
                        if (pergunta_do_mes.Visible == true)
                        {
                            erro = 0;
                        }
                    }
                }

                //Verifica se é uma atualização para retirar a obrigatoriedade do preenchimento da pergunta

                if (cli_researcher_gridobs.SelectedIndex > -1)
                {
                    erro = 0;
                }

                int contador_comunicacao = 0;
                int contador_potencial = 0;

                //string sql = "Select id from bc_empresa_unq where nome like '%" + proj_produto_empresa.Text + "%'";
                //SqlDataAdapter da = new SqlDataAdapter(sql, conexao);

                SqlCommand pergunta = new SqlCommand("sp_cli_researcher", con);
                pergunta.CommandType = CommandType.StoredProcedure;

                pergunta.Parameters.AddWithValue("@tipo", i);
                pergunta.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_researcher_potencial_inteligencia.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@p_inteligencia", int.Parse(cli_researcher_potencial_inteligencia.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@p_inteligencia", null); }
                if (cli_researcher_potencial_maturidade.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@p_maturidade", int.Parse(cli_researcher_potencial_maturidade.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@p_maturidade", null); }
                if (cli_researcher_potencial_visao.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@p_visao", int.Parse(cli_researcher_potencial_visao.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@p_visao", null); }
                if (cli_researcher_potencial_confianca.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@p_confianca", int.Parse(cli_researcher_potencial_confianca.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@p_confianca", null); }
                if (cli_researcher_potencial_honestidade.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@p_honestidade", int.Parse(cli_researcher_potencial_honestidade.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@p_honestidade", null); }
                if (cli_researcher_potencial_punch.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@p_punch", int.Parse(cli_researcher_potencial_punch.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@p_punch", null); }
                if (cli_researcher_potencial_carisma.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@p_carisma", int.Parse(cli_researcher_potencial_carisma.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@p_carisma", null); }
                if (cli_researcher_comunicacao_senso.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_senso", int.Parse(cli_researcher_comunicacao_senso.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_senso", null); }
                if (cli_researcher_comunicacao_eloquencia.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_eloquencia", int.Parse(cli_researcher_comunicacao_eloquencia.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_eloquencia", null); }
                if (cli_researcher_comunicacao_objetivo.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_objetivo", int.Parse(cli_researcher_comunicacao_objetivo.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_objetivo", null); }
                if (cli_researcher_comunicacao_energia.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_energia", int.Parse(cli_researcher_comunicacao_energia.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_energia", null); }
                if (cli_researcher_comunicacao_ouvinte.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_ouvinte", int.Parse(cli_researcher_comunicacao_ouvinte.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_ouvinte", null); }
                if (cli_researcher_comunicacao_mkt.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_mkt", int.Parse(cli_researcher_comunicacao_mkt.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_mkt", null); }
                if (cli_researcher_comunicacao_credibilidade.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_credibilidade", int.Parse(cli_researcher_comunicacao_credibilidade.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_credibilidade", null); }
                if (cli_researcher_comunicacao_estruturado.SelectedIndex != 0)
                { pergunta.Parameters.AddWithValue("@c_estruturado", int.Parse(cli_researcher_comunicacao_estruturado.SelectedValue)); }
                else { pergunta.Parameters.AddWithValue("@c_estruturado", null); }
                pergunta.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCountPergunta = pergunta.Parameters.Add("@retorno", SqlDbType.Int);
                rowCountPergunta.Direction = ParameterDirection.Output;

                if (cli_researcher_potencial_inteligencia.SelectedIndex != 0)
                { contador_potencial += 1; }
                if (cli_researcher_potencial_maturidade.SelectedIndex != 0)
                { contador_potencial += 1; }
                if (cli_researcher_potencial_visao.SelectedIndex != 0)
                { contador_potencial += 1; }
                if (cli_researcher_potencial_confianca.SelectedIndex != 0)
                { contador_potencial += 1; }
                if (cli_researcher_potencial_honestidade.SelectedIndex != 0)
                { contador_potencial += 1; }
                if (cli_researcher_potencial_punch.SelectedIndex != 0)
                { contador_potencial += 1; }
                if (cli_researcher_potencial_carisma.SelectedIndex != 0)
                { contador_potencial += 1; }

                if (cli_researcher_comunicacao_senso.SelectedIndex != 0)
                { contador_comunicacao += 1; }
                if (cli_researcher_comunicacao_eloquencia.SelectedIndex != 0)
                { contador_comunicacao += 1; }
                if (cli_researcher_comunicacao_objetivo.SelectedIndex != 0)
                { contador_comunicacao += 1; }
                if (cli_researcher_comunicacao_energia.SelectedIndex != 0)
                { contador_comunicacao += 1; }
                if (cli_researcher_comunicacao_ouvinte.SelectedIndex != 0)
                { contador_comunicacao += 1; }
                if (cli_researcher_comunicacao_mkt.SelectedIndex != 0)
                { contador_comunicacao += 1; }
                if (cli_researcher_comunicacao_credibilidade.SelectedIndex != 0)
                { contador_comunicacao += 1; }
                if (cli_researcher_comunicacao_estruturado.SelectedIndex != 0)
                { contador_comunicacao += 1; }              
                

                try
                {
                    if (((cli_researcher_textobs.Text != comp) && (erro == 0)) || ((cli_researcher_textobs.Text != comp) && (pergunta_do_mes.Visible == false)))
                    {
                        if (((contador_potencial >= 3) && (contador_comunicacao >= 4)) || (cli_researcher_gridobs.SelectedIndex != -1))
                        {
                            pergunta.ExecuteNonQuery();
                            cli_researcher_grid_media_geral.DataBind();
                            cli_researcher_grid_relatorio.DataBind();
                            contador_potencial = 0;
                            contador_comunicacao = 0;

                            cli_researcher_comunicacao_senso.SelectedValue = "0";
                            cli_researcher_comunicacao_energia.SelectedValue = "0";
                            cli_researcher_comunicacao_credibilidade.SelectedValue = "0";
                            cli_researcher_comunicacao_eloquencia.SelectedValue = "0";
                            cli_researcher_comunicacao_ouvinte.SelectedValue = "0";
                            cli_researcher_comunicacao_estruturado.SelectedValue = "0";
                            cli_researcher_comunicacao_objetivo.SelectedValue = "0";
                            cli_researcher_comunicacao_mkt.SelectedValue = "0";
                            cli_researcher_potencial_inteligencia.SelectedValue = "0";
                            cli_researcher_potencial_confianca.SelectedValue = "0";
                            cli_researcher_potencial_punch.SelectedValue = "0";
                            cli_researcher_potencial_maturidade.SelectedValue = "0";
                            cli_researcher_potencial_honestidade.SelectedValue = "0";
                            cli_researcher_potencial_carisma.SelectedValue = "0";
                            cli_researcher_potencial_visao.SelectedValue = "0";

                            foreach (GridViewRow row in cli_grid_resposta.Rows)
                            {
                                CheckBox cb = (CheckBox)row.FindControl("cli_check");
                                if (cb != null && cb.Checked)
                                {
                                    id_enquete = int.Parse(cli_grid_resposta.DataKeys[row.RowIndex].Value.ToString());
                                    SqlCommand comm = new SqlCommand("sp_cli_pergunta", con);
                                    comm.CommandType = CommandType.StoredProcedure;

                                    comm.Parameters.AddWithValue("@id_pergunta", id_pergunta_do_mes.Value);
                                    comm.Parameters.AddWithValue("@id_cliente", id_cliente);
                                    comm.Parameters.AddWithValue("@usuario", id_usuario);
                                    comm.Parameters.AddWithValue("@id_resposta", id_enquete);

                                    SqlParameter rowCount1 = comm.Parameters.Add("@retorno", SqlDbType.Int);
                                    rowCount1.Direction = ParameterDirection.Output;
                                    comm.ExecuteNonQuery();
                                }
                            }
                            cli_grid_resposta.DataBind();
                            Label189.Visible = false;
                            pergunta_do_mes.Visible = false;
                            if ((row_usuario == 0) || (id_usuario == row_usuario))
                            {
                                com.ExecuteNonQuery();
                                cli_researcher_gridobs.DataBind();
                                cli_researcher_gridobs.SelectedIndex = -1;
                                cli_researcher_textobs.Text = "";
                                exibe_mensagem_cliente(6, "registro feito com sucesso!");
                            }
                            else { exibe_mensagem_cliente(6, "usuário não pode alterar observação selecionada!"); }
                        }
                        else
                        {
                            exibe_mensagem_cliente(6, "entrevista registrada sem sucesso, preencha o número mínimo de campos!");
                        }
                    }
                    else
                    {
                        exibe_mensagem_cliente(6, "preencha o campo faltando ou responda a pergunta!");
                    }                   

                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(6, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        /* LIMPEZA DE OBSERVAÇÃO ----------- ABA RESEARCHER OBSERVACAO */
        
        protected void Button51_Click(object sender, EventArgs e)
        {
            cli_researcher_textobs.Text = "";
            cli_researcher_gridobs.SelectedIndex = -1;
        }

        /* SALVAR CURRICULUM ----------- ABA PROFISSIONAL */

        protected void Button52_Click(object sender, EventArgs e)
        {
            string savepath = @"\\servidor01\Publico\uploads\cvs\";
            int id_cliente = 0;
            int id_usuario = int.Parse(Session["IDusuario"].ToString());
            string tipo_conteudo = "";
            string tipo_arquivo = ".";

            if (Session["IDcliente"] != null)
            { id_cliente = int.Parse(Session["IDcliente"].ToString()); }

            if (Upload_Curriculum.HasFile)
            {
                if ((Session["IDcliente"].ToString() != "") && (Session["IDcliente"] != null))
                {
                    string filename = Session["IDcliente"].ToString();
                    string tipo = Upload_Curriculum.PostedFile.FileName.Substring(Upload_Curriculum.PostedFile.FileName.LastIndexOf(".") + 1);
                    tipo_arquivo = tipo_arquivo + tipo;
                    if ((tipo == "doc") || (tipo == "docx") || (tipo == "pdf") || (tipo == "xls") || (tipo == "xlsx") || (tipo == "jpg") || (tipo == "png"))
                    {                      
                        filename = filename + "_" + cli_profissional_idioma_cv.SelectedItem.ToString() + "." + tipo;
                        Byte[] bytes = Upload_Curriculum.FileBytes;                                      
                        if ((tipo == "doc") || (tipo == "docx"))
                        { tipo_conteudo = "application/vnd.ms-word"; }
                        if ((tipo == "xls") || (tipo == "xlsx"))
                        { tipo_conteudo = "application/vnd.ms-excel"; }
                        if (tipo == "pdf")
                        { tipo_conteudo = "application/pdf"; }
                                                
                        string cstr = conexao;
                        using (SqlConnection con = new SqlConnection(cstr))
                        {
                            con.Open();

                            SqlCommand com = new SqlCommand("sp_cli_base_cvs", con);
                            com.CommandType = CommandType.StoredProcedure;

                            com.Parameters.AddWithValue("@tipo", 1);
                            com.Parameters.AddWithValue("@tipo_arq", tipo_arquivo);
                            com.Parameters.AddWithValue("@id_cliente", id_cliente);
                            com.Parameters.AddWithValue("@nome_arquivo", filename);
                            com.Parameters.AddWithValue("@tipo_arquivo", tipo_conteudo);
                            if (cli_profissional_idioma_cv.SelectedIndex != 0)
                            { com.Parameters.AddWithValue("@idioma", int.Parse(cli_profissional_idioma_cv.SelectedValue.ToString())); }
                            else { com.Parameters.AddWithValue("@idioma", null); }
                            com.Parameters.AddWithValue("@caminho", savepath);
                            com.Parameters.AddWithValue("@cv", null);
                            com.Parameters.AddWithValue("@dados", bytes);
                            com.Parameters.AddWithValue("@usuario", id_usuario);


                            SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                            rowCount.Direction = ParameterDirection.Output;

                            try
                            {
                                if (cli_profissional_idioma_cv.SelectedIndex != 0)
                                {
                                    if (bytes != null)
                                    {
                                        com.ExecuteNonQuery();
                                        cli_profissional_grid_anexos.DataBind();
                                        exibe_mensagem_cliente(2, "cadastro de currículum feito com sucesso!");
                                    }
                                    else
                                    {
                                        exibe_mensagem_cliente(2, "cadastro feito sem sucesso, arquivo vazio!");
                                    }
                                }
                                else
                                {
                                    exibe_mensagem_cliente(2, "cadastro feito sem sucesso, favor selecionar um idioma!");
                                }
                            }
                            catch (SqlException exc)
                            {
                                if (exc.Message.Contains("NULL"))
                                {
                                    exibe_mensagem_cliente(2, "cadastro feito sem sucesso, favor efetuar cadastro novamente!");
                                }
                            }
                        }
                    }
                }
            }
            else    
            {
                exibe_mensagem_cliente(2, "cadastro de currículum feito sem sucesso!");                 
            }

        }

        /* ABRIR CURRICULUM ----------- ABA PROFISSIONAL */

        protected void Button53_Click(object sender, EventArgs e)
        {
                string strQuery = "SELECT nome_arquivo, tipo_arquivo, dados FROM bc_cli_base_cvs where id_cliente=@id_cliente and idioma=@idioma";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@id_cliente", int.Parse(Session["IDcliente"].ToString()));
                cmd.Parameters.Add("@idioma", int.Parse(cli_profissional_idioma_cv.SelectedValue).ToString());
                DataTable dt = GetData(cmd);
                if ((dt != null) && (dt.Rows.Count != 0))
                {
                    download(dt);
                }
                else 
                {
                    exibe_mensagem_cliente(2, "CV não cadastrado na base!"); 
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
               
        //CARREGAR CLIENTE DO GRID SUPERIOR

        protected void grid_busca_cliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                limpar_dados_cliente();
                Session["label_modulo"] = grid_busca_cliente.SelectedRow.Cells[1].Text.ToString();
                Session["IDcliente"] = grid_busca_cliente.SelectedRow.Cells[26].Text.ToString();
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                //PREENCHE A LABEL EM DADOS CADASTRAIS DE CLIENTE

                if (Session["IDcliente"] != null)
                {
                    cli_dadoscadastrais_label_id.Text = "ID: " + Session["IDcliente"].ToString();
                }
                else
                { cli_dadoscadastrais_label_id.Text = ""; }

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);

                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(retorno_grid_cliente);
                Session["retorno_cliente"] = retorno_grid_cliente;

                if (Session["retorno_cliente"] != null)
                {
                    retorno_cliente.DataSource = Session["retorno_cliente"];
                    retorno_cliente.DataBind();

                    if (retorno_cliente.Rows[0].Cells[1].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textnome.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[1].Text.ToString());
                    }
                    else { cli_dadoscadastrais_textnome.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[6].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textendereco.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[6].Text);
                    }
                    else { cli_dadoscadastrais_textendereco.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[7].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textnro.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[7].Text);
                    }
                    else { cli_dadoscadastrais_textnro.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[8].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textcomplemento.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[8].Text);
                    }
                    else { cli_dadoscadastrais_textcomplemento.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[2].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textcpf.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[2].Text.ToString());
                    }
                    else { cli_dadoscadastrais_textcpf.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[3].Text != "&nbsp;")
                    {
                        string valor = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[3].Text).ToString();
                        string conversao = valor.Replace("/", "");                        
                    }
                    else { cli_dadoscadastrais_textnascimento.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[10].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textbairro.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[10].Text.ToString());
                    }
                    else { cli_dadoscadastrais_textbairro.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[9].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textcep.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[9].Text);
                    }
                    else { cli_dadoscadastrais_textcep.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[4].Text == "&nbsp;")
                    { cli_dadoscadastrais_dropestadocivil.SelectedValue = "0"; }
                    else
                    {
                        cli_dadoscadastrais_dropestadocivil.DataBind();
                        cli_dadoscadastrais_dropestadocivil.SelectedValue = retorno_cliente.Rows[0].Cells[4].Text;
                    }

                    if (retorno_cliente.Rows[0].Cells[5].Text == "&nbsp;")
                    { cli_dadoscadastrais_dropsexo.SelectedValue = "0"; }
                    else
                    {
                        cli_dadoscadastrais_dropsexo.DataBind();
                        cli_dadoscadastrais_dropsexo.SelectedValue = retorno_cliente.Rows[0].Cells[5].Text;
                    }

                    if (retorno_cliente.Rows[0].Cells[12].Text == "&nbsp;")
                    {
                        cli_dadoscadastrais_dropestado.DataBind();
                        cli_dadoscadastrais_dropestado.SelectedValue = "0";
                    }
                    else
                    {
                        cli_dadoscadastrais_dropestado.DataBind();
                        cli_dadoscadastrais_dropestado.SelectedValue = retorno_cliente.Rows[0].Cells[12].Text;
                        cli_dadoscadastrais_dropcidade.DataBind();
                        if (retorno_cliente.Rows[0].Cells[11].Text != "&nbsp;")
                        {
                            cli_dadoscadastrais_dropcidade.SelectedValue = retorno_cliente.Rows[0].Cells[11].Text;
                        }
                    }
                    if (retorno_cliente.Rows[0].Cells[13].Text == "&nbsp;")
                    {
                        cli_dadoscadastrais_droppais.DataBind();
                        cli_dadoscadastrais_droppais.SelectedValue = "0";
                    }
                    else
                    {
                        cli_dadoscadastrais_droppais.DataBind();
                        cli_dadoscadastrais_droppais.SelectedValue = retorno_cliente.Rows[0].Cells[13].Text;
                    }

                    if (retorno_cliente.Rows[0].Cells[17].Text == "&nbsp;")
                    {
                        cli_hierarquia_drop_reporta.DataBind();
                        cli_hierarquia_drop_reporta.SelectedValue = "0";
                    }
                    else
                    {
                        cli_hierarquia_drop_reporta.DataBind();
                        cli_hierarquia_drop_reporta.SelectedValue = retorno_cliente.Rows[0].Cells[17].Text;
                    }

                    if (retorno_cliente.Rows[0].Cells[16].Text == "&nbsp;")
                    {
                        cli_hierarquia_drop_reporta_a_quem.DataBind();
                        cli_hierarquia_drop_reporta_a_quem.SelectedValue = "0";
                    }
                    else
                    {
                        cli_hierarquia_drop_reporta_a_quem.DataBind();
                        cli_hierarquia_drop_reporta_a_quem.SelectedValue = retorno_cliente.Rows[0].Cells[16].Text;
                    }

                    if (retorno_cliente.Rows[0].Cells[18].Text != "&nbsp;")
                    {
                        cli_hierarquia_text_nro_subordinados.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[18].Text);
                    }
                    else { cli_hierarquia_text_nro_subordinados.Text = ""; }

                    if (retorno_cliente.Rows[0].Cells[19].Text != "&nbsp;")
                    {
                        cli_hierarquia_text_subordinados_diretos.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[19].Text);
                    }
                    else { cli_hierarquia_text_subordinados_diretos.Text = ""; }
                    if (retorno_cliente.Rows[0].Cells[20].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textnomemae.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[20].Text);
                    }
                    else { cli_dadoscadastrais_textnomemae.Text = ""; }
                    if (retorno_cliente.Rows[0].Cells[21].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textnomepai.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[21].Text);
                    }
                    else { cli_dadoscadastrais_textnomepai.Text = ""; }
                    if (retorno_cliente.Rows[0].Cells[22].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_textrg.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[22].Text);
                    }
                    else { cli_dadoscadastrais_textrg.Text = ""; }
                    if (retorno_cliente.Rows[0].Cells[23].Text != "&nbsp;")
                    {
                        cli_dadoscadastrais_label_idade.Text = HttpUtility.HtmlDecode(retorno_cliente.Rows[0].Cells[23].Text) + " anos";
                    }
                    else { cli_dadoscadastrais_label_idade.Text = ""; }
                    if (retorno_cliente.Rows[0].Cells[24].Text == "&nbsp;")
                    { cli_dadoscadastrais_dropestadouf.SelectedValue = "0"; }
                    else
                    {
                        cli_dadoscadastrais_dropestadouf.DataBind();
                        cli_dadoscadastrais_dropestadouf.SelectedValue = retorno_cliente.Rows[0].Cells[24].Text;
                        cli_dadoscadastrais_dropnaturalidade.DataBind();
                        if (retorno_cliente.Rows[0].Cells[25].Text != "&nbsp;")
                        {
                            cli_dadoscadastrais_dropnaturalidade.SelectedValue = retorno_cliente.Rows[0].Cells[25].Text;
                        }
                    }

                    //OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"

                    foreach (GridViewRow row in grid_busca_cliente.Rows)//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                    {//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                        if (Session["IDcliente"].ToString() == grid_busca_cliente.DataKeys[row.RowIndex].Values["id_cliente"].ToString())
                        {
                            grid_busca_cliente.Rows[row.RowIndex].Font.Bold = true;
                        }
                        else { grid_busca_cliente.Rows[row.RowIndex].Font.Bold = false; }
                    }

                    cli_projetos_grid_projetos.DataBind();
                    cli_researcher_grid_relatorio.DataBind();
                    cli_researcher_grid_media_geral.DataBind();
                    cli_dadoscadastrais_grid_email.DataBind();
                    cli_dadoscadastrais_gridtelefone.DataBind();
                    cli_havik_drop_projeto.DataBind();
                    cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");

                }
                if (MultiView2.ActiveViewIndex == 4)
                { Session["persistencia_aba"] = 1; }
                Response.Redirect("Cliente.aspx");
            }
        }

        /* EXCLUIR BENEFICIO ----------- ABA PROFISSIONAL */

        protected void Button55_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string comp = "";
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_delete_cli_beneficios", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                com.Parameters.AddWithValue("@id_beneficio", int.Parse(cli_profissional_listabeneficios.SelectedValue.ToString()));
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        if (cli_profissional_listabeneficios.SelectedValue != comp)
                        {
                            com.ExecuteNonQuery();
                            cli_profissional_listabeneficios.DataBind();
                        }
                        else
                        {
                            exibe_mensagem_cliente(2, "benefício excluído sem sucesso!");
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(2, "benefício excluído sem sucesso!");
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_cliente(2, "benefício excluído com sucesso!"); 
                }
            }
        }

        protected void cli_dadoscadastrais_grid_email_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_email = 0;

                SqlCommand com = new SqlCommand("sp_cli_altera_email", con);
                com.CommandType = CommandType.StoredProcedure;

                GridViewRow row = cli_dadoscadastrais_grid_email.Rows[cli_dadoscadastrais_grid_email.SelectedIndex];
                id_email = int.Parse(row.Cells[1].Text);

                com.Parameters.AddWithValue("@id", id_email);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            cli_dadoscadastrais_grid_email.DataBind();
                            cli_dadoscadastrais_grid_email.SelectedIndex = -1;
                        }
                        else
                        {
                            exibe_mensagem_cliente(1, "exclusão feita sem sucesso!");
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(1, "exclusão feita sem sucesso!");
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_cliente(1, "exclusão feita com sucesso!");
                }
            }
        }

        protected void cli_dadoscadastrais_gridtelefone_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_telefone = 0;

                SqlCommand com = new SqlCommand("sp_cli_altera_telefone", con);
                com.CommandType = CommandType.StoredProcedure;

                GridViewRow row = cli_dadoscadastrais_gridtelefone.Rows[cli_dadoscadastrais_gridtelefone.SelectedIndex];
                id_telefone = int.Parse(row.Cells[1].Text);

                com.Parameters.AddWithValue("@id", id_telefone);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        cli_dadoscadastrais_gridtelefone.DataBind();
                    }
                    else
                    {
                        exibe_mensagem_cliente(1, "exclusão feita sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(1, "exclusão feita sem sucesso!");
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_cliente(1, "exclusão feita com sucesso!");
                }
            }
        }

        protected void cli_projetos_grid_projetos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                GridViewRow row = cli_projetos_grid_projetos.Rows[cli_projetos_grid_projetos.SelectedIndex];
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

        protected void limpar_dados_cliente()
        {
            Session["IDcliente"] = null;
            //Session["retorno_cliente"] = null;
            cli_dadoscadastrais_textnome.Text = "";
            cli_dadoscadastrais_textcpf.Text = "";
            cli_dadoscadastrais_textnascimento.Text = "";
            cli_dadoscadastrais_dropestadocivil.SelectedValue = "0";
            cli_dadoscadastrais_dropsexo.SelectedValue = "0";
            cli_dadoscadastrais_textendereco.Text = "";
            cli_dadoscadastrais_textcep.Text = "";
            cli_dadoscadastrais_dropestado.SelectedValue = "0";
            cli_dadoscadastrais_dropcidade.DataBind();
            cli_dadoscadastrais_textbairro.Text = "";
            cli_dadoscadastrais_droppais.SelectedValue = "0";
            cli_dadoscadastrais_textemail.Text = "";
            cli_dadoscadastrais_textcodpais.Text = "";
            cli_dadoscadastrais_textddd.Text = "";
            cli_dadoscadastrais_texttelefone.Text = "";
            cli_dadoscadastrais_drop_tipotel.SelectedValue = "0";

            cli_profissional_empresatext.Text = "";
            cli_profissional_dropcargo.SelectedValue = "0";
            cli_profissional_dataentrada.Text = "";
            cli_profissional_datasaida.Text = "";
            cli_profissional_textbonus.Text = "";
            cli_profissional_textsalario.Text = "";
            cli_profissional_dropsegmento.SelectedValue = "0";
            cli_profissional_droparea.SelectedValue = "0";
            cli_profissional_dropsubdivisao.DataBind();
            cli_profissional_dropsubdivisao.Items.Insert(0, "Escolha a opção");
            cli_profissional_dropsubdivisao.SelectedIndex = 0;
            cli_profissional_drop_tp_contato.SelectedIndex = 0;
            cli_profissional_grid_cadastro.DataBind();

            cli_academico_dropescolaridade.SelectedValue = "0";
            cli_academico_textinstituicao.Text = "";
            cli_academico_textcurso.Text = "";
            cli_academico_dropanocursando.SelectedValue = "0";
            cli_academico_dropidioma.SelectedValue = "0";
            cli_academico_dropnivel.SelectedValue = "0";
            cli_academico_textcertificacao.Text = "0";

            cli_havik_dropstatus.SelectedValue = "0";
            cli_havik_dropsubstatus.DataBind();
            cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
            cli_havik_dropsubstatus.SelectedValue = "0";
            cli_havik_textdata.Text = "";
            cli_havik_texthora.Text = "";
            cli_havik_drop_entrevistador.DataBind();
            cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
            //cli_havik_drop_entrevistador.SelectedValue = "0";
            cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
            cli_havik_drop_projeto.DataBind();            
            //cli_havik_drop_projeto.SelectedValue = "0";
            cli_havik_textobservacoes.Text = "";

            cli_researcher_relatorio_textsalario.Text = "";
            cli_researcher_relatorio_radio_mudanca.SelectedValue = "0";

            cli_consultor_relatorio_textsalario.Text = "";
            cli_consultor_relatorio_radio_mudanca.SelectedValue = "0";

            cli_hierarquia_drop_reporta.SelectedValue = "0";
            cli_hierarquia_drop_reporta_a_quem.SelectedValue = "0";
            cli_hierarquia_text_nro_subordinados.Text = "";
            cli_hierarquia_text_subordinados_diretos.Text = "";
            
            cli_researcher_grid_relatorio.DataBind();
            cli_researcher_grid_media_geral.DataBind();

            mensagem_cli_dadoscadastrais.Text = "";
            mensagem_cli_academico.Text = "";
            mensagem_cli_consultor_entrevista.Text = "";
            mensagem_cli_consultor_relatorio.Text = "";
            mensagem_cli_havik.Text = "";
            mensagem_cli_hierarquia.Text = "";
            mensagem_cli_profissional.Text = "";
            mensagem_cli_researcher_preentrevista.Text = "";
            mensagem_cli_researcher_relatorio.Text = "";

            //limpa o grid escondido de 1 linha só para persistencia de dados
            
            //Session["retorno_cliente"] = null;
            //retorno_cliente.DataSource = Session["retorno_cliente"];
            //retorno_cliente.DataBind();

            Session["label_modulo"] = "";

        }

        /* LIMPEZA DE TODO O MODULO DE CLIENTE */

        protected void limpar_modulo_cliente()
        {
            Session["IDcliente"] = null;
            cli_dadoscadastrais_textnome.Text = "";
            cli_dadoscadastrais_textcpf.Text = "";
            cli_dadoscadastrais_textnascimento.Text = "";
            cli_dadoscadastrais_dropestadocivil.SelectedValue = "0";
            cli_dadoscadastrais_dropsexo.SelectedValue = "0";
            cli_dadoscadastrais_textendereco.Text = "";
            cli_dadoscadastrais_textcep.Text = "";
            cli_dadoscadastrais_dropestado.SelectedValue = "35";
            cli_dadoscadastrais_dropcidade.DataBind();
            cli_dadoscadastrais_textbairro.Text = "";
            cli_dadoscadastrais_droppais.SelectedValue = "0";
            cli_dadoscadastrais_textemail.Text = "";
            cli_dadoscadastrais_textcodpais.Text = "";
            cli_dadoscadastrais_textddd.Text = "";
            cli_dadoscadastrais_texttelefone.Text = "";
            cli_dadoscadastrais_drop_tipotel.SelectedValue = "0";

            cli_profissional_empresatext.Text = "";
            cli_profissional_dropcargo.SelectedValue = "0";
            cli_profissional_dataentrada.Text = "";
            cli_profissional_datasaida.Text = "";
            cli_profissional_textbonus.Text = "";
            cli_profissional_textsalario.Text = "";
            cli_profissional_dropsegmento.SelectedIndex = 0;
            cli_profissional_droparea.SelectedIndex = 0;
            cli_profissional_dropsubdivisao.DataBind();
            cli_profissional_dropsubdivisao.Items.Insert(0, "Escolha a opção");
            //cli_profissional_dropsubdivisao.SelectedIndex = 0;
            cli_profissional_drop_tp_contato.SelectedIndex = 0;
            cli_profissional_grid_cadastro.DataBind();

            cli_academico_dropescolaridade.SelectedValue = "0";
            cli_academico_textinstituicao.Text = "";
            cli_academico_textcurso.Text = "";
            cli_academico_dropanocursando.SelectedValue = "0";
            cli_academico_dropidioma.SelectedValue = "0";
            cli_academico_dropnivel.SelectedValue = "0";
            cli_academico_textcertificacao.Text = "0";

            cli_havik_dropstatus.SelectedValue = "0";
            cli_havik_dropsubstatus.DataBind();
            cli_havik_dropsubstatus.Items.Insert(0, new ListItem("Escolha a opção", "0"));
            cli_havik_dropsubstatus.SelectedValue = "0";
            cli_havik_textdata.Text = "";
            cli_havik_texthora.Text = "";
            cli_havik_drop_entrevistador.DataBind();
            cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
            //cli_havik_drop_entrevistador.SelectedValue = "0";
            cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
            cli_havik_drop_projeto.DataBind();
            //cli_havik_drop_projeto.SelectedValue = "0";
            cli_havik_textobservacoes.Text = "";

            cli_researcher_relatorio_textsalario.Text = "";
            cli_researcher_relatorio_radio_mudanca.SelectedValue = "0";

            cli_consultor_relatorio_textsalario.Text = "";
            cli_consultor_relatorio_radio_mudanca.SelectedValue = "0";

            cli_hierarquia_drop_reporta.SelectedValue = "0";
            cli_hierarquia_drop_reporta_a_quem.SelectedValue = "0";
            cli_hierarquia_text_nro_subordinados.Text = "";
            cli_hierarquia_text_subordinados_diretos.Text = "";

            cli_researcher_grid_relatorio.DataBind();
            cli_researcher_grid_media_geral.DataBind();
            
            mensagem_cli_dadoscadastrais.Text = "";
            mensagem_cli_academico.Text = "";
            mensagem_cli_consultor_entrevista.Text = "";
            mensagem_cli_consultor_relatorio.Text = "";
            mensagem_cli_havik.Text = "";
            mensagem_cli_hierarquia.Text = "";
            mensagem_cli_profissional.Text = "";
            mensagem_cli_researcher_preentrevista.Text = "";
            mensagem_cli_researcher_relatorio.Text = "";

            //limpa o grid escondido de 1 linha só para persistencia de dados

            Session["retorno_cliente"] = null;
            retorno_cliente.DataSource = Session["retorno_cliente"];
            retorno_cliente.DataBind();

            Session["label_modulo"] = "";

            Response.Redirect("Cliente.aspx");

        }

        protected void Button60_Click(object sender, EventArgs e)
        {
            limpar_modulo_cliente();
        }

        /* TRATAMENTO DE GRAVAÇÃO E MUDANÇA DE ABAS */

        protected void menuCliente_MenuItemClick(object sender, MenuEventArgs e)
        {
            int indice_atual = 0;
            indice_atual = MultiView2.ActiveViewIndex;
            int index = 0;
            index = Int32.Parse(e.Item.Value);
            perguntadomes();
            MultiView2.ActiveViewIndex = index;
            
            /* 
            if (index == 4)
            {
                //BIND DO GRID DE STATUS NA ABA HAVIK
                cli_havik_grid_status.DataBind();
                index = Int32.Parse(e.Item.Value);
                MultiView2.ActiveViewIndex = index;
            }

            if ((indice_atual == 0) || (indice_atual == 7))
            {
                if (indice_atual == 0)
                {
                    //REALIZA A GRAVAÇÃO E ATUALIZAÇÃO DE DADOS CADASTRAIS
                    if ((Session["IDcliente"] == null) && (cli_dadoscadastrais_textnome.Text == "") &&
                       (cli_dadoscadastrais_textcpf.Text == "") && (cli_dadoscadastrais_textnascimento.Text == "") &&
                       (cli_dadoscadastrais_dropestadocivil.SelectedValue == "0") && (cli_dadoscadastrais_dropsexo.SelectedValue == "0") &&
                       (cli_dadoscadastrais_textendereco.Text == "") && (cli_dadoscadastrais_textcep.Text == "") &&
                       ((cli_dadoscadastrais_dropcidade.SelectedValue == "0") || (cli_dadoscadastrais_dropcidade.SelectedValue == "000000")) && (cli_dadoscadastrais_dropestado.SelectedValue == "0") &&
                       (cli_dadoscadastrais_textbairro.Text == "") && (cli_dadoscadastrais_droppais.SelectedValue == "0"))
                    {
                        index = Int32.Parse(e.Item.Value);
                        MultiView2.ActiveViewIndex = index;
                        perguntadomes();
                    }
                    else
                    {
                        if (((dados_cadastrais_nome != cli_dadoscadastrais_textnome.Text) || (dados_cadastrais_cpf != cli_dadoscadastrais_textcpf.Text) ||
                           (dados_cadastrais_data != cli_dadoscadastrais_textnascimento.Text) || (dados_cadastrais_estado_civil != cli_dadoscadastrais_dropestadocivil.SelectedValue) ||
                           (dados_cadastrais_sexo != cli_dadoscadastrais_dropsexo.SelectedValue) || (dados_cadastrais_endereco != cli_dadoscadastrais_textendereco.Text) ||
                           (dados_cadastrais_cep != cli_dadoscadastrais_textcep.Text) || (dados_cadastrais_cidade != cli_dadoscadastrais_dropcidade.SelectedValue) ||
                           (dados_cadastrais_estado != cli_dadoscadastrais_dropestado.SelectedValue) || (dados_cadastrais_bairro != cli_dadoscadastrais_textbairro.Text) ||
                           (dados_cadastrais_pais != cli_dadoscadastrais_droppais.SelectedValue)) && (Session["IDcliente"] != null))
                        {
                            //UPDATE DE DADOS CADASTRAIS
                            atualiza_cadastro_cliente();
                            index = Int32.Parse(e.Item.Value);
                            MultiView2.ActiveViewIndex = index;
                            grid_busca_cliente.DataBind();
                            foreach (GridViewRow row in grid_busca_cliente.Rows)//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                            {//OTIMIZAR O CÓDIGO PARA REMOVER O LAÇO DO "FOR"
                                if (Session["IDcliente"].ToString() == grid_busca_cliente.DataKeys[row.RowIndex].Values["id_cliente"].ToString())
                                {
                                    grid_busca_cliente.Rows[row.RowIndex].Font.Bold = true;
                                }
                                else { grid_busca_cliente.Rows[row.RowIndex].Font.Bold = false; }
                            }
                        }
                        else
                        {
                            //INSERT DE DADOS CADASTRAIS
                            if (cli_dadoscadastrais_textnome.Text != "")
                            {
                                cadastro_cliente();
                                index = Int32.Parse(e.Item.Value);
                                MultiView2.ActiveViewIndex = index;
                                exibe_mensagem_cliente(0, "atualização de Cliente feito com sucesso!");
                            }
                            else
                            {
                                exibe_mensagem_cliente(0, "atualização de Cliente feito sem sucesso!");
                            }
                        }
                    }
                }
                //INDICE 7 HIERARQUIA
                if (indice_atual == 7)
                {
                    if ((Session["IDcliente"] == null) && (cli_hierarquia_drop_reporta.SelectedValue == "0") &&
                       (cli_hierarquia_drop_reporta_a_quem.SelectedValue == "0") && (cli_hierarquia_text_nro_subordinados.Text == "") &&
                       (cli_hierarquia_text_subordinados_diretos.Text == ""))
                    {
                        index = Int32.Parse(e.Item.Value);
                        MultiView2.ActiveViewIndex = index;
                        perguntadomes();
                    }
                    if ((Session["IDcliente"] == null) && ((cli_hierarquia_drop_reporta.SelectedValue != "0") ||
                       (cli_hierarquia_drop_reporta_a_quem.SelectedValue != "0") || (cli_hierarquia_text_nro_subordinados.Text != "") ||
                       (cli_hierarquia_text_subordinados_diretos.Text != "")))
                    {
                        exibe_mensagem_cliente(0, "cadastro feito sem sucesso!");
                    }
                    if ((Session["IDcliente"] != null) && ((cli_hierarquia_drop_reporta.SelectedValue != "0") ||
                       (cli_hierarquia_drop_reporta_a_quem.SelectedValue != "0") || (cli_hierarquia_text_nro_subordinados.Text != "") ||
                       (cli_hierarquia_text_subordinados_diretos.Text != "")))
                    {
                        registra_hierarquia();
                        exibe_mensagem_cliente(0, "cadastro feito com sucesso!");
                        index = Int32.Parse(e.Item.Value);
                        MultiView2.ActiveViewIndex = index;
                    }
                    else
                    {
                        index = Int32.Parse(e.Item.Value);
                        MultiView2.ActiveViewIndex = index;
                        perguntadomes();
                    }
                }
                else
                {
                    index = Int32.Parse(e.Item.Value);
                    MultiView2.ActiveViewIndex = index;
                    perguntadomes();
                }
            }
            else
            {
                index = Int32.Parse(e.Item.Value);
                MultiView2.ActiveViewIndex = index;
                exibe_mensagem_cliente(0, "");
                perguntadomes();
            }
            */
        }

        protected void perguntadomes()
        {
            int erro = 0;
            if (Session["IDcliente"] == null)
            { erro = 1; }

            DataSet retorno_pergunta = new DataSet();

            if (erro == 0)
            {
                string cstr = conexao;
                using (SqlConnection con = new SqlConnection(cstr))
                {
                    con.Open();

                    int id_cliente = int.Parse(Session["IDcliente"].ToString());

                    SqlCommand com = new SqlCommand("sp_vw_cli_pergunta", con);
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.AddWithValue("@id_cliente", id_cliente);

                    SqlDataAdapter da = new SqlDataAdapter(com);
                    da.Fill(retorno_pergunta);
                    if (retorno_pergunta.Tables[0].Rows.Count != 0)
                    {
                        pergunta_do_mes.Text = retorno_pergunta.Tables[0].Rows[0][1].ToString();
                        id_pergunta_do_mes.Value = retorno_pergunta.Tables[0].Rows[0][0].ToString();
                    }
                    cli_grid_resposta.DataBind();
                    if (cli_grid_resposta.Rows.Count == 0)
                    {
                        Label189.Visible = false;
                        pergunta_do_mes.Visible = false;
                    }
                    else
                    {
                        Label189.Visible = true;
                        pergunta_do_mes.Visible = true;
                    }
                }
            }
        }

        protected void retorno_cliente_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        /*RENDERIZAÇÃO DE COLUNAS DOS GRIDS*/

        protected override void Render(HtmlTextWriter writer)
        {           
            for (int i = 0; i < this.cli_projetos_grid_projetos.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.cli_projetos_grid_projetos.UniqueID, "Select$" + i);
            }
            for (int i = 0; i < this.cli_researcher_gridobs.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.cli_researcher_gridobs.UniqueID, "Select$" + i);
            }
            for (int i = 0; i < this.cli_consultor_gridobs.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.cli_consultor_gridobs.UniqueID, "Select$" + i);
            }
            for (int i = 0; i < this.cli_profissional_grid_cadastro.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(this.cli_profissional_grid_cadastro.UniqueID, "Select$" + i);
            }
            base.Render(writer);
        }


        /*INCURSÃO DE SELEÇÃO NO GRID ---------------------------- ABA PROFISSIONAL */

        protected void cli_profissional_grid_cadastro_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.cli_profissional_grid_cadastro, "Select$" + e.Row.RowIndex);
            }
        }

        /*INCURSÃO DE SELEÇÃO NO GRID ---------------------------- ABA PROJETOS */

        protected void cli_projetos_grid_projetos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.cli_projetos_grid_projetos, "Select$" + e.Row.RowIndex);
            }
        }

        /*INCURSÃO DE SELEÇÃO NO GRID ---------------------------- ABA RESEARCHER */

        protected void cli_researcher_gridobs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.cli_researcher_gridobs, "Select$" + e.Row.RowIndex);
            }
        }

        /*INCURSÃO DE SELEÇÃO NO GRID ---------------------------- ABA CONSULTOR */

        protected void cli_consultor_gridobs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.cli_consultor_gridobs, "Select$" + e.Row.RowIndex);
            }
        }

        protected void cli_havik_dropsubstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                SqlCommand com = new SqlCommand("sp_vw_cli_follow", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_status", int.Parse(cli_havik_dropstatus.SelectedValue.ToString()));
                if ((cli_havik_dropsubstatus.SelectedIndex != 0) && (cli_havik_dropsubstatus.SelectedIndex != -1))
                {
                    com.Parameters.AddWithValue("@id_substatus", int.Parse(cli_havik_dropsubstatus.SelectedValue.ToString()));
                }
                else { com.Parameters.AddWithValue("@id_substatus", 0); }



                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(retorno_drop_entrevistador_follow);
                Session["retorno_follow"] = retorno_drop_entrevistador_follow;

                retorno_follow_entrevistador.DataSource = Session["retorno_follow"];
                retorno_follow_entrevistador.DataBind();

                if (retorno_follow_entrevistador.Rows.Count != 0)
                {
                    if (retorno_follow_entrevistador.Rows[0].Cells[0].Text == "1")
                    {
                        //ENTREVISTADOR = 1
                        cli_havik_textdata.Enabled = true;
                        cli_havik_texthora.Enabled = true;
                        Label138.Visible = true;
                        Label138.Text = "entrevistador";
                        Session["IDentrevistador"] = 1;
                        Session["IDfollow"] = 0;
                        cli_havik_drop_entrevistador.Visible = true;
                        cli_havik_drop_entrevistador.DataBind();
                        cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                    }
                    else
                    {
                        if (retorno_follow_entrevistador.Rows[0].Cells[1].Text == "1")
                        {
                            //FOLLOW = 1
                            cli_havik_textdata.Enabled = true;
                            cli_havik_texthora.Enabled = true;
                            Label138.Visible = true;
                            Label138.Text = "follow up";
                            Session["IDfollow"] = 1;
                            Session["IDentrevistador"] = 0;
                            cli_havik_drop_entrevistador.Visible = true;
                            cli_havik_drop_entrevistador.DataBind();
                            cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                        }
                        else
                        {
                            //FOLLOW = 0 e ENTREVISTADOR = 0
                            cli_havik_textdata.Enabled = false;
                            cli_havik_texthora.Enabled = false;
                            Label138.Visible = false;
                            cli_havik_drop_entrevistador.Visible = false;
                            cli_havik_drop_entrevistador.DataBind();
                            cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                        }

                    }
                    //Session["retorno_follow"] = retorno_drop_entrevistador_follow;
                }
                else
                {
                    //FOLLOW = 0 e ENTREVISTADOR = 0
                    cli_havik_textdata.Enabled = false;
                    cli_havik_texthora.Enabled = false;
                    Label138.Visible = false;
                    cli_havik_drop_entrevistador.Visible = false;
                    cli_havik_drop_entrevistador.DataBind();
                    cli_havik_drop_entrevistador.Items.Insert(0, "Escolha a opção");
                }
                cli_havik_textdata.Text = "";
                cli_havik_texthora.Text = "";                
            }
            if ((cli_havik_dropsubstatus.SelectedIndex != -1) && (cli_havik_dropsubstatus.SelectedIndex != 0))
            {
                DropDownList ddlmotivo = (DropDownList)cli_havik.FindControl("cli_havik_dropmotivo");

                if (ddlmotivo != null)
                {
                    ddlmotivo.DataBind();
                    ddlmotivo.Items.Insert(0, new ListItem("Escolha a opção", "0"));
                }
            }
        }

        protected void Button61_Click(object sender, EventArgs e)
        {
            Session["busca_proj"] = "1";
            Response.Redirect("Busca.aspx");            
        }

        protected void busca_cli_radio_projetos_SelectedIndexChanged(object sender, EventArgs e)
        {
            cli_havik_drop_projeto.DataBind();
            cli_havik_drop_projeto.Items.Insert(0, "Escolha a opção");
        }

        protected void cli_profissional_grid_cadastro_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = cli_profissional_grid_cadastro.Rows[cli_profissional_grid_cadastro.SelectedIndex];

            //emp_filiais_gridfiliais.DataKeys[emp_filiais_gridfiliais.SelectedIndex].Values["cep"].toString();

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id"].ToString() != "")
            { Session["id_linha_cliente_profissional"] = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id"].ToString()); }
            else
            { Session["id_linha_cliente_profissional"] = null; }

            if ((cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_filial"].ToString() != "") && (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_filial"] != null))
            { id_filial.Value = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_filial"].ToString()); }
            else
            { id_filial.Value = ""; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["filial"].ToString() != "")
            { txtPopupValue.Text = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["filial"].ToString()); }
            else
            { txtPopupValue.Text = ""; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_empresa"].ToString() != "")
            { 
                id_empresa.Value = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_empresa"].ToString());
                if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["empresa"].ToString() != "")
                { cli_profissional_empresatext.Text = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["empresa"].ToString()); }
                else { cli_profissional_empresatext.Text = ""; }
            }
            else { id_empresa.Value = ""; }            

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["dt_inicio"].ToString() != "")
            { cli_profissional_dataentrada.Text = String.Format("{0:dd/MM/yyyy}", cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["dt_inicio"]); }
            else { cli_profissional_dataentrada.Text = ""; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["dt_saida"].ToString() != "")
            { cli_profissional_datasaida.Text = String.Format("{0:dd/MM/yyyy}", cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["dt_saida"]); }
            else { cli_profissional_datasaida.Text = ""; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_cargo"].ToString() != "")
            { cli_profissional_dropcargo.SelectedValue = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_cargo"].ToString()); }
            else { cli_profissional_dropcargo.SelectedIndex = 0; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["salario"].ToString() != "")
            { cli_profissional_textsalario.Text = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["salario"].ToString()); }
            else { cli_profissional_textsalario.Text = ""; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["bonus"].ToString() != "")
            { cli_profissional_textbonus.Text = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["bonus"].ToString()); }
            else { cli_profissional_textbonus.Text = ""; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_tipo_contrato"].ToString() != "")
            { cli_profissional_dropmodelo_contrato.SelectedValue = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["id_tipo_contrato"].ToString()); }
            else { cli_profissional_dropmodelo_contrato.SelectedIndex = 0; }

            if (cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["variavel_mensal"].ToString() != "")
            { cli_profissional_textvariavel.Text = HttpUtility.HtmlDecode(cli_profissional_grid_cadastro.DataKeys[cli_profissional_grid_cadastro.SelectedIndex].Values["variavel_mensal"].ToString()); }
            else { cli_profissional_textvariavel.Text = ""; }            
        }

        //EXCLUSÃO DE ITENS DO GRID DE GRADUAÇÃO --------------------------------- ABA PROFISSIONAL

        protected void cli_academico_grid_graduacao_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_academico = 0;

                SqlCommand com = new SqlCommand("sp_cli_altera_academico", con);
                com.CommandType = CommandType.StoredProcedure;

                id_academico = int.Parse(cli_academico_grid_graduacao.DataKeys[cli_academico_grid_graduacao.SelectedIndex].Values["id"].ToString());

                com.Parameters.AddWithValue("@id", id_academico);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        cli_academico_grid_graduacao.DataBind();
                    }
                    else
                    {
                        exibe_mensagem_cliente(2, "exclusão feita sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(2, "exclusão feita sem sucesso!");
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_cliente(2, "exclusão feita com sucesso!");
                }
            }
        }

        //EXCLUSÃO DE ITENS DO GRID DE IDIOMA --------------------------------- ABA PROFISSIONAL

        protected void cli_academico_grid_idiomas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_idioma = 0;

                SqlCommand com = new SqlCommand("sp_cli_altera_idiomas", con);
                com.CommandType = CommandType.StoredProcedure;

                id_idioma = int.Parse(cli_academico_grid_idiomas.DataKeys[cli_academico_grid_idiomas.SelectedIndex].Values["id"].ToString());

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
                        cli_academico_grid_idiomas.DataBind();
                    }
                    else
                    {
                        exibe_mensagem_cliente(2, "exclusão feita sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(2, "exclusão feita sem sucesso!");
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_cliente(2, "exclusão feita com sucesso!");
                }
            }
        }

        //EXCLUSÃO DE ITENS DO GRID DE CURSO/CERTIFICAÇÃO --------------------------------- ABA PROFISSIONAL

        protected void cli_academico_grid_cursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_curso = 0;

                SqlCommand com = new SqlCommand("sp_cli_altera_cursos", con);
                com.CommandType = CommandType.StoredProcedure;

                id_curso = int.Parse(cli_academico_grid_cursos.DataKeys[cli_academico_grid_cursos.SelectedIndex].Values["id"].ToString());

                com.Parameters.AddWithValue("@id", id_curso);
                com.Parameters.AddWithValue("@exibir", 2);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        cli_academico_grid_cursos.DataBind();
                    }
                    else
                    {
                        exibe_mensagem_cliente(2, "exclusão feita sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(2, "exclusão feita sem sucesso!");
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_cliente(2, "exclusão feita com sucesso!");
                }
            }
        }

        protected void exibe_mensagem_cliente(int indice, string mensagem)
        {
            int i = indice;
            string msg = mensagem;
            switch (i)
            {
                case 1:
                    //tratamento para dados_cadastrais
                    mensagem_cli_dadoscadastrais.Text = msg;
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 2:
                    //tratamento para profissional
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = msg;
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 3:
                    //tratamento para academico
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = msg;
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 4:
                    //tratamento para projeto
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 5:
                    //tratamento para havik
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = msg;
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 6:
                    //tratamento para pre-entrevista
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = msg;
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 7:
                    //tratamento para pre-entrevista relatorio
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = msg;
                    break;
                case 8:
                    //tratamento para entrevista
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = msg;
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 9:
                    //tratamento para entrevista relatorio
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = msg;
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = "";
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 10:
                    //tratamento para hierarquia
                    mensagem_cli_dadoscadastrais.Text = "";
                    mensagem_cli_academico.Text = "";
                    mensagem_cli_consultor_entrevista.Text = "";
                    mensagem_cli_consultor_relatorio.Text = "";
                    mensagem_cli_havik.Text = "";
                    mensagem_cli_hierarquia.Text = msg;
                    mensagem_cli_profissional.Text = "";
                    mensagem_cli_researcher_preentrevista.Text = "";
                    mensagem_cli_researcher_relatorio.Text = "";
                    break;
                case 0:
                    //tratamento para mudança de abas
                    mensagem_cli_dadoscadastrais.Text = msg;
                    mensagem_cli_academico.Text = msg;
                    mensagem_cli_consultor_entrevista.Text = msg;
                    mensagem_cli_consultor_relatorio.Text = msg;
                    mensagem_cli_havik.Text = msg;
                    mensagem_cli_hierarquia.Text = msg;
                    mensagem_cli_profissional.Text = msg;
                    mensagem_cli_researcher_preentrevista.Text = msg;
                    mensagem_cli_researcher_relatorio.Text = msg;
                    break;
                default:
                    break;
            }
        }

        protected void Button63_Click(object sender, EventArgs e)
        {

            Session["cliente_filial"] = null;
            Session["id_cliente_filial"] = null;
            Session["id_empresa_popup"] = id_empresa.Value;
            grid_popup_filial.DataBind();
            grid_popup_filial.SelectedIndex = -1;
            Panel9_ModalPopupExtender.Show();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtPopupValue.Text = grid_popup_filial.DataKeys[grid_popup_filial.SelectedIndex].Values["nome"].ToString();
            id_filial.Value = grid_popup_filial.DataKeys[grid_popup_filial.SelectedIndex].Values["id"].ToString();            
        }

        protected void GridView1_Sorting(object sender, EventArgs e)
        {
            Panel9_ModalPopupExtender.Show();
        }

        protected void cli_havik_grid_status_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((Session["cargo"].ToString() == "coordenador") || (Session["cargo"].ToString() == "partner") || (Session["cargo"].ToString() == "assistente"))
            {
                string cstr = conexao;
                using (SqlConnection con = new SqlConnection(cstr))
                {
                    con.Open();

                    int id_usuario = int.Parse(Session["IDusuario"].ToString());
                    int id_cliente = 1;
                    string sessao = "0";
                    if (Session["IDcliente"] != null)
                    { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                    else { sessao = "null"; }
                    string valida = "null";
                    int id_status = 0;

                    SqlCommand com = new SqlCommand("sp_cli_altera_status", con);
                    com.CommandType = CommandType.StoredProcedure;

                    GridViewRow row = cli_havik_grid_status.Rows[cli_havik_grid_status.SelectedIndex];
                    id_status = int.Parse(row.Cells[1].Text);

                    com.Parameters.AddWithValue("@id", id_status);
                    com.Parameters.AddWithValue("@exibir", 2);
                    com.Parameters.AddWithValue("@usuario", id_usuario);

                    SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                    rowCount.Direction = ParameterDirection.Output;
                    try
                    {
                        if (valida != sessao)
                        {
                            com.ExecuteNonQuery();
                            cli_havik_grid_status.DataBind();
                        }
                        else
                        {
                            exibe_mensagem_cliente(5, "exclusão feita sem sucesso!");
                        }
                    }

                    catch (SqlException exc)
                    {
                        if (exc.Message.Contains("UNIQUE KEY constraint"))
                        {
                            exibe_mensagem_cliente(5, "exclusão feita sem sucesso!");
                        }
                    }

                    valida = rowCount.Value.ToString();
                    if (valida != "0")
                    {
                        exibe_mensagem_cliente(5, "exclusão feita com sucesso!");
                    }
                }
            }
            else
            {
                exibe_mensagem_cliente(5, "seu perfil não possui permissão para essa operação!");
            }
        }

        protected void ddldadoscadastrais_estadouf_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cli_dadoscadastrais_dropestadouf.SelectedValue != "0")
            {
                cli_dadoscadastrais_dropnaturalidade.DataBind();
                cli_dadoscadastrais_dropnaturalidade.Items.Insert(0, "Escolha a opção");
            }
            //else { cli_dadoscadastrais_dropcidade.SelectedValue = "0"; }
        }

        protected void cli_profissional_cadastrar_prof_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                
                SqlCommand com = new SqlCommand("sp_cli_codifica", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                if (cli_profissional_droparea.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_area", int.Parse(cli_profissional_droparea.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_area", null); }
                if ((cli_profissional_dropsubdivisao.SelectedIndex != 0) && (cli_profissional_dropsubdivisao.SelectedIndex != 0))
                { com.Parameters.AddWithValue("@id_subdivisao", int.Parse(cli_profissional_dropsubdivisao.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_subdivisao", null); }
                if (cli_profissional_dropsegmento.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@id_segmento", int.Parse(cli_profissional_dropsegmento.SelectedValue)); }
                else { com.Parameters.AddWithValue("@id_segmento", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (cli_profissional_droparea.SelectedIndex != 0) && (cli_profissional_dropsubdivisao.SelectedIndex != 0) &&
                        (cli_profissional_dropsegmento.SelectedIndex != 0))
                    {
                        com.ExecuteNonQuery();
                        cli_profissional_droparea.SelectedIndex = 0;
                        cli_profissional_dropsubdivisao.DataBind();
                        cli_profissional_dropsubdivisao.Items.Insert(0, "Escolha a opção");
                        cli_profissional_dropsubdivisao.SelectedIndex = 0;
                        cli_profissional_dropsegmento.SelectedIndex = 0;
                        cli_profissional_grid_codifica.DataBind();
                        exibe_mensagem_cliente(2, "cadastro feito com sucesso!");
                    }
                    else
                    {
                        exibe_mensagem_cliente(2, "favor preencher os campos corretamente!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(2, "cadastro feito sem sucesso!");
                    }
                }
            }
        }

        protected void cli_profissional_grid_codifica_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                string sessao = "0";
                if (Session["IDcliente"] != null)
                { id_cliente = int.Parse(Session["IDcliente"].ToString()); }
                else { sessao = "null"; }
                string valida = "null";
                int id_cod = 0;

                SqlCommand com = new SqlCommand("sp_cli_altera_codifica", con);
                com.CommandType = CommandType.StoredProcedure;

                GridViewRow row = cli_profissional_grid_codifica.Rows[cli_profissional_grid_codifica.SelectedIndex];
                id_cod = int.Parse(row.Cells[1].Text);

                com.Parameters.AddWithValue("@id", id_cod);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if (valida != sessao)
                    {
                        com.ExecuteNonQuery();
                        cli_profissional_grid_codifica.DataBind();
                        cli_profissional_grid_codifica.SelectedIndex = -1;
                    }
                    else
                    {
                        exibe_mensagem_cliente(5, "exclusão feita sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_cliente(5, "exclusão feita sem sucesso!");                        
                    }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    exibe_mensagem_cliente(5, "exclusão feita com sucesso!");
                    }
            }
        }

        protected void cli_profissional_empresa_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());

                SqlCommand com = new SqlCommand("sp_vw_cli_prof_empresa", con);
                com.CommandType = CommandType.StoredProcedure;

                if (cli_profissional_empresatext.Text != "")
                { com.Parameters.AddWithValue("@empresa", cli_profissional_empresatext.Text); }
                else { com.Parameters.AddWithValue("@empresa", ""); }
                SqlDataAdapter da = new SqlDataAdapter(com);

                da.Fill(ds_busca_popup_empresa);
                if (ds_busca_popup_empresa.Tables[0].Rows.Count < 120)
                {
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
            cli_profissional_empresatext.Text = grid_popup_empresa.DataKeys[grid_popup_empresa.SelectedIndex].Values["nome"].ToString();
            id_empresa.Value = grid_popup_empresa.DataKeys[grid_popup_empresa.SelectedIndex].Values["id"].ToString();
        }

        protected void grid_popup_empresa_Sorting(object sender, EventArgs e)
        {
            Panel13_ModalPopupExtender.Show();
        }

        protected void cli_dadoscadastrais_reporta_duplicidade_Click(object sender, EventArgs e)
        {
            //Evento que sinaliza ao banco de dados a suspeita de um cliente duplicado
            //A flag é armazenada na tabela xxx através da procedure xxx
            //Não retorna erro, mas trata a mensagem caso não haja nenhum cliente na sessão

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                int id_cliente = 1;
                int erro = 0;
                int verifica = 1;

                if (Session["IDcliente"] != null)
                { 
                    id_cliente = int.Parse(Session["IDcliente"].ToString());
                    erro = 0;
                }
                else { erro = 1; }

                SqlCommand com = new SqlCommand("sp_cli_reporta_duplicidade", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);
                com.Parameters.AddWithValue("@verifica", verifica);
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;

                try 
                {
                    if (erro == 0)
                    {
                        com.ExecuteNonQuery(); 
                        exibe_mensagem_cliente(1, "cliente reportado como duplicado com sucesso!");                             
                    }
                    else 
                    {
                        exibe_mensagem_cliente(1, "favor, verifique se há algum cliente carregado antes de reportar duplicidade!"); 
                    }
                }
                catch (SqlException exc)
                {
                    if (exc.Message.Contains("timeout"))
                    {
                        exibe_mensagem_cliente(1, "cliente reportado sem sucesso!");
                    }
                }
                con.Close();
            }
        }

        protected void cli_profissional_novo_cadastro_Click(object sender, EventArgs e)
        {
            cli_profissional_grid_cadastro.SelectedIndex = -1;
            id_empresa.Value = null;
            cli_profissional_empresatext.Text = "";
            id_filial.Value = null;
            txtPopupValue.Text = "";
            cli_profissional_drop_tp_contato.SelectedIndex = 0;
            cli_profissional_dropcargo.SelectedIndex = 0;
            cli_profissional_dataentrada.Text = "";
            cli_profissional_datasaida.Text = "";
            cli_profissional_textsalario.Text = "";
            cli_profissional_textvariavel.Text = "";
            cli_profissional_textbonus.Text = "";
            cli_profissional_dropmodelo_contrato.SelectedIndex = 0;
        }
    }    
}