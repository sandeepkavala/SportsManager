using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace EventManager
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "2")
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }

        protected void EnterData(object sender, EventArgs e)
        {

        }

        protected void ExportPDF_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition",
            "attachment;filename=Reprt.doc");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-word ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView2.AllowPaging = false;
            GridView2.AllowSorting = false;
            GridView2.DataBind();
            GridView2.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();

        }
    }
}