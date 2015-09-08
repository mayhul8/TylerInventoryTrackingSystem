using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Utilities;
using IMSLibrary;

namespace BootStrapTester
{
    public partial class ConsumerHistory : System.Web.UI.Page
    {

        Consumer consumer = new Consumer();
        ArrayList consumerList = new ArrayList();
        DBConnect objDB = new DBConnect();
        ArrayList consumerHistoryList = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            string lname = Request.Form["txtLastName"];
            string tuid = Request.Form["txtTUID"];
            string fname = Request.Form["txtFirstName"];
            string search = Request.Form["hdnSearch"];

            DataSet ds = new DataSet();
            if (search == "tuid")
            {
                ds = getConsumersByTUID(tuid);
            }
            else if (search == "name")
            {
                ds = getConsumersByName(lname, fname);
            }
            gvConsumer.DataSource = ds;
            gvConsumer.DataBind();
        }

        public DataSet getConsumersByTUID(string tuid)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerTUID Like '%" + tuid + "%' Order by ConsumerLastName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }

        public DataSet getConsumersByName(string last, string first)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Consumer] WHERE (ConsumerLastName Like '%" + last + "%' or ConsumerFirstName Like '%" + first + "%') Order by ConsumerLastName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }
        public DataSet getConsumersHistory(string tuid)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Consumer_Item] WHERE ConsumerTUID = " + tuid + " Order by ItemCheckOutDate ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }
        protected void btnAgain_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsumerHistory.aspx");
        }

        protected void gvConsumers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tuid = gvConsumer.SelectedRow.Cells[1].Text.ToString();
            DataSet ds = new DataSet();
            ds = getConsumersHistory(tuid);
            gvHistory.DataSource = ds;
            gvHistory.DataBind();
        }
    }
}
