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
    public partial class _Default : System.Web.UI.Page
    {
        DataSet retorno_cliente = new DataSet();
        DataSet retorno_projeto = new DataSet();

        string conexao = "Data Source=SERVIDOR01\\DB_HAVIK;Initial Catalog=havik;Persist Security Info=True;User ID=sistema;Password=Xpt0_k1v_001";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Dentro do Page_Load estão os procedimentos que alimentam o que chamamos de Home do sistema, 
            //de acordo com o cargo de cada usuário
            
            Page.Header.Title = "Kivah System - Home";
                        
            //NAVEGAÇÃO ENTRE AS VIEWS DE CADA USUÁRIO
            
            int index = 0;
            if (Session["cargo"] != null)
            {
                //HOME DE RESEARCHER
                
                if (Session["cargo"].ToString() == "r1")
                {
                    home_views.ActiveViewIndex = index;
                    home_researcher_grid_1.DataBind();
                    home_researcher_grid_2.DataBind();
                }
                //HOME DE CONSULTOR TRAINEE
                
                if (Session["cargo"].ToString() == "r2")
                {
                    index = 1;
                    home_views.ActiveViewIndex = index;
                    home_researcher2_grid_1.DataBind();
                    home_researcher2_grid_2.DataBind();
                }
                //HOME DE CONSULTOR
                
                if (Session["cargo"].ToString() == "consultor")
                {
                    index = 2;
                    home_views.ActiveViewIndex = index;
                    home_consultor_grid_1.DataBind();
                    home_consultor_grid_2.DataBind();
                }
                // HOME DE ASSOCIADO E PARTNERS
                
                if (Session["cargo"].ToString() == "partner")
                {
                    index = 3;
                    home_views.ActiveViewIndex = index;
                    home_partner_grid_1.DataBind();
                    home_partner_grid_2.DataBind();
                }
                //HOME DE COORDENADOR DE PROCESSOS 

                if (Session["cargo"].ToString() == "coordenador")
                {
                    index = 4;
                    home_views.ActiveViewIndex = index;
                    home_coordenador_grid_1.DataBind();
                    home_coordendor_grid_2.DataBind();
                }
                //HOME DE ASSISTENTE OPERACIONAL
                
                if (Session["cargo"].ToString() == "assistente")
                {
                    index = 5;
                    home_views.ActiveViewIndex = index;
                    home_assistente_grid_1.DataBind();
                    home_assistente_grid_2.DataBind();
                }
            }
            else { Response.Redirect("LoginUsuario.aspx"); }
        }               
        
        protected void home_researcher_grid_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um cliente "clicado" no grid de clientes da home do researcher

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDcliente"] = home_researcher_grid_1.SelectedRow.Cells[1].Text.ToString();
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_cliente);
                Session["retorno_cliente"] = retorno_cliente;
                con.Close();
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void home_coordenador_grid_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um cliente "clicado" no grid de clientes da home do coordenador
            
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDcliente"] = home_coordenador_grid_1.SelectedRow.Cells[1].Text.ToString();
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_cliente);
                Session["retorno_cliente"] = retorno_cliente;
                con.Close();
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void home_researcher2_grid_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um cliente "clicado" no grid de clientes da home do consultor trainee
            
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDcliente"] = home_researcher2_grid_1.SelectedRow.Cells[1].Text.ToString();
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_cliente);
                Session["retorno_cliente"] = retorno_cliente;
                con.Close();
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void home_researcher_grid_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um projeto "clicado" no grid de projetos da home do researcher
            
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDprojeto"] = home_researcher_grid_2.SelectedRow.Cells[2].Text.ToString();
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);



                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_projeto);
                Session["retorno_projeto"] = retorno_projeto;
                con.Close();
                Response.Redirect("Projeto.aspx");
            }
        }

        protected void home_researcher2_grid_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um projeto "clicado" no grid de projetos da home
            //do consultor trainee
            
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDprojeto"] = home_researcher2_grid_2.SelectedRow.Cells[2].Text.ToString();
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);                

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_projeto);
                Session["retorno_projeto"] = retorno_projeto;
                con.Close();
                Response.Redirect("Projeto.aspx");
            }
        }

        protected void home_coordendor_grid_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um projeto "clicado" no grid de projetos da home
            //do coordenador
            
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDprojeto"] = home_coordendor_grid_2.SelectedRow.Cells[2].Text.ToString();
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);



                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_projeto);
                Session["retorno_projeto"] = retorno_projeto;
                con.Close();
                Response.Redirect("Projeto.aspx");
            }
        }

        protected void home_partner_grid_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um projeto "clicado" no grid de projetos da home
            //de associados e partners
            
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDprojeto"] = home_partner_grid_2.SelectedRow.Cells[2].Text.ToString();
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);



                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_projeto);
                Session["retorno_projeto"] = retorno_projeto;
                con.Close();
                Response.Redirect("Projeto.aspx");
            }
        }

        protected void home_partner_grid_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                //O método realiza o carregamento dos dados de um cliente "clicado" no grid de clientes da home
                //dos associados e partners
                
                con.Open();

                Session["IDcliente"] = home_partner_grid_1.SelectedRow.Cells[1].Text.ToString();
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_cliente);
                Session["retorno_cliente"] = retorno_cliente;
                con.Close();
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void home_consultor_grid_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um projeto "clicado" no grid de projetos da home de consultor
            
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDprojeto"] = home_consultor_grid_2.SelectedRow.Cells[2].Text.ToString();
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);



                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_projeto);
                Session["retorno_projeto"] = retorno_projeto;
                con.Close();
                Response.Redirect("Projeto.aspx");
            }
        }

        protected void home_consultor_grid_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                //O método realiza o carregamento dos dados de um cliente "clicado" no grid de clientes da home de consultor
                
                con.Open();

                Session["IDcliente"] = home_consultor_grid_1.SelectedRow.Cells[1].Text.ToString();
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_cliente);
                Session["retorno_cliente"] = retorno_cliente;
                con.Close();
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void home_assistente_grid_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //O método realiza o carregamento dos dados de um projeto "clicado" no grid de projetos da home
            //do assistente operacional

            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                con.Open();

                Session["IDprojeto"] = home_assistente_grid_2.SelectedRow.Cells[2].Text.ToString();
                int id_projeto = int.Parse(Session["IDprojeto"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_projeto", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_projeto", id_projeto);



                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_projeto);
                Session["retorno_projeto"] = retorno_projeto;
                con.Close();
                Response.Redirect("Projeto.aspx");
            }
        }

        protected void home_assistente_grid_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cstr = conexao;
            using (SqlConnection con = new SqlConnection(cstr))
            {
                //O método realiza o carregamento dos dados de um cliente "clicado" no grid de clientes da home
                //do assistente operacional
                
                con.Open();

                Session["IDcliente"] = home_assistente_grid_1.SelectedRow.Cells[1].Text.ToString();
                int id_cliente = int.Parse(Session["IDcliente"].ToString());

                SqlCommand com = new SqlCommand("sp_retorno_cliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@id_cliente", id_cliente);

                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(retorno_cliente);
                Session["retorno_cliente"] = retorno_cliente;
                con.Close();
                Response.Redirect("Cliente.aspx");
            }
        }
    }
}
