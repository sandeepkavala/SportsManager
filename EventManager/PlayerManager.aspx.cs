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
    public partial class PlayerManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "1")
            {
                Response.Redirect("~/Login.aspx");
            }
            CompIDTest.Visible = false;
            EmailTest.Visible = false;
            PlayTest.Visible = false;
        }

        protected void EnterData(object sender, EventArgs e)
        {
            try
            {
                SqlConnection CodeCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
                CodeCon.Open();
                string checkEmail = "Select count(*) from [Competitor] where CompEmail ='" + Email.Text + "'";
                string checkID = "Select count(*) from [Competitor] where CompID ='" + CompID.Text + "'";
                string checkPlay = "Select count(*) from [Plays] where GameID ='" + DropDownList2.SelectedValue + "' AND CompID = '" + CompID.Text + "'";
                SqlCommand IDCom = new SqlCommand(checkID, CodeCon);
                SqlCommand CodeCom = new SqlCommand(checkEmail, CodeCon);
                SqlCommand PlayCom = new SqlCommand(checkPlay, CodeCon);
                string IDExist = IDCom.ExecuteScalar().ToString();
                string emailExist = CodeCom.ExecuteScalar().ToString();
                string playExist = PlayCom.ExecuteScalar().ToString();
                CodeCon.Close();
                int EmailCode = Convert.ToInt32(emailExist);
                int IDCode = Convert.ToInt32(IDExist);
                int PlayCode = Convert.ToInt32(playExist);
                if (EmailCode == 1)
                {
                    EmailTest.Visible = true;

                }
                if (IDCode == 1)
                {
                    CompIDTest.Visible = true;
                }
                if (PlayCode == 1)
                {
                    PlayTest.Visible = true;
                }
                if (EmailCode == 0 && IDCode == 0 && PlayCode == 0)
                {
                    if (EmailTest.Visible)
                    {
                        EmailTest.Visible = false;
                    }
                    if (CompIDTest.Visible)
                    {
                        CompIDTest.Visible = false;
                    }
                    if (PlayTest.Visible)
                    {
                        PlayTest.Visible = false;
                    }
                    enterintoComp();
                }
            }
            catch(Exception ex)
            {

            }

        }

        protected void Email_TextChanged(object sender, EventArgs e)
        {

        }

        void enterintoComp()
        {
            string filename;
            string path = Server.MapPath("~/playerphotos/");
            filename = "no rules";
            if (Photo.HasFile)
            {
                filename = "~/playerphotos/" + Photo.FileName;

                Photo.SaveAs(path + Photo.FileName);

            }
            try
            {

                SqlConnection CompCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);

                SqlCommand inData = new SqlCommand("INSERT INTO COMPETITOR(CompID,CompSalutation,CompName,CompDOB,CompEmail,CompDescription,CompCountry,CompGender,CompContact,CompWebsite,CompPhoto) VALUES (@ID,@Sal,@Name,@DOB,@Email,@Description,@Country,@Gender,@Contact,@Website,@Photo)", CompCon);
                inData.Parameters.AddWithValue("@ID", CompID.Text);
                inData.Parameters.AddWithValue("@Sal", DropDownList3.SelectedValue);
                inData.Parameters.AddWithValue("@Name", CompName.Text);
                inData.Parameters.AddWithValue("@DOB", DOB.Text);
                inData.Parameters.AddWithValue("@Email", Email.Text);
                inData.Parameters.AddWithValue("@Description", CDescription.Text);
                inData.Parameters.AddWithValue("@Country", Country.Text);
                inData.Parameters.AddWithValue("@Gender", DropDownList1.SelectedValue);
                inData.Parameters.AddWithValue("@Contact", Contact.Text);
                inData.Parameters.AddWithValue("@Website", Website.Text);
                inData.Parameters.AddWithValue("@Photo", filename);

                SqlCommand inPlay = new SqlCommand("INSERT INTO PLAYS(GameID,CompID) VALUES (@GameID, @CompID)", CompCon);
                inPlay.Parameters.AddWithValue("@GameID", DropDownList2.SelectedValue);
                inPlay.Parameters.AddWithValue("@CompID", CompID.Text);
                CompCon.Open();
                inData.ExecuteNonQuery();
                inPlay.ExecuteNonQuery();
                CompCon.Close();
                clearText();
                Response.Redirect("~/PlayerManager.aspx");
            }
            catch(Exception ex)
            {

            }
        }
        void clearText()
        {

        }
    }
}