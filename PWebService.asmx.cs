using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
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
    /// <summary>
    /// Summary description for PWebService
    /// Este módulo contempla funções utilizadas pelo Ajax para fazer a ação de auto-complete em determinados controles
    /// O ideal é que esse módulo todo caia em desuso pois, é necessário que se utilize apenas uma única biblioteca java para todos os scripts
    /// </summary>
    [System.Web.Script.Services.ScriptService()]
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    
        public class PWebService : System.Web.Services.WebService
    {
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";

        //Método referente ao auto-complete de empresas
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionList(string prefixText, int count)
        {            
            string sql = "Select id, nome from bc_empresa_unq where nome like '%" + prefixText + "%'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conexao);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr[1].ToString(), i);
                i++;
            }
            return items;
        }

        //Método referente ao auto-complete de graduação
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionListGraduacao(string prefixText, int count)
        {
            string sql = "Select id, descricao from br_graduacao where descricao like '%" + prefixText + "%'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conexao);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr[1].ToString(), i);
                i++;
            }
            return items;
        }

        //Método referente ao auto-complete de empresa no módulo projeto
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionListProjeto(string prefixText, int count)
        {
            List<string> names = new List<string>();
            string cstr = conexao;
            using (SqlConnection conn = new SqlConnection(cstr))
            {
                SqlCommand cmd = new SqlCommand("Select id, nome from bc_empresa_unq where nome like '%" + prefixText + "%'", conn);
                cmd.CommandType = CommandType.Text;
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (reader["nome"].ToString(),
                            reader["id"].ToString());
                        names.Add(item);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return names.ToArray();
        }        

        //Método referente ao auto-complete de empresas concorrentes no módulo empresa

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionListConcorrentes(string prefixText, int count)
        {
            List<string> names = new List<string>();
            string cstr = conexao;
            using (SqlConnection conn = new SqlConnection(cstr))
            {
                SqlCommand cmd = new SqlCommand("Select id, nome from bc_empresa_unq where nome like '%" + prefixText + "%'", conn);
                cmd.CommandType = CommandType.Text;
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (reader["nome"].ToString(),
                            reader["id"].ToString());
                        names.Add(item);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return names.ToArray();
        }

        //Método referente ao auto-complete de graduação no módulo Projeto

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionListProjetoGraduacao(string prefixText, int count)
        {
            List<string> names = new List<string>();
            string cstr = conexao;
            using (SqlConnection conn = new SqlConnection(cstr))
            {
                SqlCommand cmd = new SqlCommand("Select id, descricao from br_graduacao where descricao like '%" + prefixText + "%' order by descricao", conn);
                cmd.CommandType = CommandType.Text;
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (reader["descricao"].ToString(), reader["id"].ToString());
                        names.Add(item);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return names.ToArray();
        }

        //Método referente ao auto-complete de empresas no módulo Cliente
        
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionListCliente(string prefixText, int count)
        {
            List<string> names = new List<string>();
            string cstr = conexao;
            using (SqlConnection conn = new SqlConnection(cstr))
            {
                SqlCommand cmd = new SqlCommand("Select id, nome from bc_empresa_unq where nome like '%" + prefixText + "%'", conn);
                cmd.CommandType = CommandType.Text;
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (reader["nome"].ToString(),
                            reader["id"].ToString());
                        names.Add(item);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return names.ToArray();
        }

        //Método referente ao auto-complete de graduação no módulo Cliente

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionListClienteGraduacao(string prefixText, int count)
        {
            List<string> names = new List<string>();
            string cstr = conexao;
            using (SqlConnection conn = new SqlConnection(cstr))
            {
                SqlCommand cmd = new SqlCommand("Select id, descricao from br_graduacao where descricao like '%" + prefixText + "%' order by descricao", conn);
                cmd.CommandType = CommandType.Text;
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (reader["descricao"].ToString(), reader["id"].ToString());
                        names.Add(item);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return names.ToArray();
        }

        //Método referente ao auto-complete de empresas no módulo Cliente

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionListClienteEmpresa(string prefixText, int count)
        {
            List<string> names = new List<string>();
            string cstr = conexao;
            using (SqlConnection conn = new SqlConnection(cstr))
            {
                SqlCommand cmd = new SqlCommand("Select id, nome from bc_empresa_unq where nome like '%" + prefixText + "%'", conn);
                cmd.CommandType = CommandType.Text;
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (reader["nome"].ToString(),
                            reader["id"].ToString());
                        names.Add(item);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return names.ToArray();
        }

    }
}
