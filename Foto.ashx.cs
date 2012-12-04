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
    /// <summary>
    /// Summary description for Foto
    /// A classe desempenha o papel de através de uma requisição, retornar a foto do cliente salva no banco de dados
    /// </summary>
    public class Foto : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        
        //Função que processa o requerimento enviado pelo controle da foto do módulo Cliente
        public void ProcessRequest(HttpContext context)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                //Consulta o banco de dados, e retorna o conteúdo da foto em bytes, da tabela bc_cli_base_cvs
                string strQuery = "SELECT nome_arquivo, tipo_arquivo, dados FROM bc_cli_base_cvs where id_cliente=@id_cliente and idioma=@idioma";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@id_cliente", int.Parse(context.Session["IDcliente"].ToString()));
                cmd.Parameters.Add("@idioma", 9);
                DataTable dt = GetData(cmd);
                if ((dt != null) && (dt.Rows.Count != 0))
                {
                    Byte[] foto = (Byte[])dt.Rows[0]["dados"];
                    if (foto != null && foto.Length > 0)
                    {
                        //escreve o conteúdo da foto no contexto
                        context.Response.ContentType = "image/jpeg";
                        context.Response.BinaryWrite(foto);
                    }
                }
                con.Close();
            }
        }

        //Função que recolhe os dados de um comando SQL e armazena em uma DataTable para retorno
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}