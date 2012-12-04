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
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Data.Sql;
using Microsoft.SqlServer.Server;

namespace HavikTeste
{
    public partial class Administrativo : System.Web.UI.Page
    {
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";

        DataTable dt_relat = new DataTable();
        DataSet ds_relat_henry = new DataSet();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            Page.Header.Title = "Havik System - Administrativo";

            if (Session["IDusuario"] == null)
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            if (!IsPostBack)
            {
                adm_radio_tipos_projetos.Enabled = false;
            }
        }

        protected void limpa_campos()
        {
            senha_antiga.Text = "";
            senha_nova1.Text = "";
            senha_nova2.Text = "";
            label_erro.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                SqlCommand com = new SqlCommand("sp_vw_usuario_check", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlCommand altera = new SqlCommand("sp_altera_senha", con);
                altera.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id", int.Parse(Session["IDusuario"].ToString()));
                string teste = Session["IDusuario"].ToString();
                com.Parameters.AddWithValue("@senha", senha_antiga.Text);

                if (senha_nova1.Text != senha_nova2.Text)
                {
                    limpa_campos();
                    label_erro.Text = "nova senha não confere com os campos preenchidos, por favor preencha a nova senha corretamente";
                }
                else
                {
                    //using (SqlDataReader reader = com.ExecuteReader())
                    DataTable reader;
                    reader = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(com);
                    adapter.Fill(reader);
                    string idusuario;
                    string senha;
                    if (reader.Rows.Count == 0)
                    {
                        limpa_campos();
                        label_erro.Text = "senha antiga incorreta, por favor preencha a nova senha corretamente";
                    }
                    else
                    {
                        idusuario = reader.Rows[0]["id"].ToString();
                        senha = senha_nova1.Text;
                        altera.Parameters.AddWithValue("@usuario", idusuario);
                        altera.Parameters.AddWithValue("@senha", senha);
                        altera.ExecuteNonQuery();
                        Response.Redirect("LoginUsuario.aspx");
                    }
                }
            }
        }

