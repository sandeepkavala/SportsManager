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
    public partial class Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "2")
            {
                Response.Redirect("~/Login.aspx");
            }
            EventCheck.Visible = false;

        }

        protected void EnterData(object sender, EventArgs e)
        {
            try
            {
                SqlConnection CodeCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
                CodeCon.Open();
                string checkEvent = "Select count(*) from [Result] where EventID ='" + EventList.SelectedValue + "' AND CompID = '" + CompList.SelectedValue + "'";

                SqlCommand CodeCom = new SqlCommand(checkEvent, CodeCon);
                string eventExist = CodeCom.ExecuteScalar().ToString();
                CodeCon.Close();
                int EventCode = Convert.ToInt32(eventExist);

                if (EventCode == 1)
                {
                    EventCheck.Visible = true;

                }

                if (EventCode == 0)
                {
                    if (EventCheck.Visible)
                    {
                        EventCheck.Visible = false;
                    }

                    enterintoResults();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void EventList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void EventList_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        void enterintoResults()
        {
            try
            {


                SqlConnection CompCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);

                SqlCommand inPhoto = new SqlCommand("INSERT INTO RESULT(EventID,CompID,CompPosition,CompMedal,WorldRecord) VALUES (@Event, @Comp,@Pos,@Medal,@Record)", CompCon);
                inPhoto.Parameters.AddWithValue("@Event", EventList.SelectedValue);
                inPhoto.Parameters.AddWithValue("@Comp", CompList.SelectedValue);
                inPhoto.Parameters.AddWithValue("@Pos", CompPosition.Text);
                inPhoto.Parameters.AddWithValue("@Medal", Medals.SelectedValue);
                inPhoto.Parameters.AddWithValue("@Record", Record.SelectedValue);
                CompCon.Open();
                inPhoto.ExecuteNonQuery();
                CompCon.Close();
                Response.Redirect("~/Results.aspx");
            }
            catch (Exception ex)
            {

            }
        }
    }
}