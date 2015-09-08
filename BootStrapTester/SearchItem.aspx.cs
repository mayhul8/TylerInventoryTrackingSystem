using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Utilities;

namespace BootStrapTester
{
    public partial class SearchItem : System.Web.UI.Page
    {
        ItemsDetails item = new ItemsDetails();
        ArrayList ItemsList = new ArrayList();
        DBConnect objDB = new DBConnect();
        string strSQL = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            DBConnect dbobj = new DBConnect();


            String strSQL = "SELECT DISTINCT CategoryID FROM [Tyler.Item]";
            DataSet myDS = dbobj.GetDataSet(strSQL);
            ddlCategory.DataSource = myDS;
            ddlCategory.DataTextField = "CategoryID";
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataBind();


        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int serialNumber = int.Parse(txtSSerial.Text);

            //IF both category and serial number are selected
            if (ddlCategory.SelectedValue != null && txtSSerial.Text != "")
            {
                DBConnect dbobj = new DBConnect();
                String strSQL = "SELECT * FROM [Tyler.Item] WHERE Category='" + ddlCategory.SelectedValue.ToString() + "' AND ItemNumber ='" + serialNumber + "'";
                DataSet myDS = dbobj.GetDataSet(strSQL);
                gvSItems.DataSource = myDS;
                gvSItems.DataBind();
            }
            //otherwise search by category
            else
            {
                DBConnect dbobj = new DBConnect();
                String strSQL = "SELECT * FROM [Tyler.Item] WHERE Category='" + ddlCategory.SelectedValue.ToString() + "'";
                DataSet myDS = dbobj.GetDataSet(strSQL);
                gvSItems.DataSource = myDS;
                gvSItems.DataBind();
            }
        }

        public class ItemsDetails
        {
            string category = "";
            long serial;
            
            public string Category
            {
                get { return category; }
                set { category = value; }
            }
            public long SNumber
            {
                get { return serial; }
                set { serial = value; }
            }
        }

        protected void gvSItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSCategory.Visible = false;
            txtSSerial.Visible = false;
            lblSCategory.Visible = false;
            lblSSerial.Visible = false;
            btnSearch.Visible = false;
            gvSItems.Visible = false;

            txtSerial.Visible = true;
            txtItemName.Visible = true;
            lblSerial.Visible = true;
            lblItemName.Visible = true;
            lblDepartment.Visible = true;
            ddlItemDepartment.Visible = true;
            lblCategory.Visible = true;
            ddlCategory.Visible = true;
            btnComplete.Visible = true;
            lblComment.Visible = true;
            txtComment.Visible = true;
            lblFees.Visible = true;
                InputLateFee.Visible = true;
                InputReplaceFee.Visible = true;

        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {

            strSQL = "UPDATE [Tyler.Item] SET ItemSerialNumber='" + txtSerial.Text + "', ItemName='" + txtItemName.Text + "', DepartmentID='" + ddlItemDepartment.SelectedValue.ToString() + "', CategoryID='" + ddlSCategory.SelectedValue.ToString() + "', ItemLateFee='" + InputLateFee.Text + "', ItemReplaceCost='" + InputReplaceFee.Text + "', ItemNotes='" + txtComment.Text + "' WHERE ItemSerialNumber='" + Session["SerialNumber"].ToString() + "'";
            objDB.DoUpdate(strSQL);
            Response.Redirect("SearchItem.aspx");
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            Session["SerialNumber"] = gvr.Cells[2].Text;
        }


    }
}