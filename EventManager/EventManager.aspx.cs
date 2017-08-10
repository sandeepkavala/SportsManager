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
    public partial class EventManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "2")
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {

                EventStartTime.Text = DateTime.Now.ToString("HH:mm");
            }
            EventCheck.Visible = false;
        }

        protected void EnterData(object sender, EventArgs e)
        {
            try
            {

                SqlConnection CodeCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);
                CodeCon.Open();
                string checkEvent = "Select count(*) from [Event] where EventID ='" + EventID.Text + "'";

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

                    enterintoEvent();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void EventStartTime_TextChanged(object sender, EventArgs e)
        {

        }
        void enterintoEvent()
        {
            try
            {
                string filename;
                string path = Server.MapPath("~/eventphotos/");
                filename = "no photo";
                if (EventPhoto.HasFile)
                {
                    filename = "~/eventphotos/" + EventPhoto.FileName;

                    EventPhoto.SaveAs(path + EventPhoto.FileName);

                }
                SqlConnection CompCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);

                SqlCommand inData = new SqlCommand("INSERT INTO Event(EventID,GameID,FeatureEvent,EventVenue,EventDate,EventStartTime,EventEndTime,EventDescription,WorldRecord) VALUES (@EventID,@GameID,@Feature,@Venue,@Date,@Start,@End,@Description,@Record)", CompCon);
                inData.Parameters.AddWithValue("@EventId", EventID.Text);
                inData.Parameters.AddWithValue("@GameID", GameIDList.SelectedValue);
                inData.Parameters.AddWithValue("@Feature", FeatureEvent.Text);
                inData.Parameters.AddWithValue("@Venue", EventVenue.Text);
                inData.Parameters.AddWithValue("@Date", EventDate.Text);
                inData.Parameters.AddWithValue("@Start", EventStartTime.Text);
                inData.Parameters.AddWithValue("@End", EventEndTime.Text);
                inData.Parameters.AddWithValue("@Description", EventDescription.Text);
                inData.Parameters.AddWithValue("@Record", WorldRecord.Text);

                SqlCommand inPlay = new SqlCommand("INSERT INTO PHOTO(EventPhoto,EventPhotoTags,EventID) VALUES (@Photo, @Tags,@EventID)", CompCon);
                inPlay.Parameters.AddWithValue("@Photo", filename);
                inPlay.Parameters.AddWithValue("@Tags", PhotoTags.Text);
                inPlay.Parameters.AddWithValue("@EventID", EventID.Text);
                CompCon.Open();
                inData.ExecuteNonQuery();
                inPlay.ExecuteNonQuery();
                CompCon.Close();
                Response.Redirect("~/EventManager.aspx");
            }
            catch (Exception ex)
            {

            }
        }
    }
}