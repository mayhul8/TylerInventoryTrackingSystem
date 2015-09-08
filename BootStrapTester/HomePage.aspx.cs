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
    public partial class HomePage : System.Web.UI.Page
    {
        DueBack dueToday = new DueBack();
        ArrayList dueList = new ArrayList();
        DateTime today = DateTime.Now;
        string date = DateTime.Now.ToShortDateString();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dsDueToday = new DataSet();
            dsDueToday = getDueBacks();
            gvDueBacks.DataSource = dsDueToday;
            gvDueBacks.DataBind();


            DataSet dsPastDue = new DataSet();
            dsPastDue = getPastDue();
            gvPastDue.DataSource = dsPastDue;
            gvPastDue.DataBind();
        }

        public DataSet getDueBacks()
        {
            DBConnect objDB = new DBConnect();
            String strSQL = "SELECT * FROM [Tyler.Consumer_Item] WHERE ItemReturnDate = '" + date + "'";
            int count = 0;

            DataSet ds = objDB.GetDataSet(strSQL, out count);
            dialDueBacks.Value = count.ToString();
            for (int intCount = 0; intCount < ds.Tables[0].Rows.Count; intCount++)
            {

                ds.Tables[0].Rows[intCount][3] = ds.Tables[0].Rows[intCount][3];
            }

            ds.Tables[0].AcceptChanges();
            return ds;
        }
        public DataSet getPastDue()
        {
            DBConnect objDB = new DBConnect();
            String strSQL = "SELECT * FROM [Tyler.Consumer_Item] WHERE ItemReturnDate < '" + date + "'";
            int count = 0;

            DataSet ds = objDB.GetDataSet(strSQL, out count);
            dialPastDue.Value = count.ToString();
            for (int intCount = 0; intCount < ds.Tables[0].Rows.Count; intCount++)
            {
                DateTime codate = DateTime.Parse(ds.Tables[0].Rows[intCount][5].ToString());
                DateTime returnDate = DateTime.Parse(ds.Tables[0].Rows[intCount][6].ToString());
                codate = DateTime.Parse(String.Format("{0:M/d/yyyy}", codate));
                returnDate = DateTime.Parse(String.Format("{0:M/d/yyyy}", returnDate));
                ds.Tables[0].Rows[intCount][5] = codate;
                ds.Tables[0].Rows[intCount][6] = returnDate;
                //Response.Write(codate);
                //Response.Write(returnDate);
            }

            ds.Tables[0].AcceptChanges();
            return ds;
        }
        protected void gvDueBacks_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Returns.aspx");
        }
    }
}