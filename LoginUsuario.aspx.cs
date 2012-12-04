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
    public partial class LoginUsuario : System.Web.UI.Page
    {
        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.Title = "Kivah System";
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();
                SqlCommand com = new SqlCommand("sp_vw_usuario_logesenha", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlCommand grava = new SqlCommand("sp_log_usuario", con);
                grava.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@login", Login1.UserName);
                com.Parameters.AddWithValue("@senha", Login1.Password);

                //using (SqlDataReader reader = com.ExecuteReader())
                DataTable reader;
                reader = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(reader);
                string idusuario;
                string cargo;
                if (reader.Rows.Count == 0)
                {
                    idusuario = "";
                    cargo = "";
                }
                else
                {
                    cargo = reader.Rows[0]["cargo"].ToString(); 
                    idusuario = reader.Rows[0]["id"].ToString();
                }                            
               
                                            
                if (idusuario != "")
                {e.Authenticated = true;
                Session["IDusuario"] = idusuario;
                Session["cargo"] = cargo;
                grava.Parameters.AddWithValue("@usuario", int.Parse(Session["IDusuario"].ToString()));
                grava.Parameters.AddWithValue("@status", "login");
                grava.ExecuteNonQuery();
                }
                else{e.Authenticated = false;}
                con.Close();
            }
                
                //DataTable table;
                //table = new DataTable();
                //table.Load(com.ExecuteReader());
                               

            }

        }
    }
