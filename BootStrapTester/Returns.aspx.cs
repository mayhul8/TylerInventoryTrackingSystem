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
    public partial class Returns : System.Web.UI.Page
    {
        ConsumerDetails consumer = new ConsumerDetails();
        ArrayList consumerList = new ArrayList();

        ItemDetails items = new ItemDetails();
        ArrayList itemList = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["return"] == null)
            {

            }
            else
            {
                returnItem();
            }
        }
        public class ConsumerDetails
        {
            string lName = "";
            string templeID;

            public string LastName
            {
                get { return lName; }
                set { lName = value; }
            }
            public string TUID
            {
                get { return templeID; }
                set { templeID = value; }
            }
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            consumer.LastName = txtLName.Text;
            consumer.TUID = txtTUID.Text;

            consumerList.Add(consumer);

            gvConsumers.DataSource = consumerList;
            gvConsumers.DataBind();
        }

        protected void gvConsumers_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtLName.Visible = false;
            txtTUID.Visible = false;
            lblName.Visible = false;
            lblTUID.Visible = false;
            btnSearch.Visible = false;
            gvConsumers.Visible = false;

            btnReturn.Visible = true;

            lblNameTitle.Text = "The items found for " + txtLName.Text;

            items.SearchSerialNumber = "2352";
            items.SearchItemName = "Nikon Camera";
            items.SearchDepartment = "Photography";
            items.SearchCategory = "Camera";

            itemList.Add(items);
            ItemDetails items2 = new ItemDetails();

            items2.SearchSerialNumber = "7955";
            items2.SearchItemName = "Blue Glittery Paint";
            items2.SearchDepartment = "Painting";
            items2.SearchCategory = "Paint";

            itemList.Add(items2);

            gvItems.DataSource = itemList;
            gvItems.DataBind();
        }

        public void returnItem()
        {
            txtLName.Visible = false;
            txtTUID.Visible = false;
            lblName.Visible = false;
            lblTUID.Visible = false;
            btnSearch.Visible = false;
            gvConsumers.Visible = false;

            lblNameTitle.Text = "The items found for Bob";
            lblNameTitle.Visible = true;

            items.SearchSerialNumber = "2352";
            items.SearchItemName = "Nikon Camera";
            items.SearchDepartment = "Photography";
            items.SearchCategory = "Camera";

            itemList.Add(items);
            ItemDetails items2 = new ItemDetails();

            items2.SearchSerialNumber = "7955";
            items2.SearchItemName = "Blue Glittery Paint";
            items2.SearchDepartment = "Painting";
            items2.SearchCategory = "Paint";

            itemList.Add(items2);

            gvItems.DataSource = itemList;
            gvItems.DataBind();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        

    }
}