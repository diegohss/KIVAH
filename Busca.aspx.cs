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

namespace HavikTeste
{
    public partial class Busca : System.Web.UI.Page
    {
        DataTable dt_busca = new DataTable();
        DataSet ds_busca_cliente = new DataSet();
        DataSet ds_busca_projeto = new DataSet();
        DataSet ds_busca_empresa = new DataSet();
        DataSet retorno_empresa = new DataSet();
        DataSet retorno_cliente = new DataSet();
        DataSet retorno_projeto = new DataSet();
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.Title = "Havik System - Busca";

            if (Session["IDusuario"] == null)
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            if (Session["busca_proj"] != null)
            { 
                MultiView1.ActiveViewIndex = 1;
                Session["busca_proj"] = null;
            }
            //APAGA O LABEL QUE INDICA O CLIENTE, PROJETO, EMPRESA EM EXIBIÇÃO
            Session["label_modulo"] = "";

            //busca_cli_drop_projeto.DataBind();
            //busca_cli_drop_projeto.Items.Insert(0, "Escolha a opção");
        }

        protected void ddlstatus_SelectedIndexChangedemp(object sender, EventArgs e)
        {
            busca_emp_dropsubstatus.DataBind();
            busca_emp_dropsubstatus.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceSubstatus_Selectingemp(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlempstatus = (DropDownList)busca_emp.FindControl("busca_emp_dropstatus");

            if (ddlempstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlempstatus.SelectedValue;
            }
        }

        protected void ddlstatus_SelectedIndexChangedproj(object sender, EventArgs e)
        {
            busca_proj_dropsubstatus.DataBind();
            busca_proj_dropsubstatus.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceSubstatus_Selectingproj(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_proj.FindControl("busca_proj_dropstatus");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChangedproj(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_proj.FindControl("busca_proj_droparea");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void ddlarea_SelectedIndexChangedproj(object sender, EventArgs e)
        {
            busca_proj_dropsubdivisao.DataBind();
            busca_proj_dropsubdivisao.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selectingproj(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)busca_proj.FindControl("busca_proj_dropsegmento");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selectingproj(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_proj.FindControl("busca_proj_droparea");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void proj_segmento_Selectingproj(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ddlstatus_SelectedIndexChangedcli(object sender, EventArgs e)
        {
            busca_cli_dropsubstatus.DataBind();
            busca_cli_dropsubstatus.Items.Insert(0, "Escolha a opção");
        }

        protected void ddlstatus_SelectedIndexChangedcli2(object sender, EventArgs e)
        {
            busca_cli_dropsubstatus2.DataBind();
            busca_cli_dropsubstatus2.Items.Insert(0, "Escolha a opção");
        }

        protected void ddlstatus_SelectedIndexChangedcli3(object sender, EventArgs e)
        {
            busca_cli_dropsubstatus3.DataBind();
            busca_cli_dropsubstatus3.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceSubstatus_Selectingcli(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_cli.FindControl("busca_cli_dropstatus");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void SqlDataSourceSubstatus_Selectingcli2(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_cli.FindControl("busca_cli_dropstatus2");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void SqlDataSourceSubstatus_Selectingcli3(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_cli.FindControl("busca_cli_dropstatus3");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void ddlstatus_SelectedIndexChangedemp2(object sender, EventArgs e)
        {
            busca_emp_dropsubstatus2.DataBind();
            busca_emp_dropsubstatus2.Items.Insert(0, "Escolha a opção");
        }

        protected void ddlstatus_SelectedIndexChangedemp3(object sender, EventArgs e)
        {
            busca_emp_dropsubstatus3.DataBind();
            busca_emp_dropsubstatus3.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceSubstatus_Selectingemp2(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_emp.FindControl("busca_emp_dropstatus2");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void SqlDataSourceSubstatus_Selectingemp3(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_emp.FindControl("busca_emp_dropstatus3");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void ddlstatus_SelectedIndexChangedproj2(object sender, EventArgs e)
        {
            busca_proj_dropsubstatus2.DataBind();
            busca_proj_dropsubstatus2.Items.Insert(0, "Escolha a opção");
        }

        protected void ddlstatus_SelectedIndexChangedproj3(object sender, EventArgs e)
        {
            busca_proj_dropsubstatus3.DataBind();
            busca_proj_dropsubstatus3.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceSubstatus_Selectingproj2(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_proj.FindControl("busca_proj_dropstatus2");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void SqlDataSourceSubstatus_Selectingproj3(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlstatus = (DropDownList)busca_proj.FindControl("busca_proj_dropstatus3");

            if (ddlstatus != null)
            {
                e.Command.Parameters["@id"].Value = ddlstatus.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChangedproj2(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_proj.FindControl("busca_proj_droparea2");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void ddlarea_SelectedIndexChangedproj2(object sender, EventArgs e)
        {
            busca_proj_dropsubdivisao2.DataBind();
            busca_proj_dropsubdivisao2.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selectingproj2(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)busca_proj.FindControl("busca_proj_dropsegmento2");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selectingproj2(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_proj.FindControl("busca_proj_droparea2");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChangedproj3(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_proj.FindControl("busca_proj_droparea3");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void ddlarea_SelectedIndexChangedproj3(object sender, EventArgs e)
        {
            busca_proj_dropsubdivisao3.DataBind();
            busca_proj_dropsubdivisao3.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selectingproj3(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)busca_proj.FindControl("busca_proj_dropsegmento3");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selectingproj3(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_proj.FindControl("busca_proj_droparea3");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChangedcli(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_cli.FindControl("busca_cli_droparea");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void ddlarea_SelectedIndexChangedcli(object sender, EventArgs e)
        {
            busca_cli_dropsubdivisao.DataBind();
            busca_cli_dropsubdivisao.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selectingcli(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)busca_cli.FindControl("busca_cli_dropsegmento");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selectingcli(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_cli.FindControl("busca_cli_droparea");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChangedcli2(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_cli.FindControl("busca_cli_droparea2");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void ddlarea_SelectedIndexChangedcli2(object sender, EventArgs e)
        {
            busca_cli_dropsubdivisao2.DataBind();
            busca_cli_dropsubdivisao2.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selectingcli2(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)busca_cli.FindControl("busca_cli_dropsegmento2");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selectingcli2(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_cli.FindControl("busca_cli_droparea2");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void ddlsegmento_SelectedIndexChangedcli3(object sender, EventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_cli.FindControl("busca_cli_droparea3");

            if (ddlarea != null)
            {
                ddlarea.DataBind();
                ddlarea.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void ddlarea_SelectedIndexChangedcli3(object sender, EventArgs e)
        {
            busca_cli_dropsubdivisao3.DataBind();
            busca_cli_dropsubdivisao3.Items.Insert(0, "Escolha a opção");
        }

        protected void SqlDataSourceArea_Selectingcli3(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlsegmento = (DropDownList)busca_cli.FindControl("busca_cli_dropsegmento3");

            if (ddlsegmento != null)
            {
                e.Command.Parameters["@id"].Value = ddlsegmento.SelectedValue;
            }
        }

        protected void SqlDataSourceSubdivisao_Selectingcli3(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList ddlarea = (DropDownList)busca_cli.FindControl("busca_cli_droparea3");

            if (ddlarea != null)
            {
                e.Command.Parameters["@id"].Value = ddlarea.SelectedValue;
            }
        }

        protected void SqlDataSourceDetails_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DropDownList ddlseg = (DropDownList)busca_proj.FindControl("busca_proj_dropsegmento");
            e.Command.Parameters["@Category"].Value = ddlseg.SelectedValue;
            DropDownList ddlarea = (DropDownList)busca_proj.FindControl("busca_proj_droparea");
            e.Command.Parameters["@Product"].Value = ddlarea.SelectedValue;
            DropDownList ddlstatus = (DropDownList)busca_proj.FindControl("busca_proj_dropstatus");
            e.Command.Parameters["@Status"].Value = ddlstatus.SelectedValue;
            DropDownList ddlempstatus = (DropDownList)busca_emp.FindControl("busca_emp_dropstatus");
            e.Command.Parameters["@Descricao"].Value = ddlempstatus.SelectedValue;
        }

        public void cli_check_all_CheckChanged(object sender, EventArgs e)
        {
            //if (sender.Checked)
            //{
            CheckBox select_all = (CheckBox)sender;
            if (select_all.Checked == true)
            {
                foreach (GridViewRow row in grid_cli_busca_e.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("cli_check");
                    cb.Checked = true;
                    //((CheckBox)row.FindControl("cli_check")).Checked = true;
                }
            }
            else 
            {
                foreach (GridViewRow row in grid_cli_busca_e.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("cli_check");
                    cb.Checked = false;
                    //((CheckBox)row.FindControl("cli_check")).Checked = true;
                }
            }
        }
        

        /* BUSCA CLIENTE TIPO E --------------------------  MÓDULO BUSCA */


        protected void Button46_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                string tipobusca = "sp_busca_cliente_e";

                if (busca_cli_radio_tipobusca.SelectedValue == "2")
                { tipobusca = "sp_busca_cliente_ou"; }

                SqlCommand com = new SqlCommand(tipobusca, con);
                com.CommandType = CommandType.StoredProcedure;

                if (cli_busca_textnome.Text != "")
                {
                    string palavra = "";
                    palavra = cli_busca_textnome.Text;
                    palavra.Replace(" ", "%");
                    com.Parameters.AddWithValue("@nome", palavra);
                }
                else { com.Parameters.AddWithValue("@nome", ""); }
                if (cli_busca_textemail.Text != "")
                { com.Parameters.AddWithValue("@email", cli_busca_textemail.Text); }
                else { com.Parameters.AddWithValue("@email", ""); }
                if (cli_busca_texttelefone.Text != "")
                { com.Parameters.AddWithValue("@telefone", cli_busca_texttelefone.Text); }
                else { com.Parameters.AddWithValue("@telefone", ""); }
                if (cli_busca_textendereco.Text != "")
                { com.Parameters.AddWithValue("@endereco", cli_busca_textendereco.Text); }
                else { com.Parameters.AddWithValue("@endereco", ""); }
                if (cli_busca_textcidade.Text != "")
                { com.Parameters.AddWithValue("@cidade", cli_busca_textcidade.Text); }
                else { com.Parameters.AddWithValue("@cidade", ""); }
                if (cli_busca_textbairro.Text != "")
                { com.Parameters.AddWithValue("@bairro", cli_busca_textbairro.Text); }
                else { com.Parameters.AddWithValue("@bairro", ""); }
                if (busca_cli_dropsegmento.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento", busca_cli_dropsegmento.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento", ""); }
                if (busca_cli_dropsegmento2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento2", busca_cli_dropsegmento2.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento2", ""); }
                if (busca_cli_dropsegmento3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento3", busca_cli_dropsegmento3.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento3", ""); }
                if (busca_cli_dropcargo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cargo", busca_cli_dropcargo.SelectedValue); }
                else { com.Parameters.AddWithValue("@cargo", ""); }
                if (busca_cli_dropcargo2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cargo2", busca_cli_dropcargo2.SelectedValue); }
                else { com.Parameters.AddWithValue("@cargo2", ""); }
                if (busca_cli_dropcargo3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cargo3", busca_cli_dropcargo3.SelectedValue); }
                else { com.Parameters.AddWithValue("@cargo3", ""); }
                if (busca_cli_droparea.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@area", busca_cli_droparea.SelectedValue); }
                else { com.Parameters.AddWithValue("@area", ""); }
                if (busca_cli_droparea2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@area2", busca_cli_droparea2.SelectedValue); }
                else { com.Parameters.AddWithValue("@area2", ""); }
                if (busca_cli_droparea3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@area3", busca_cli_droparea3.SelectedValue); }
                else { com.Parameters.AddWithValue("@area3", ""); }
                if (busca_cli_dropsubdivisao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@subdivisao", busca_cli_dropsubdivisao.SelectedValue); }
                else { com.Parameters.AddWithValue("@subdivisao", ""); }
                if (busca_cli_dropsubdivisao2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@subdivisao2", busca_cli_dropsubdivisao2.SelectedValue); }
                else { com.Parameters.AddWithValue("@subdivisao2", ""); }
                if (busca_cli_dropsubdivisao3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@subdivisao3", busca_cli_dropsubdivisao3.SelectedValue); }
                else { com.Parameters.AddWithValue("@subdivisao3", ""); }
                if (busca_cli_dropstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status", busca_cli_dropstatus.SelectedValue); }
                else { com.Parameters.AddWithValue("@status", ""); }
                if (busca_cli_dropstatus2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status2", busca_cli_dropstatus2.SelectedValue); }
                else { com.Parameters.AddWithValue("@status2", ""); }
                if (busca_cli_dropstatus3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status3", busca_cli_dropstatus3.SelectedValue); }
                else { com.Parameters.AddWithValue("@status3", ""); }
                if (busca_cli_dropsubstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus", busca_cli_dropsubstatus.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus", ""); }
                if (busca_cli_dropsubstatus2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus2", busca_cli_dropsubstatus2.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus2", ""); }
                if (busca_cli_dropsubstatus3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus3", busca_cli_dropsubstatus3.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus3", ""); }
                if (cli_busca_textidade_inicial.Text != "")
                { com.Parameters.AddWithValue("@idade_ini", cli_busca_textidade_inicial.Text); }
                else { com.Parameters.AddWithValue("@idade_ini", ""); }
                if (cli_busca_textidade_final.Text != "")
                { com.Parameters.AddWithValue("@idade_fim", cli_busca_textidade_final.Text); }
                else { com.Parameters.AddWithValue("@idade_fim", ""); }
                if (cli_busca_dropsexo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@sexo", cli_busca_dropsexo.SelectedValue); }
                else { com.Parameters.AddWithValue("@sexo", ""); }
                if (cli_busca_dropescolaridade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@escolaridade", cli_busca_dropescolaridade.SelectedValue); }
                else { com.Parameters.AddWithValue("@escolaridade", ""); }
                if (cli_busca_textcurso.Text != "")
                { com.Parameters.AddWithValue("@graduacao", cli_busca_textcurso.Text); }
                else { com.Parameters.AddWithValue("@graduacao", ""); }
                //if (cli_busca_textcurso.Text != "")
                //{ com.Parameters.AddWithValue("@instituicao", cli_busca_textcurso.Text); }
                //else { com.Parameters.AddWithValue("@instituicao", ""); }
                com.Parameters.AddWithValue("@instituicao", "");
                if (cli_busca_textsalario_inicial.Text != "")
                { com.Parameters.AddWithValue("@salario_ini", cli_busca_textsalario_inicial.Text); }
                else { com.Parameters.AddWithValue("@salario_ini", ""); }
                if (cli_busca_textsalario_final.Text != "")
                { com.Parameters.AddWithValue("@salario_fim", cli_busca_textsalario_final.Text); }
                else { com.Parameters.AddWithValue("@salario_fim", ""); }
                if (cli_busca_textempresa.Text != "")
                { com.Parameters.AddWithValue("@empresa", cli_busca_textempresa.Text); }
                else { com.Parameters.AddWithValue("@empresa", ""); }
                if (cli_busca_dropidiomas.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@idioma", cli_busca_dropidiomas.SelectedValue); }
                else { com.Parameters.AddWithValue("@idioma", ""); }
                if (cli_busca_dropnivel.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@nvl_idioma", cli_busca_dropnivel.SelectedValue); }
                else { com.Parameters.AddWithValue("@nvl_idioma", ""); }
                if (cli_busca_textrealiza.Text != "")
                { com.Parameters.AddWithValue("@realiza", cli_busca_textrealiza.Text); }
                else { com.Parameters.AddWithValue("@realiza", ""); }
                if (cli_busca_textrealiza2.Text != "")
                { com.Parameters.AddWithValue("@realiza2", cli_busca_textrealiza2.Text); }
                else { com.Parameters.AddWithValue("@realiza2", ""); }
                if (cli_busca_textrealiza3.Text != "")
                { com.Parameters.AddWithValue("@realiza3", cli_busca_textrealiza3.Text); }
                else { com.Parameters.AddWithValue("@realiza3", ""); }
                if (cli_busca_textprojeto.Text != "")
                { com.Parameters.AddWithValue("@projeto", cli_busca_textprojeto.Text); }
                else { com.Parameters.AddWithValue("@projeto", ""); }
                if (cli_busca_textprojeto2.Text != "")
                { com.Parameters.AddWithValue("@projeto2", cli_busca_textprojeto2.Text); }
                else { com.Parameters.AddWithValue("@projeto2", ""); }
                if (cli_busca_textprojeto3.Text != "")
                { com.Parameters.AddWithValue("@projeto3", cli_busca_textprojeto3.Text); }
                else { com.Parameters.AddWithValue("@projeto3", ""); }
                if (cli_busca_textpalavrachave.Text != "")
                {
                    string palavra = "";
                    palavra = cli_busca_textpalavrachave.Text;
                    palavra.Replace(" ", "%");
                    com.Parameters.AddWithValue("@palavra", palavra);
                }
                else { com.Parameters.AddWithValue("@palavra", ""); }
                if (cli_busca_textpalavrachave_2.Text != "")
                {
                    string palavra = "";
                    palavra = cli_busca_textpalavrachave_2.Text;
                    palavra.Replace(" ", "%");
                    com.Parameters.AddWithValue("@palavra2", palavra); 
                }
                else { com.Parameters.AddWithValue("@palavra2", ""); }
                if (cli_busca_textpalavrachave_3.Text != "")
                {
                    string palavra = "";
                    palavra = cli_busca_textpalavrachave_3.Text;
                    palavra.Replace(" ", "%");
                    com.Parameters.AddWithValue("@palavra3", palavra); 
                }
                else { com.Parameters.AddWithValue("@palavra3", ""); }
                if (cli_busca_text_curso.Text != "")
                { com.Parameters.AddWithValue("@curso", cli_busca_text_curso.Text); }
                else { com.Parameters.AddWithValue("@curso", ""); }
                if (cli_busca_text_curso2.Text != "")
                { com.Parameters.AddWithValue("@curso2", cli_busca_text_curso2.Text); }
                else { com.Parameters.AddWithValue("@curso2", ""); }
                if (cli_busca_text_curso3.Text != "")
                { com.Parameters.AddWithValue("@curso3", cli_busca_text_curso3.Text); }
                else { com.Parameters.AddWithValue("@curso3", ""); }
                if (cli_busca_text_id_cliente.Text != "")
                { com.Parameters.AddWithValue("@id_cliente", cli_busca_text_id_cliente.Text); }
                else { com.Parameters.AddWithValue("@id_cliente", ""); }
                com.Parameters.AddWithValue("@usuario", id_usuario);

                
                SqlDataAdapter da = new SqlDataAdapter(com);
                da.SelectCommand.CommandTimeout = 120;                
                da.Fill(ds_busca_cliente);
                if (ds_busca_cliente.Tables[0].Rows.Count < 1200)
                {
                    Session["grid_busca_cliente"] = ds_busca_cliente;
                    grid_cli_busca_e.DataSource = ds_busca_cliente;
                    grid_cli_busca_e.DataBind();
                    rowcount_cliente.Text = "A busca retornou " + grid_cli_busca_e.Rows.Count.ToString() + " resultados.";
                    rowcount_cliente.Focus();
                    mensagem_busca_cli.Text = "";
                }
                else
                {
                    rowcount_cliente.Text = "";
                    mensagem_busca_cli.Text = "busca retornou muitos resultados, escolha mais filtros!";
                    mensagem_busca_cli.Focus();
                }
                grid_emp_busca_e.DataSource = null;
                grid_emp_busca_e.DataBind(); 
                grid_proj_busca_e.DataSource = null;
                grid_proj_busca_e.DataBind();

                System.Drawing.Color c;
                
                foreach (GridViewRow row in grid_cli_busca_e.Rows)
                {
                    if (grid_cli_busca_e.DataKeys[row.RowIndex].Values["hexa"].ToString() != "&nbsp;")
                    {
                        c = System.Drawing.ColorTranslator.FromHtml(grid_cli_busca_e.DataKeys[row.RowIndex].Values["hexa"].ToString());
                        grid_cli_busca_e.Rows[row.RowIndex].BackColor = c;
                    }
                }
            }
        }

        protected void Button47_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                //int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                //int id_projeto = 0;
                //string comp = "";
                //string compddl = "0";
                string tipobusca = "sp_busca_projeto_e";

                //SqlDataAdapter com = new SqlDataAdapter("sp_busca_cliente_ou", con);
                if (busca_proj_radio_tipobusca.SelectedValue == "2")
                { tipobusca = "sp_busca_projeto_ou"; }

                SqlCommand com = new SqlCommand(tipobusca, con);
                com.CommandType = CommandType.StoredProcedure;

                if (busca_proj_textnome.Text != "")
                { com.Parameters.AddWithValue("@projeto", busca_proj_textnome.Text); }
                else { com.Parameters.AddWithValue("@projeto", ""); }
                if (busca_proj_dropescolaridade.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@escolaridade", busca_proj_dropescolaridade.SelectedValue); }
                else { com.Parameters.AddWithValue("@escolaridade", ""); }
                if (busca_proj_textgraduacao.Text != "")
                { com.Parameters.AddWithValue("@graduacao", busca_proj_textgraduacao.Text); }
                else { com.Parameters.AddWithValue("@graduacao", ""); }
                if (busca_proj_droptipo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@produto", busca_proj_droptipo.SelectedValue); }
                else { com.Parameters.AddWithValue("@produto", ""); }
                if (busca_proj_empresa.Text != "")
                { com.Parameters.AddWithValue("@empresa", busca_proj_empresa.Text); }
                else { com.Parameters.AddWithValue("@empresa", ""); }
                if (busca_proj_empresa.Text != "")
                { com.Parameters.AddWithValue("@empresa2", busca_proj_empresa.Text); }
                else { com.Parameters.AddWithValue("@empresa2", ""); }
                if (busca_proj_dropentrega.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_entrega", busca_proj_dropentrega.SelectedValue); }
                else { com.Parameters.AddWithValue("@responsavel_entrega", ""); }
                if (busca_proj_dropcaptacao.SelectedValue != "0")
                { com.Parameters.AddWithValue("@responsavel_captacao", busca_proj_dropcaptacao.SelectedValue); }
                else { com.Parameters.AddWithValue("@responsavel_captacao", ""); }
                if (busca_proj_dropcolaborador.SelectedValue != "0")
                { com.Parameters.AddWithValue("@colaborador_responsavel", busca_proj_dropcolaborador.SelectedValue); }
                else { com.Parameters.AddWithValue("@colaborador_responsavel", ""); }
                if (busca_proj_dropmodelo_contratacao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@modelo_contratacao", busca_proj_dropmodelo_contratacao.SelectedValue); }
                else { com.Parameters.AddWithValue("@modelo_contratacao", ""); }
                if (busca_proj_textsalario_inicial.Text != "")
                { com.Parameters.AddWithValue("@sal_ini", busca_proj_textsalario_inicial.Text); }
                else { com.Parameters.AddWithValue("@sal_ini", ""); }
                if (busca_proj_textsalario_final.Text != "")
                { com.Parameters.AddWithValue("@sal_fim", busca_proj_textsalario_final.Text); }
                else { com.Parameters.AddWithValue("@sal_fim", ""); }
                if (busca_proj_dropsegmento.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento", busca_proj_dropsegmento.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento", ""); }
                if (busca_proj_dropsegmento2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento2", busca_proj_dropsegmento2.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento2", ""); }
                if (busca_proj_dropsegmento3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento3", busca_proj_dropsegmento3.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento3", ""); }
                if (busca_proj_droparea.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@area", busca_proj_droparea.SelectedValue); }
                else { com.Parameters.AddWithValue("@area", ""); }
                if (busca_proj_droparea2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@area2", busca_proj_droparea2.SelectedValue); }
                else { com.Parameters.AddWithValue("@area2", ""); }
                if (busca_proj_droparea3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@area3", busca_proj_droparea3.SelectedValue); }
                else { com.Parameters.AddWithValue("@area3", ""); }
                if (busca_proj_dropsubdivisao.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@subdivisao", busca_proj_dropsubdivisao.SelectedValue); }
                else { com.Parameters.AddWithValue("@subdivisao", ""); }
                if (busca_proj_dropsubdivisao2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@subdivisao2", busca_proj_dropsubdivisao2.SelectedValue); }
                else { com.Parameters.AddWithValue("@subdivisao2", ""); }
                if (busca_proj_dropsubdivisao3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@subdivisao3", busca_proj_dropsubdivisao3.SelectedValue); }
                else { com.Parameters.AddWithValue("@subdivisao3", ""); }
                if (busca_proj_dropstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status", busca_proj_dropstatus.SelectedValue); }
                else { com.Parameters.AddWithValue("@status", ""); }
                if (busca_proj_dropstatus2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status2", busca_proj_dropstatus2.SelectedValue); }
                else { com.Parameters.AddWithValue("@status2", ""); }
                if (busca_proj_dropstatus3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status3", busca_proj_dropstatus3.SelectedValue); }
                else { com.Parameters.AddWithValue("@status3", ""); }
                if (busca_proj_dropsubstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus", busca_proj_dropsubstatus.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus", ""); }
                if (busca_proj_dropsubstatus2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus2", busca_proj_dropsubstatus2.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus2", ""); }
                if (busca_proj_dropsubstatus3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus3", busca_proj_dropsubstatus3.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus3", ""); }
                if (busca_proj_dropcargo.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cargo", busca_proj_dropcargo.SelectedValue); }
                else { com.Parameters.AddWithValue("@cargo", ""); }
                if (busca_proj_dropcargo2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cargo2", busca_proj_dropcargo2.SelectedValue); }
                else { com.Parameters.AddWithValue("@cargo2", ""); }
                if (busca_proj_dropcargo3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cargo3", busca_proj_dropcargo3.SelectedValue); }
                else { com.Parameters.AddWithValue("@cargo3", ""); }
                if (busca_proj_dropidiomas.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@idioma", busca_proj_dropidiomas.SelectedValue); }
                else { com.Parameters.AddWithValue("@idioma", ""); }
                if (busca_proj_dropnivel.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@nvl_idioma", busca_proj_dropnivel.SelectedValue); }
                else { com.Parameters.AddWithValue("@nvl_idioma", ""); }
                if (busca_proj_dropidiomas.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@idioma2", busca_proj_dropidiomas.SelectedValue); }
                else { com.Parameters.AddWithValue("@idioma2", ""); }
                if (busca_proj_dropnivel.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@nvl_idioma2", busca_proj_dropnivel.SelectedValue); }
                else { com.Parameters.AddWithValue("@nvl_idioma2", ""); }
                if (busca_proj_textdescricao.Text != "")
                { com.Parameters.AddWithValue("@descricao", busca_proj_textdescricao.Text); }
                else { com.Parameters.AddWithValue("@descricao", ""); }
                if (busca_proj_textdescricao.Text != "")
                { com.Parameters.AddWithValue("@descricao2", busca_proj_textdescricao.Text); }
                else { com.Parameters.AddWithValue("@descricao2", ""); }
                if (busca_proj_textidprojeto.Text != "")
                { com.Parameters.AddWithValue("@id_projeto", busca_proj_textidprojeto.Text); }
                else { com.Parameters.AddWithValue("@id_projeto", ""); }
                if (busca_proj_drop_projetos.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@situacao", busca_proj_drop_projetos.SelectedIndex); }
                else { com.Parameters.AddWithValue("@situacao", ""); } 
                com.Parameters.AddWithValue("@usuario", id_usuario);


                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(ds_busca_projeto);
                if (ds_busca_projeto.Tables[0].Rows.Count < 1200)
                {
                    Session["grid_busca_projeto"] = ds_busca_projeto;
                    grid_proj_busca_e.DataSource = ds_busca_projeto;
                    grid_proj_busca_e.DataBind();
                    rowcount_proj.Text = "A busca retornou " + grid_proj_busca_e.Rows.Count.ToString() + " resultados.";
                    mensagem_busca_proj.Text = "";
                }
                else
                {
                    mensagem_busca_proj.Text = "busca retornou muitos resultados, escolha mais filtros!";
                    rowcount_proj.Text = "";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('busca retornou muitos resultados, escolha mais filtros!')");
                }                
                grid_emp_busca_e.DataSource = null;
                grid_emp_busca_e.DataBind();
                grid_cli_busca_e.DataSource = null;
                grid_cli_busca_e.DataBind();
            }
        }

        protected void menuBusca_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void busca_empresa()
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                //int i = 1;
                int id_usuario = int.Parse(Session["IDusuario"].ToString());
                //int id_projeto = 0;
                //string comp = "";
                //string compddl = "0";
                string tipobusca = "sp_busca_empresa_e";

                if (busca_emp_radio_tipobusca.SelectedValue == "2")
                { tipobusca = "sp_busca_empresa_ou"; }

                SqlCommand com = new SqlCommand(tipobusca, con);
                com.CommandType = CommandType.StoredProcedure;

                if (busca_emp_textnome.Text != "")
                {
                    string conversor_nome = busca_emp_textnome.Text;
                    conversor_nome = conversor_nome.Replace("'", "");
                    com.Parameters.AddWithValue("@empresa", conversor_nome);
                }
                else { com.Parameters.AddWithValue("@empresa", ""); }
                if (busca_emp_textnomecontato.Text != "")
                { com.Parameters.AddWithValue("@contato", busca_emp_textnomecontato.Text); }
                else { com.Parameters.AddWithValue("@contato", ""); }
                if (busca_emp_texttelefone.Text != "")
                { com.Parameters.AddWithValue("@telefone", busca_emp_texttelefone.Text); }
                else { com.Parameters.AddWithValue("@telefone", ""); }
                if (busca_emp_textendereco.Text != "")
                { com.Parameters.AddWithValue("@endereco", busca_emp_textendereco.Text); }
                else { com.Parameters.AddWithValue("@endereco", ""); }
                if (busca_emp_dropcidade.SelectedValue != "000000")
                { com.Parameters.AddWithValue("@cidade", busca_emp_dropcidade.SelectedValue); }
                else { com.Parameters.AddWithValue("@cidade", ""); }
                if (busca_emp_dropestado.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@estado", busca_emp_dropestado.SelectedValue); }
                else { com.Parameters.AddWithValue("@estado", ""); }
                if (busca_emp_droppais.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@pais", busca_emp_droppais.SelectedValue); }
                else { com.Parameters.AddWithValue("@pais", ""); }
                if (busca_emp_dropnrodefuncionarios.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@funcionarios", busca_emp_dropnrodefuncionarios.SelectedValue); }
                else { com.Parameters.AddWithValue("@funcionarios", ""); }
                if (busca_emp_dropfaturamento.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@faturamento", busca_emp_dropfaturamento.SelectedValue); }
                else { com.Parameters.AddWithValue("@faturamento", ""); }
                if (busca_emp_droporigem.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@origem", busca_emp_droporigem.SelectedValue); }
                else { com.Parameters.AddWithValue("@origem", ""); }
                if (busca_emp_textenderecofilial.Text != "")
                { com.Parameters.AddWithValue("@endereco_filial", busca_emp_textenderecofilial.Text); }
                else { com.Parameters.AddWithValue("@endereco_filial", ""); }
                if (busca_emp_textnomefilial.Text != "")
                { com.Parameters.AddWithValue("@filial", busca_emp_textnomefilial.Text); }
                else { com.Parameters.AddWithValue("@filial", ""); }
                if (busca_emp_dropsegmento.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento", busca_emp_dropsegmento.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento", ""); }
                if (busca_emp_dropsegmento2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento2", busca_emp_dropsegmento2.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento2", ""); }
                if (busca_emp_dropsegmento3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@segmento3", busca_emp_dropsegmento3.SelectedValue); }
                else { com.Parameters.AddWithValue("@segmento3", ""); }
                if (busca_emp_dropstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status", busca_emp_dropstatus.SelectedValue); }
                else { com.Parameters.AddWithValue("@status", ""); }
                if (busca_emp_dropstatus2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status2", busca_emp_dropstatus2.SelectedValue); }
                else { com.Parameters.AddWithValue("@status2", ""); }
                if (busca_emp_dropstatus3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@status3", busca_emp_dropstatus3.SelectedValue); }
                else { com.Parameters.AddWithValue("@status3", ""); }
                if (busca_emp_dropsubstatus.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus", busca_emp_dropsubstatus.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus", ""); }
                if (busca_emp_dropsubstatus2.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus2", busca_emp_dropsubstatus2.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus2", ""); }
                if (busca_emp_dropsubstatus3.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@substatus3", busca_emp_dropsubstatus3.SelectedValue); }
                else { com.Parameters.AddWithValue("@substatus3", ""); }
                com.Parameters.AddWithValue("@usuario", id_usuario);
                com.Parameters.AddWithValue("@cargo", "");
                com.Parameters.AddWithValue("@cargo2", "");
                com.Parameters.AddWithValue("@cargo3", "");
                com.Parameters.AddWithValue("@email", "");
                com.Parameters.AddWithValue("@area", "");
                com.Parameters.AddWithValue("@area2", "");
                com.Parameters.AddWithValue("@area3", "");
                com.Parameters.AddWithValue("@idioma", "");
                com.Parameters.AddWithValue("@nvl_idioma", "");
                com.Parameters.AddWithValue("@realiza", "");
                com.Parameters.AddWithValue("@realiza2", "");
                com.Parameters.AddWithValue("@realiza3", "");
                com.Parameters.AddWithValue("@projeto", "");
                com.Parameters.AddWithValue("@projeto2", "");
                com.Parameters.AddWithValue("@projeto3", "");
                if (busca_emp_dropestado_filial.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@estado_filial", busca_emp_dropestado_filial.SelectedValue); }
                else { com.Parameters.AddWithValue("@estado_filial", ""); }
                if (busca_emp_dropcidade_filial.SelectedIndex != 0)
                { com.Parameters.AddWithValue("@cidade_filial", busca_emp_dropcidade_filial.SelectedValue); }
                else { com.Parameters.AddWithValue("@cidade_filial", ""); }




                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(ds_busca_empresa);
                if (ds_busca_empresa.Tables[0].Rows.Count < 1200)
                {
                    Session["grid_busca_empresa"] = ds_busca_empresa;
                    grid_emp_busca_e.DataSource = ds_busca_empresa;
                    grid_emp_busca_e.DataBind();
                    rowcount_empresa.Text = "A busca retornou " + grid_emp_busca_e.Rows.Count.ToString() + " resultados.";
                    rowcount_empresa.Focus();
                    mensagem_busca_emp.Text = "";
                }
                else
                {
                    mensagem_busca_emp.Text = "busca retornou muitos resultados, escolha mais filtros!";
                    mensagem_busca_emp.Focus();
                    rowcount_empresa.Text = "";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('busca retornou muitos resultados, escolha mais filtros!')");
                }
                grid_proj_busca_e.DataSource = null;
                grid_proj_busca_e.DataBind();
                grid_cli_busca_e.DataSource = null;
                grid_cli_busca_e.DataBind();
            }
        }

        protected void Button48_Click(object sender, EventArgs e)
        {
            busca_empresa();
        }

        protected void grid_emp_busca_e_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["label_modulo"] = grid_emp_busca_e.SelectedRow.Cells[2].Text.ToString();
                Session["IDempresa"] = grid_emp_busca_e.SelectedRow.Cells[1].Text.ToString();
                int id_empresa = int.Parse(Session["IDempresa"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_empresa", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_empresa", id_empresa);
                


                SqlDataAdapter da = new SqlDataAdapter(com);
                //USAR O CODIGO COMENTADO ABAIXO PARA MELHOR DESEMPENHO... TRATAR O CARREGAMENTO DOS DADOS POR PROCEDURE!!
                //Array teste = da.GetFillParameters();  
                //da.Fill(dt_busca);
                da.Fill(retorno_empresa);
                Session["retorno_empresa"] = retorno_empresa;
                Response.Redirect("Empresa.aspx");
            }
        }

        protected void grid_proj_busca_e_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["label_modulo"] = grid_proj_busca_e.SelectedRow.Cells[2].Text.ToString();
                Session["IDprojeto"] = grid_proj_busca_e.SelectedRow.Cells[1].Text.ToString();
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

        protected void grid_cli_busca_e_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["label_modulo"] = grid_cli_busca_e.SelectedRow.Cells[2].Text.ToString();
                Session["IDcliente"] = grid_cli_busca_e.SelectedRow.Cells[27].Text.ToString();
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

        protected void busca_emp_dropestado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (busca_emp_dropestado.SelectedValue != "0")
            {
                busca_emp_dropcidade.DataBind();
                busca_emp_dropcidade.Items.Insert(0, "Escolha a opção");
            }
        }

        protected void Button49_Click(object sender, EventArgs e)
        {           

            int i = 1;
            int id_usuario = int.Parse(Session["IDusuario"].ToString());
            int id_cliente = 1;
            int id_projeto = 0;
            string sessao = "0";
            //if (Session["IDcliente"] != null)
            //{ id_cliente = int.Parse(Session["IDcliente"].ToString()); }
            //else { sessao = "null"; }
            string teste = busca_cli_drop_projeto.SelectedValue;
            if ((busca_cli_drop_projeto.SelectedIndex != 0) && (busca_cli_drop_projeto.SelectedIndex != -1))
            {
                id_projeto = int.Parse(busca_cli_drop_projeto.SelectedValue);
            }
            else { sessao = "null"; }
            string valida = "null";
            
            //ds_busca_empresa = Session["grid_busca_empresa"];
            foreach (GridViewRow row in grid_cli_busca_e.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("cli_check");
                if (cb != null && cb.Checked)
                {
                    string cstr = conexao;
                    using (SqlConnection con = new SqlConnection(cstr))
                    {
                        con.Open();

                        id_cliente = int.Parse(grid_cli_busca_e.DataKeys[row.RowIndex].Value.ToString());
                       
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
                            if (busca_cli_drop_projeto.SelectedIndex != 0)
                            {
                                com.ExecuteNonQuery();
                                valida = rowCount.Value.ToString();
                                if (valida != sessao)
                                    if (id_projeto != 0)
                                    {
                                        mensagem_busca_cli.Text = "vínculo feito com sucesso!";
                                        rowcount_cliente.Text = "";
                                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito com sucesso!')");
                                        cb.Checked = false;
                                    }
                                    else
                                    {
                                        mensagem_busca_cli.Text = "vínculo feito sem sucesso!";
                                        rowcount_cliente.Text = "";
                                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito sem sucesso!')"); 
                                    }
                            }
                            else 
                            {
                                mensagem_busca_cli.Text = "vínculo feito sem sucesso!";
                                rowcount_cliente.Text = "";
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito sem sucesso!')"); 
                            }
                        }

                        catch (SqlException exc)
                        {
                            if (exc.Message.Contains("UNIQUE KEY constraint"))
                            {
                                mensagem_busca_cli.Text = "vínculo feito sem sucesso!";
                                rowcount_cliente.Text = "";
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito sem sucesso!')"); 
                            }
                        }

                        //valida = rowCount.Value.ToString();
                        //if (valida != "0")
                        //{
                        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('vínculo feito com sucesso!')");
                        //}
                    }
                    
                    //Session["grid_busca_empresa"]
                    //DataRow rowDel = ds_busca_empresa.Tables[0].Rows[row.RowIndex];
                    //rowDel.Delete();
                    //ds_busca_empresa.Tables[1].Rows[row.RowIndex].Delete();
                    //grid_emp_busca_e.DeleteRow(row.RowIndex);
                    //grid_emp_busca_e.DataBind();
                    //grid_emp_busca_e.Rows[row.RowIndex].Dispose();
                    //sqlAdap.Update(ds_busca_empresa.Tables[0]);
                }
            }
        }

        protected void Button50_Click(object sender, EventArgs e)
        {
            busca_empresa();
        }

        protected void busca_cli_radio_projetos_SelectedIndexChanged(object sender, EventArgs e)
        {
            busca_cli_drop_projeto.DataBind();
            busca_cli_drop_projeto.Items.Insert(0, "Escolha a opção");
        }

        /*protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_cli_busca_e.DataSource = dt_busca;
            grid_cli_busca_e.PageIndex = e.NewPageIndex;
            grid_cli_busca_e.DataBind();
        }*/


                /*
                try
                {
                    if (proj_produto_textnome.Text.ToString() != comp)
                        if (proj_produto_droptipo.SelectedValue.ToString() != compddl)
                        {
                            if (idempresa == "")
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa da lista ou cadastre uma nova!')");
                            }
                            else
                            {
                                string sqll = "Select nome from bc_empresa_unq where " + @idempresa + "= id";
                                SqlDataAdapter daa = new SqlDataAdapter(sqll, conexao);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                string hidenfield = "";
                                hidenfield = dt.Rows[0]["nome"].ToString();
                                if (proj_produto_empresa.Text == hidenfield)
                                {
                                    com.ExecuteNonQuery();
                                    id_empresa.Value = "";
                                    valida = rowCount.Value.ToString();
                                }
                                else { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('escolha uma empresa da lista ou cadastre uma nova!')"); }
                                if (valida != "0")
                                {
                                    Session["IDcliente"] = rowCount.Value;
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                                }
                            }
                            //LIMPAR CAMPOS!!!
                        }
                }

                catch (SqlException exc)
                {
                    if (exc.Message.Contains("UNIQUE KEY constraint"))
                    { Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito sem sucesso!')"); }
                }

                valida = rowCount.Value.ToString();
                if (valida != "0")
                {
                    Session["IDprojeto"] = rowCount.Value;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('cadastro feito com sucesso!')");
                }*/
            }
        }
       
