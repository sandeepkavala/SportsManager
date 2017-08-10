using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace EventManager
{
    public partial class Plays : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "1")
            {
                Response.Redirect("~/Login.aspx");
            }
            Playcheck.Visible = false;
        }

        protected void EnterPlays(object sender, EventArgs e)
        {
            SqlConnection CodeCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
            CodeCon.Open();
            string checkCode = "Select count(*) from [Plays] where GameID ='" + GameList.SelectedValue + "' AND CompID = '" + PlayerList.SelectedValue + "'";


            SqlCommand CodeCom = new SqlCommand(checkCode, CodeCon);

            string codeExist = CodeCom.ExecuteScalar().ToString();
            CodeCon.Close();
            int tempCode = Convert.ToInt32(codeExist);

            if (tempCode == 1)
            {
                Playcheck.Visible = true;

            }
            if (tempCode == 0)
            {
                if (Playcheck.Visible)
                {
                    Playcheck.Visible = false;
                }

                enterintoDB();
            }

        }

        void enterintoDB()
        {
            SqlConnection GameCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
            SqlCommand inData = new SqlCommand("INSERT INTO PLAYS(GameID,CompID) VALUES (@GameID,@CompID)", GameCon);
            inData.Parameters.AddWithValue("@GameID", GameList.SelectedValue);
            inData.Parameters.AddWithValue("@CompID", PlayerList.SelectedValue);
    
            GameCon.Open();
            inData.ExecuteNonQuery();
            GameCon.Close();
            Response.Redirect("Plays.aspx");
        }
    }
}