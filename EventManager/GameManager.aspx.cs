using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EventManager
{

    public partial class GameManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "1")
            {
                Response.Redirect("~/Login.aspx");
            }

            CodeTest.Visible = false;
            IDTest1.Visible = false;
           
        }

        protected void EnterData(object sender, EventArgs e)
        {
            try
            {
                SqlConnection CodeCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
                CodeCon.Open();
                string checkCode = "Select count(*) from [Game] where GameCode ='" + GameCode.Text + "'";
                string checkID = "Select count(*) from [Game] where GameID ='" + GameID1.Text + "'";
                SqlCommand IDCom = new SqlCommand(checkID, CodeCon);
                SqlCommand CodeCom = new SqlCommand(checkCode, CodeCon);
                string IDExist = IDCom.ExecuteScalar().ToString();
                string codeExist = CodeCom.ExecuteScalar().ToString();
                CodeCon.Close();
                int tempCode = Convert.ToInt32(codeExist);
                int IDCode = Convert.ToInt32(IDExist);
                if (tempCode == 1)
                {
                    CodeTest.Visible = true;

                }
                if (IDCode == 1)
                {
                    IDTest1.Visible = true;
                }
                if (tempCode == 0 && IDCode == 0)
                {
                    if (CodeTest.Visible)
                    {
                        CodeTest.Visible = false;
                    }
                    if (IDTest1.Visible)
                    {
                        IDTest1.Visible = false;
                    }
                    enterIntoDB();
                }
            }
            catch(Exception ex)
            {

            }

        }

        void cleartext()
        {
            GameCode.Text = "";
            GameName.Text = "";
            GameDuration.Text = "";
            GameDescription.Text = "";
        }

        protected void GameCode_TextChanged(object sender, EventArgs e)
        {
         
        }
        void enterIntoDB()
        {
            string filename;
            string path = Server.MapPath("~/rules/");
            filename = "no rules";
            if (GameRules.HasFile)
            {
                filename = "~/rules/" + GameRules.FileName;

                GameRules.SaveAs(path + GameRules.FileName);

            }
            try
            {


                SqlConnection GameCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
                SqlCommand inData = new SqlCommand("INSERT INTO GAME(GameID,GameCode,GameName,GameDuration,GameDescription,GameRules) VALUES (@ID,@Code,@Name,@Duration,@Description,@Rules)", GameCon);
                inData.Parameters.AddWithValue("@ID", GameID1.Text);
                inData.Parameters.AddWithValue("@Code", GameCode.Text);
                inData.Parameters.AddWithValue("@Name", GameName.Text);
                inData.Parameters.AddWithValue("@Duration", GameDuration.Text);
                inData.Parameters.AddWithValue("@Description", GameDescription.Text);
                inData.Parameters.AddWithValue("@Rules", filename);
                GameCon.Open();
                inData.ExecuteNonQuery();
                GameCon.Close();
                cleartext();
            }
            catch (Exception ex)
            {

            }
        }
    }
}