        protected void menuAdministrativo_MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            string cargo = "";
            cargo = Session["cargo"].ToString();
            if (index == 1)
            {
                //if ((cargo == "partner") || (cargo == "consultor") || (cargo == "coordenador"))
                //{
                    adm.ActiveViewIndex = index;
                //}
            }
            else
            {
                if (index == 2)
                {
                    if (cargo == "coordenador")
                    {
                        adm.ActiveViewIndex = index;
                    }
                }
                else
                adm.ActiveViewIndex = index;
            }
        }

        protected void adm_radio_projetos_SelectedIndexChanged(object sender, EventArgs e)
        {
            adm_radio_tipos_projetos.Enabled = true;
            adm_list_projetos.DataBind();
            adm_list_empresas.DataSource = null;
            adm_list_empresas.DataBind();
            adm_list_empresas.Items.Clear();
        }

        protected void adm_list_status_SelectedIndexChanged(object sender, EventArgs e)
        {
            int size = 0;
            for (int listcount = 0; listcount < (adm_list_status.Items.Count); listcount++)
            {
                if (adm_list_status.Items[listcount].Selected == true)
                {
                    size = size + 1;
                }
            }
            int[] status = new int[size];
            List<SqlDataRecord> lista_status = new List<SqlDataRecord>();
            SqlMetaData[] definicao = { new SqlMetaData("n", SqlDbType.Int) };
            
            int count = 0;

            for (int listcount = 0; listcount < (adm_list_status.Items.Count); listcount++)
            {
                
                if (adm_list_status.Items[listcount].Selected == true)
                {                    
                    status[count] = int.Parse(adm_list_status.Items[listcount].Value);
                    count++;
                }
            }
            foreach (int id in status)
            {
                SqlDataRecord rec = new SqlDataRecord(definicao);
                rec.SetInt32(0, id);
                lista_status.Add(rec);
            }

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                SqlCommand com = new SqlCommand("sp_vw_relat_substatus2", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.Add("@status", SqlDbType.Structured);
                com.Parameters["@status"].Direction = ParameterDirection.Input;
                com.Parameters["@status"].TypeName = "int_list";
                com.Parameters["@status"].Value = lista_status;

                using (SqlDataAdapter da = new SqlDataAdapter(com))
                using (DataSet ds = new DataSet())
                {
                    da.Fill(ds);
                    adm_list_substatus.DataSource = ds;
                    adm_list_substatus.DataBind();
                }
            }
        }

        protected void adm_button_relatorio_Click(object sender, EventArgs e)
        {
            int size = 0;
            List<SqlDataRecord> lista_status = new List<SqlDataRecord>();
            List<SqlDataRecord> lista_substatus = new List<SqlDataRecord>();
            List<SqlDataRecord> lista_projetos = new List<SqlDataRecord>();
            List<SqlDataRecord> lista_empresas = new List<SqlDataRecord>();
            SqlMetaData[] definicao = { new SqlMetaData("n", SqlDbType.Int) };
            int count = 0;  
            
            //CONTAGEM DE LINHAS SELECIONADAS NO LISTBOX DE STATUS
            for (int listcount = 0; listcount < (adm_list_status.Items.Count); listcount++)
            {
                if (adm_list_status.Items[listcount].Selected == true)
                {
                    size = size + 1;
                }
            }

            int[] status = new int[size];

            int verifica_status = 0;
            //PREENCHIMENTO DO ARRAY QUE CONTEM OS IDS DAS LINHAS SELECIONADAS NO LISTBOX DE STATUS
            for (int listcount = 0; listcount < (adm_list_status.Items.Count); listcount++)
            {                
                if (adm_list_status.Items[listcount].Selected == true)
                {
                    verifica_status = 1;
                    status[count] = int.Parse(adm_list_status.Items[listcount].Value);
                    count++;
                }
            }

            //POPULANDO O PARAMETRO PARA ENVIAR À PROCEDURE COM OS DADOS
            foreach (int id in status)
            {
                SqlDataRecord rec = new SqlDataRecord(definicao);
                rec.SetInt32(0, id);
                lista_status.Add(rec);
            }

            size = 0;
            count = 0;

            //CONTAGEM DE LINHAS SELECIONADAS NO LISTBOX DE PROJETOS
            for (int listcount = 0; listcount < (adm_list_projetos.Items.Count); listcount++)
            {
                if (adm_list_projetos.Items[listcount].Selected == true)
                {
                    size = size + 1;
                }
            }
            
            int[] projetos = new int[size];

            int verifica_projetos = 0;
            //PREENCHIMENTO DO ARRAY QUE CONTEM OS IDS DAS LINHAS SELECIONADAS NO LISTBOX DE PROJETOS
            for (int listcount = 0; listcount < (adm_list_projetos.Items.Count); listcount++)
            {
                if (adm_list_projetos.Items[listcount].Selected == true)
                {
                    verifica_projetos = 1;
                    projetos[count] = int.Parse(adm_list_projetos.Items[listcount].Value);
                    count++;
                }
            }

            //POPULANDO O PARAMETRO PARA ENVIAR À PROCEDURE COM OS DADOS
            foreach (int id in projetos)
            {
                SqlDataRecord rec = new SqlDataRecord(definicao);
                rec.SetInt32(0, id);
                lista_projetos.Add(rec);
            }

            size = 0;
            count = 0;

            //CONTAGEM DE LINHAS SELECIONADAS NO LISTBOX DE SUBSTATUS
            for (int listcount = 0; listcount < (adm_list_substatus.Items.Count); listcount++)
            {
                if (adm_list_substatus.Items[listcount].Selected == true)
                {
                    size = size + 1;
                }
            }

            int[] substatus = new int[size];

            int verifica_substatus = 0;
            //PREENCHIMENTO DO ARRAY QUE CONTEM OS IDS DAS LINHAS SELECIONADAS NO LISTBOX DE SUBSTATUS
            for (int listcount = 0; listcount < (adm_list_substatus.Items.Count); listcount++)
            {
                if (adm_list_substatus.Items[listcount].Selected == true)
                {
                    verifica_substatus = 1;
                    substatus[count] = int.Parse(adm_list_substatus.Items[listcount].Value);
                    count++;
                }
            }

            //POPULANDO O PARAMETRO PARA ENVIAR À PROCEDURE COM OS DADOS
            foreach (int id in substatus)
            {
                SqlDataRecord rec = new SqlDataRecord(definicao);
                rec.SetInt32(0, id);
                lista_substatus.Add(rec);
            }

            size = 0;
            count = 0;

            //CONTAGEM DE LINHAS SELECIONADAS NO LISTBOX DE EMPRESAS
            for (int listcount = 0; listcount < (adm_list_empresas.Items.Count); listcount++)
            {
                if (adm_list_empresas.Items[listcount].Selected == true)
                {
                    size = size + 1;
                }
            }

            int[] empresas = new int[size];

            int verifica_empresa = 0;
            //PREENCHIMENTO DO ARRAY QUE CONTEM OS IDS DAS LINHAS SELECIONADAS NO LISTBOX DE EMPRESAS
            for (int listcount = 0; listcount < (adm_list_empresas.Items.Count); listcount++)
            {
                if (adm_list_empresas.Items[listcount].Selected == true)
                {
                    verifica_empresa = 1;
                    empresas[count] = int.Parse(adm_list_empresas.Items[listcount].Value);
                    count++;
                }
            }

            //POPULANDO O PARAMETRO PARA ENVIAR À PROCEDURE COM OS DADOS
            foreach (int id in empresas)
            {
                SqlDataRecord rec = new SqlDataRecord(definicao);
                rec.SetInt32(0, id);
                lista_empresas.Add(rec);
            }

            size = 0;
            count = 0;

            int erro = 0;
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                string nome_relat = "";
                if ((Session["nome_relatorio"] != null) || (Session["nome_relatorio"] != ""))
                { nome_relat = Session["nome_relatorio"].ToString(); }

                int id_usuario = int.Parse(Session["IDusuario"].ToString());

                SqlCommand com = new SqlCommand(nome_relat, con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.Add("@status", SqlDbType.Structured);
                com.Parameters["@status"].Direction = ParameterDirection.Input;
                com.Parameters["@status"].TypeName = "int_list";
                if (verifica_status == 0)
                { com.Parameters["@status"].Value = null; }
                else
                {
                    com.Parameters["@status"].Value = lista_status;
                }

                com.Parameters.Add("@projetos", SqlDbType.Structured);
                com.Parameters["@projetos"].Direction = ParameterDirection.Input;
                com.Parameters["@projetos"].TypeName = "int_list";
                if (verifica_projetos == 0)
                { com.Parameters["@projetos"].Value = null; }
                else
                {
                    com.Parameters["@projetos"].Value = lista_projetos;
                }

                com.Parameters.Add("@substatus", SqlDbType.Structured);
                com.Parameters["@substatus"].Direction = ParameterDirection.Input;
                com.Parameters["@substatus"].TypeName = "int_list";
                if (verifica_substatus == 0)
                { com.Parameters["@substatus"].Value = null; }
                else
                {
                    com.Parameters["@substatus"].Value = lista_substatus;
                }


                com.Parameters.Add("@empresas", SqlDbType.Structured);
                com.Parameters["@empresas"].Direction = ParameterDirection.Input;
                com.Parameters["@empresas"].TypeName = "int_list";
                if (verifica_empresa == 0)
                { com.Parameters["@empresas"].Value = null; }
                else
                {
                    com.Parameters["@empresas"].Value = lista_empresas;
                }

                if (adm_drop_tipo_relat.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@tipo_relat", int.Parse(adm_drop_tipo_relat.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@tipo_relat", null); }
                
                if (adm_drop_captacao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@captacao", int.Parse(adm_drop_captacao.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@captacao", null); }

                if (adm_drop_entrega.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@entrega", int.Parse(adm_drop_entrega.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@entrega", null); }

                if (adm_drop_colaborador.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@colab", int.Parse(adm_drop_colaborador.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@colab", null); }

                if (adm_drop_usuario.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@colaborador", int.Parse(adm_drop_usuario.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@colaborador", null); }

                if (adm_drop_equipe.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@equipe", int.Parse(adm_drop_equipe.SelectedValue.ToString())); }
                else { com.Parameters.AddWithValue("@equipe", null); }

                com.Parameters.AddWithValue("@pre", int.Parse(adm_radiolist_pre_entrevista.SelectedValue.ToString()));
                         
                  
                if ((adm_text_dt_inicio.Text != "") && (adm_text_dt_fim.Text != ""))
                {
                    string valor_ini = adm_text_dt_inicio.Text;
                    //string conversao = valor_ini.Substring(0, 2) + "/" + valor_ini.Substring(2, 2) + "/" + valor_ini.Substring(4, 4);
                    int dia = 0;
                    int mes = 0;
                    dia = int.Parse(valor_ini.Substring(0, 2).ToString());
                    mes = int.Parse(valor_ini.Substring(3, 2).ToString());
                    if (((dia < 32) && (dia > 0)) && ((mes < 13) && (mes > 0)))
                    {
                        DateTime data_ini = Convert.ToDateTime(valor_ini, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@dt_ini", data_ini);
                    }

                    string valor_fim = adm_text_dt_fim.Text;
                    //string conversao1 = valor_fim.Substring(0, 2) + "/" + valor_fim.Substring(2, 2) + "/" + valor_fim.Substring(4, 4);
                    int dia1 = 0;
                    int mes1 = 0;
                    dia1 = int.Parse(valor_fim.Substring(0, 2).ToString());
                    mes1 = int.Parse(valor_fim.Substring(3, 2).ToString());
                    if (((dia1 < 32) && (dia1 > 0)) && ((mes1 < 13) && (mes1 > 0)))
                    {
                        DateTime data_fim = Convert.ToDateTime(valor_fim, new CultureInfo("en-GB", false));
                        com.Parameters.AddWithValue("@dt_fim", data_fim);
                    }
                    Session["relat_dt_ini"] = adm_text_dt_inicio.Text;
                    Session["relat_dt_fim"] = adm_text_dt_fim.Text;
                }
                else 
                { 
                    if ((adm_text_dt_fim.Text == "") && (adm_text_dt_inicio.Text == ""))
                    {
                        erro = 0;
                        com.Parameters.AddWithValue("@dt_ini", null);
                        com.Parameters.AddWithValue("@dt_fim", null);
                        Session["relat_dt_ini"] = null;
                        Session["relat_dt_fim"] = null;
                    }
                    else { erro = 1;}                   
                }

                com.Parameters.AddWithValue("@usuario", id_usuario);

                if ((erro == 0) && (nome_relat != ""))
                {
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    da.SelectCommand.CommandTimeout = 90;
                    da.Fill(ds_relat_henry);                    
                    
                    if (nome_relat == "sp_relat_prest_contas_2")
                    {
                        Session["grid_relat_henry"] = ds_relat_henry;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_ent_feita")
                    {
                        Session["entrevista_realizada"] = ds_relat_henry;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_ent_marcada")
                    {
                        Session["entrevista_agendada"] = ds_relat_henry;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_cdd_ok")
                    {
                        Session["entrevista_cdd_aprovada"] = ds_relat_henry;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_cdd_ok_proj")
                    {
                        Session["candidato_ok_projeto"] = ds_relat_henry;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_ent_feita_anl")
                    {
                        Session["entrevista_realizada_analitico"] = ds_relat_henry;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_ent_marcada_anl")
                    {
                        Session["entrevista_agendada_analitico"] = ds_relat_henry;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_cdd_ok_anl")
                    {
                        Session["entrevista_realizada_aprovada_analitico"] = ds_relat_henry;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_cdd_ok_proj_anl")
                    {
                        Session["candidato_ok_projeto_analitico"] = ds_relat_henry;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_inconsistencias")
                    {
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["relat_inconsistencias"] = ds_relat_henry;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_status")
                    {
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = ds_relat_henry;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_ent_agendada")
                    {
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = ds_relat_henry;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_contatos_anl")
                    {
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = ds_relat_henry;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = null;
                    }
                    if (nome_relat == "sp_relat_contatos")
                    {
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = ds_relat_henry;
                        Session["relatorio"] = null;
                    }
                    if ((nome_relat == "nrel_base_comercial") || (nome_relat == "nrel_cliente_havik") || (nome_relat == "nrel_entrevistas_realizadas") ||
                        (nome_relat == "nrel_placements") || (nome_relat == "nrel_vagas_abertas") || (nome_relat == "nrel_visitas_agendadas") ||
                        (nome_relat == "nrel_visitas_realizadas") || (nome_relat == "nrel_follow_cli_empresa"))
                    {
                        Session["candidato_ok_projeto_analitico"] = null;
                        Session["candidato_ok_projeto"] = null;
                        Session["grid_relat_henry"] = null;
                        Session["entrevista_realizada"] = null;
                        Session["entrevista_agendada"] = null;
                        Session["entrevista_cdd_aprovada"] = null;
                        Session["entrevista_realizada_analitico"] = null;
                        Session["entrevista_agendada_analitico"] = null;
                        Session["entrevista_realizada_aprovada_analitico"] = null;
                        Session["relat_inconsistencias"] = null;
                        Session["relat_status_analitico"] = null;
                        Session["relat_entrevista_agendada_analitico"] = null;
                        Session["relatorio_contatos_analítico"] = null;
                        Session["relatorio_contatos"] = null;
                        Session["relatorio"] = ds_relat_henry;
                    }

                }
                else 
                {
                    if (erro == 1)
                    { exibe_mensagem_administrativo(2, "período preenchido incorretamente, favor preencher novamente"); }
                    //if (erro == 2)
                    //{ exibe_mensagem_administrativo(2, "favor escolher apenas uma opção de pré-entrevista!"); }
                }

                switch (nome_relat)
                {
                    case "sp_relat_prest_contas_2":
                        Response.Redirect("Relatorios/Relatorio_Henry.aspx");
                        break;
                    case "sp_relat_ent_feita":
                        Response.Redirect("Relatorios/Entrevistas_realizadas_periodo.aspx");
                        break;
                    case "sp_relat_ent_marcada":
                        Response.Redirect("Relatorios/Entrevistas_agendadas_no_periodo.aspx");
                        break;
                    case "sp_relat_cdd_ok":
                        Response.Redirect("Relatorios/Entrevistas_aprovadas_no_periodo.aspx");
                        break;
                    case "sp_relat_cdd_ok_proj":
                        Response.Redirect("Relatorios/Candidatos_aprovados_por_projeto.aspx");
                        break;
                    case "sp_relat_ent_feita_anl":
                        Response.Redirect("Relatorios/Entrevistas_Realizadas_no_Período_por_Entrevistador_Analítico.aspx");
                        break;
                    case "sp_relat_ent_marcada_anl":
                        Response.Redirect("Relatorios/Entrevista_Realizada_No_Periodo_Por_Agendador_Analitico.aspx");
                        break;
                    case "sp_relat_cdd_ok_anl":
                        Response.Redirect("Relatorios/Entrevistas_Realizadas_e_Aprovadas_no_Periodo_por_Agendador_Analitico.aspx");
                        break;
                    case "sp_relat_cdd_ok_proj_anl":
                        Response.Redirect("Relatorios/Candidatos_Aprovados_por_Projeto_Analítico.aspx");
                        break;
                    case "sp_relat_inconsistencias":
                        Response.Redirect("Relatorios/Relatorio_Inconsistencias.aspx");
                        break;
                    case "sp_relat_status":
                        Response.Redirect("Relatorios/Relatorio_Status_Analitico.aspx");
                        break;
                    case "sp_relat_ent_agendada":
                        Response.Redirect("Relatorios/Relatorio_Entrevista_Agendada_Analitico.aspx");
                        break;
                    case "sp_relat_contatos_anl":
                        Response.Redirect("Relatorios/Relatorio_Contatos_Analitico.aspx");
                        break;
                    case "sp_relat_contatos":
                        Response.Redirect("Relatorios/Relatorio_Contatos.aspx");
                        break;
                    case "nrel_base_comercial":
                        Response.Redirect("Relatorios/Base_Comercial.aspx");
                        break;
                    case "nrel_cliente_havik":
                        Response.Redirect("Relatorios/Cliente_Havik.aspx");
                        break;
                    case "nrel_entrevistas_realizadas":
                        Response.Redirect("Relatorios/Entrevistas_Realizadas.aspx");
                        break;
                    case "nrel_placements":
                        Response.Redirect("Relatorios/Placements.aspx");
                        break;
                    case "nrel_vagas_abertas":
                        Response.Redirect("Relatorios/Vagas_Abertas.aspx");
                        break;
                    case "nrel_visitas_agendadas":
                        Response.Redirect("Relatorios/Visitas_Agendadas.aspx");
                        break;
                    case "nrel_visitas_realizadas":
                        Response.Redirect("Relatorios/Visitas_Realizadas.aspx");
                        break;
                    case "nrel_follow_cli_empresa":
                        Response.Redirect("Relatorios/Relatorio_Follow_Cli_Empresa.aspx");
                        break;
                    default:
                        break;

                }
                /*
                if (Session["grid_relat_henry"] != null)
                {
                    Response.Redirect("Relatorios/Relatorio_Henry.aspx");
                }
                if (Session["entrevista_realizada"] != null)
                {
                    Response.Redirect("Relatorios/Entrevistas_realizadas_periodo.aspx");
                }
                if (Session["entrevista_agendada"] != null)
                {
                    Response.Redirect("Relatorios/Entrevistas_agendadas_no_periodo.aspx");
                }
                if (Session["entrevista_cdd_aprovada"] != null)
                {
                    Response.Redirect("Relatorios/Entrevistas_aprovadas_no_periodo.aspx");
                }
                if (Session["candidato_ok_projeto"] != null)
                {
                    Response.Redirect("Relatorios/Candidatos_aprovados_por_projeto.aspx");
                }
                if (Session["entrevista_realizada_analitico"] != null)
                {
                    Response.Redirect("Relatorios/Entrevistas_Realizadas_no_Período_por_Entrevistador_Analítico.aspx");
                }
                if (Session["entrevista_agendada_analitico"] != null)
                {
                    Response.Redirect("Relatorios/Entrevista_Realizada_No_Periodo_Por_Agendador_Analitico.aspx");
                }
                if (Session["entrevista_realizada_aprovada_analitico"] != null)
                {
                    Response.Redirect("Relatorios/Entrevistas_Realizadas_e_Aprovadas_no_Periodo_por_Agendador_Analitico.aspx");
                }
                if (Session["candidato_ok_projeto_analitico"] != null)
                {
                    Response.Redirect("Relatorios/Candidatos_Aprovados_por_Projeto_Analítico.aspx");
                }
                if (Session["relat_inconsistencias"] != null)
                {
                    Response.Redirect("Relatorios/Relatorio_Inconsistencias.aspx");
                }
                if (Session["relat_status_analitico"] != null)
                {
                    Response.Redirect("Relatorios/Relatorio_Status_Analitico.aspx");
                }
                if (Session["relat_entrevista_agendada_analitico"] != null)
                {
                    Response.Redirect("Relatorios/Relatorio_Entrevista_Agendada_Analitico.aspx");
                }
                if (Session["relatorio_contatos_analítico"] != null)
                {
                    Response.Redirect("Relatorios/Relatorio_Contatos_Analitico.aspx");
                }
                */
            }
        }

        protected void adm_drop_tipo_relat_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                SqlCommand com = new SqlCommand("sp_vw_relat_descrelat", con);
                com.CommandType = CommandType.StoredProcedure;

                if (adm_drop_tipo_relat.SelectedIndex != 0)
                { 
                    com.Parameters.AddWithValue("@tipo", int.Parse(adm_drop_tipo_relat.SelectedValue.ToString()));
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    DataSet data = new DataSet();
                    da.Fill(data);
                    DataRow dr = data.Tables[0].Rows[0];

                    adm_label_descricao_relatorio.Text = dr["obs"].ToString();
                    Session["nome_relatorio"] = dr["nome_procedure"].ToString();
                }
                else 
                { 
                    com.Parameters.AddWithValue("@tipo", null);
                    adm_label_descricao_relatorio.Text = "";
                }


                


            }
        }

        protected void adm_list_projetos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int size = 0;
            for (int listcount = 0; listcount < (adm_list_projetos.Items.Count); listcount++)
            {
                if (adm_list_projetos.Items[listcount].Selected == true)
                {
                    size = size + 1;
                }
            }
            int[] projetos = new int[size];
            List<SqlDataRecord> lista_projetos = new List<SqlDataRecord>();
            SqlMetaData[] definicao = { new SqlMetaData("n", SqlDbType.Int) };

            int count = 0;

            for (int listcount = 0; listcount < (adm_list_projetos.Items.Count); listcount++)
            {

                if (adm_list_projetos.Items[listcount].Selected == true)
                {
                    projetos[count] = int.Parse(adm_list_projetos.Items[listcount].Value);
                    count++;
                }
            }
            foreach (int id in projetos)
            {
                SqlDataRecord rec = new SqlDataRecord(definicao);
                rec.SetInt32(0, id);
                lista_projetos.Add(rec);
            }

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                SqlCommand com = new SqlCommand("sp_vw_relat_empresa", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.Add("@projeto", SqlDbType.Structured);
                com.Parameters["@projeto"].Direction = ParameterDirection.Input;
                com.Parameters["@projeto"].TypeName = "int_list";
                com.Parameters["@projeto"].Value = lista_projetos;

                using (SqlDataAdapter da = new SqlDataAdapter(com))
                using (DataSet ds = new DataSet())
                {
                    da.Fill(ds);
                    adm_list_empresas.DataSource = ds;
                    adm_list_empresas.DataBind();
                }
            }
        }

        protected void adm_radio_tipos_projetos_SelectedIndexChanged(object sender, EventArgs e)
        {
            adm_list_projetos.DataBind();
            adm_list_empresas.DataSource = null;
            adm_list_empresas.DataBind();
            adm_list_empresas.Items.Clear();
        }

        protected void exibe_mensagem_administrativo(int indice, string mensagem)
        {
            int i = indice;
            string msg = mensagem;
            switch (i)
            {
                case 1:
                    //tratamento para trocar_senha
                    break;
                case 2:
                    //tratamento para relatorios
                    mensagem_erro_relatorios.Text = msg ;
                    break;
                case 3:
                    //tratamento para registro graduacao
                    break;
                default:
                    break;
            }
        }

        protected void adm_registro_button_graduacao_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                string sessao = "0";
                string valida = "null";

                SqlCommand com = new SqlCommand("sp_adm_graduacao", con);
                com.CommandType = CommandType.StoredProcedure;

                if (adm_registro_textgraduacao.Text != "")
                { com.Parameters.AddWithValue("@graduacao", adm_registro_textgraduacao.Text); }
                else { com.Parameters.AddWithValue("@graduacao", null); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                SqlParameter rowCount = com.Parameters.Add("@retorno", SqlDbType.Int);
                rowCount.Direction = ParameterDirection.Output;
                try
                {
                    if ((valida != sessao) && (adm_registro_textgraduacao.Text != ""))
                    {
                        com.ExecuteNonQuery();
                        adm_registro_grid_graduacao.DataBind();
                        exibe_mensagem_administrativo(3, "certificação cadastrada com sucesso!");

                    }
                    else
                    {
                        exibe_mensagem_administrativo(3, "certificação cadastrada sem sucesso!");
                    }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    {
                        exibe_mensagem_administrativo(3, "certificação cadastrada sem sucesso!");
                    }
                }
            }
        }
    }
}