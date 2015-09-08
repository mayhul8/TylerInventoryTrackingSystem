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
    public partial class ItemHistory : System.Web.UI.Page
    {

        ItemDetails items = new ItemDetails();
        ArrayList itemList = new ArrayList();

        ArrayList historyList = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnItemSearch_Click(object sender, EventArgs e)
        {
            divSearchItem.Visible = true;

            items.SearchSerialNumber = txtSerial.Text;
            items.SearchItemName = txtItemName.Text;
            items.SearchDepartment = ddlItemDepartment.Text;
            items.SearchCategory = ddlCategory.Text;

            itemList.Add(items);

            gvItems.DataSource = itemList;
            gvItems.DataBind();
        }

        public class ItemDetails
        {
            string serial = "";
            string itemName = "";
            string depart = "";
            string category = "";
            string dueDate = "";
            string itemPrice = "";
            string lateFee = "";

            public string SearchSerialNumber
            {
                get { return serial; }
                set { serial = value; }
            }
            public string SearchItemName
            {
                get { return itemName; }
                set { itemName = value; }
            }
            public string SearchDepartment
            {
                get { return depart; }
                set { depart = value; }
            }
            public string SearchCategory
            {
                get { return category; }
                set { category = value; }
            }
            public string SearchDueDate
            {
                get { return dueDate; }
                set { dueDate = value; }
            }
            public string SearchItemPrice
            {
                get { return itemPrice; }
                set { itemPrice = value; }
            }
            public string SearchLateFee
            {
                get { return lateFee; }
                set { lateFee = value; }
            }

        }

        public class HistoryDetails
        {
            string tuID = "";
            string worker = "";
            string startDate = "";
            string endDate = "";
            string notes = "";

            public string TUIDSet
            {
                get { return tuID; }
                set { tuID = value; }
            }
            public string WorkerSet
            {
                get { return worker; }
                set { worker = value; }
            }
            public string StartDateSet
            {
                get { return startDate; }
                set { startDate = value; }
            }
            public string EndDateSet
            {
                get { return endDate; }
                set { endDate = value; }
            }
            public string NotesSet
            {
                get { return notes; }
                set { notes = value; }
            }
        }
        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCategory.Visible = false;
            lblDepartment.Visible = false;
            lblItemName.Visible = false;
            lblSerial.Visible = false;
            txtItemName.Visible = false;
            txtSerial.Visible = false;
            ddlCategory.Visible = false;
            ddlItemDepartment.Visible = false;
            btnItemSearch.Visible = false;
            gvItems.Visible = false;

            lblSelectedItem.Text = "Details for " + txtItemName.Text;

            HistoryDetails history = new HistoryDetails();
            history.TUIDSet = "789456123";
            history.WorkerSet = "Pablo";
            history.StartDateSet = "01/20/2014";
            history.EndDateSet = "01/21/2014";
            history.NotesSet = "Missing SD card";

            HistoryDetails history1 = new HistoryDetails();
            history1.TUIDSet = "741852963";
            history1.WorkerSet = "Clark";
            history1.StartDateSet = "10/20/2014";
            history1.EndDateSet = "10/24/2014";
            history1.NotesSet = "N/A";

            HistoryDetails history2 = new HistoryDetails();
            history2.TUIDSet = "147852369";
            history2.WorkerSet = "Clark";
            history2.StartDateSet = "11/2/2014";
            history2.EndDateSet = "11/3/2014";
            history2.NotesSet = "N/A";

            HistoryDetails history3 = new HistoryDetails();
            history3.TUIDSet = "321456987";
            history3.WorkerSet = "Pablo";
            history3.StartDateSet = "01/10/2015";
            history3.EndDateSet = "01/11/2015";
            history3.NotesSet = "Chipped near shutter";

            historyList.Add(history);
            historyList.Add(history1);
            historyList.Add(history2);
            historyList.Add(history3);

            gvHistory.DataSource = historyList;
            gvHistory.DataBind();

            btnAgain.Visible = true;
        }

        protected void btnAgain_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemHistory.aspx");
        }
    }
}