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
    
    
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Dentro do Page_Load é tratado apenas a alimentação dos Labels que exibem a mensagem de saudação e localização do usuário no sistema
            string idusuario = "";
            string saudacao = "";
            if (Session["IDusuario"] != null)
            { idusuario = Session["IDusuario"].ToString(); 
            string sql = "Select nome_usuario from bc_usuario where " + @idusuario + "= id";
            SqlDataAdapter da = new SqlDataAdapter(sql, conexao);
            DataTable dt = new DataTable();
            da.Fill(dt);
            saudacao = dt.Rows[0]["nome_usuario"].ToString();
            }
            label_usuario.Text = "Olá " + saudacao + ",";

            //A sessao label_modulo é alimentada no Page_Load de cada módulo, modificando seu conteúdo conforme o usuário navega no sistema
            
            string modulo = "";
            if (Session["label_modulo"] != null)
            {
                modulo = Session["label_modulo"].ToString();
                label_estado.Text = modulo;
            }
        }
        
        //Essa função efetua a ação de logout do usuário
        protected void Button2_Click(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                //o procedimento abaixo, registra no banco a ação de logout
                con.Open();
                SqlCommand grava = new SqlCommand("sp_log_usuario", con);
                grava.CommandType = CommandType.StoredProcedure;

                if (Session["IDusuario"] != null)
                { grava.Parameters.AddWithValue("@usuario", int.Parse(Session["IDusuario"].ToString())); }
                else { grava.Parameters.AddWithValue("@usuario", 1); }
                grava.Parameters.AddWithValue("@status", "logout");
                grava.ExecuteNonQuery();                
                con.Close();
            }           
                        
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("LoginUsuario.aspx");
        }
    }
}
