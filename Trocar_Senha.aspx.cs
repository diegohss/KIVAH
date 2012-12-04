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
    public partial class Trocar_Senha : System.Web.UI.Page
    {
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        
        protected void Page_Load(object sender, EventArgs e)
        {    
       
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
            //Essa função efetua a alteação da senha, e conferência da mesma

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
                con.Close();
            }
        }
    }
}