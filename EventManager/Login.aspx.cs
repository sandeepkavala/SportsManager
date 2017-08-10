using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace EventManager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
                Session["UserName"] = "";
                Session["UserType"] = "";
            
            
        }

        protected void UserLogin(object sender, EventArgs e)
        {
            SqlConnection LoginCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
            LoginCon.Open();
            string checkuser = "Select count(*) from [Login] where UserEmail ='" + UserEmail.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, LoginCon);
            string test = com.ExecuteScalar().ToString();
            //int temp = Convert.ToInt32(com.ExecuteNonQuery().ToString());
            int temp = Convert.ToInt32(test);
            LoginCon.Close();
            if(temp==1)
            {
                LoginCon.Open();
                string checkpassword = "Select UserPassword from Login where UserEmail = '" + UserEmail.Text + "'";
                SqlCommand passCom = new SqlCommand(checkpassword, LoginCon);
                string passcheck = passCom.ExecuteScalar().ToString().Replace(" ","");
                LoginCon.Close();

                if(passcheck == Password.Text)
                {
                    LoginCon.Open();
                    string UserRole = "Select UserType from Login where UserEmail ='" + UserEmail.Text + "'";
                    SqlCommand roleCheck = new SqlCommand(UserRole, LoginCon);
                    string roleTest = roleCheck.ExecuteScalar().ToString();
                    int roletype = Convert.ToInt32(roleTest);
                    LoginCon.Close();
                    if(roletype==1)
                    {
                        
                        Session["ÜserName"] = "Admin";
                        Session["UserType"] = "1";
                        Response.Redirect("~/AdminHome.aspx");

                    }
                    if(roletype==2)
                    {
                        
                        Session["ÜserName"] = "Event";
                        Session["UserType"] = "2";
                        Response.Redirect("~/EventHome.aspx");
                    }

                }
             

            }
            else
            {
                LoginFail.Text = "Invalid Username and Passowrd";
            }


        }
    }
}