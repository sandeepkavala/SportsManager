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
    public partial class Photos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "2")
            {
                Response.Redirect("~/Login.aspx");
            }

        }

        protected void EnterData(object sender, EventArgs e)
        {
            try
            {
                string filename;
                string path = Server.MapPath("~/eventphotos/");
                filename = "no photo";
                if (Photo.HasFile)
                {
                    filename = "~/eventphotos/" + Photo.FileName;

                    Photo.SaveAs(path + Photo.FileName);

                }
                SqlConnection CompCon = new SqlConnection(ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString);



                SqlCommand inPhoto = new SqlCommand("INSERT INTO PHOTO(EventPhoto,EventPhotoTags,EventID) VALUES (@Photo, @Tags,@EventID)", CompCon);
                inPhoto.Parameters.AddWithValue("@Photo", filename);
                inPhoto.Parameters.AddWithValue("@Tags", PhotoTags.Text);
                inPhoto.Parameters.AddWithValue("@EventID", EventList.SelectedValue);
                CompCon.Open();
                inPhoto.ExecuteNonQuery();
                CompCon.Close();
                Response.Redirect("~/Photos.aspx");
            }
            catch (Exception ex)
            {

            }
        }
    }
}