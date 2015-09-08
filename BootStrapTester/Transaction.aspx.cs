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
    public partial class Purchase : System.Web.UI.Page
    {
        int departmentID = 2;
        string departmentName = "Photography";
        DBConnect objDB = new DBConnect();
        bool isPurchase = false;
        bool isBorrow = false;
        Consumer consumer = new Consumer();
        ArrayList consumerList = new ArrayList();

        ItemDetails item = new ItemDetails();
        ArrayList itemList = new ArrayList();
        ArrayList itemNumberList = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            divConsumerList.Visible = false;
            divBorrowHeader.Visible = true;
            divReviewCart.Visible = false;
            divSearchItem.Visible = false;
            string purchase = Request.Form["btnPurchase"];
            string borrow = Request.Form["btnBorrow"];
            string type = Request.QueryString["type"];
            if (type != null)
            {
                if (type == "purchase")
                {
                    Session["transactionType"] = "purchase";
                }
                else if (type == "borrow")
                {
                    Session["transactionType"] = "borrow";
                }
            }
            else
            {
                if (purchase != null)
                {
                    isPurchase = true;
                    Session["transactionType"] = "purchase";
                }
                else if (borrow != null)
                {
                    isBorrow = true;
                    Session["transactionType"] = "borrow";
                }
            }
            string transactionType = Session["transactionType"].ToString();
            if (transactionType == "purchase")
            {
                lblPurchaseBorrow.Text = "Purchase";
            }
            else if (transactionType == "borrow")
            {
                lblPurchaseBorrow.Text = "Borrow";
            }
            loadCategories();
            loadDepartment();
        }
        public void loadDepartment()
        {
            DataSet ds = new DataSet();
            ds = getDepartments();
            ddlItemDepartment.DataSource = ds;
            ddlItemDepartment.DataTextField = "DepartmentName";
            ddlItemDepartment.DataValueField = "DepartmentID";
            ddlItemDepartment.DataBind();
            ddlItemDepartment.Items.FindByValue(departmentID.ToString()).Selected = true;
        }
        public DataSet getDepartments()
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Department] WHERE isDeactive = 'False'";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }
        public void loadCategories()
        {
            DataSet ds = new DataSet();
            ds = getCategories();
            ddlCategory.DataSource = ds;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--- Select a Category ---", "0"));
            ddlCategory.SelectedIndex = 0;
        }
        public DataSet getCategories()
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Category] WHERE DepartmentName = '" + departmentName + "' AND isDeactive = 'False'";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            divConsumerList.Visible = true;

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
            gvConsumers.DataSource = ds;
            gvConsumers.DataBind();
        }

        public DataSet getConsumersByTUID(string tuid)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerTUID Like '%" + tuid + "%' AND isDeactive = 'False' Order by ConsumerLastName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }

        public DataSet getConsumersByName(string last, string first)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Consumer] WHERE (ConsumerLastName Like '%" + last + "%' or ConsumerFirstName Like '%" + first + "%') AND isDeactive = 'False' Order by ConsumerLastName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }


        protected void gvConsumers_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblChangingHeader.Text = " Search for an item";
            divSearchConsumer.Visible = false;
            gvConsumers.Visible = false;
            divSearchItem.Visible = true;
        }

        //public DataSet getItems(int itemnumber, string itemname, int departmentid, int categoryid)
        //{
        //    DataSet ds = new DataSet();
        //    String strSQL = "SELECT * FROM [Tyler.Item] WHERE ItemNumber = " + itemnumber + " AND ItemName Like '" + itemname + "%' AND DepartmentID = " + departmentid + " AND CategoryID = " + categoryid + " Order by ItemName ASC";
        //    int count = 0;
        //    ds = objDB.GetDataSet(strSQL, out count);
        //    Response.Write(count);
        //    return ds;
        //}

        //public DataSet getItems(int itemnumber, string itemname, int departmentid)
        //{
        //    DataSet ds = new DataSet();
        //    String strSQL = "SELECT * FROM [Tyler.Item] WHERE ItemNumber = " + itemnumber + " AND ItemName Like '%" + itemname + "%' AND DepartmentID = " + departmentid + " Order by ItemName ASC";
        //    int count = 0;
        //    ds = objDB.GetDataSet(strSQL, out count);
        //    return ds;
        //}

        //public DataSet getItemsNumbCatag(int itemnumber, int departmentid, int categoryid)
        //{
        //    DataSet ds = new DataSet();
        //    String strSQL = "SELECT * FROM [Tyler.Item] WHERE ItemNumber = " + itemnumber + " AND DepartmentID = " + departmentid + " AND CategoryID = " + categoryid + " Order by ItemName ASC";
        //    int count = 0;
        //    ds = objDB.GetDataSet(strSQL, out count);
        //    return ds;
        //}

        public DataSet getItemsNameCatag(string itemname, int departmentid, int categoryid)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Item] WHERE AND ItemName Like '%" + itemname + "%' AND DepartmentID = " + departmentid + " AND CategoryID = " + categoryid + " AND isDeactive = 'False' Order by ItemName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }

        public DataSet getItemsName(string itemname, int departmentid)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Item] WHERE ItemName Like '%" + itemname + "%' AND DepartmentID = " + departmentid + " AND isDeactive = 'False' Order by ItemName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }

        public DataSet getItemsCatag(int departmentid, int itemcatagory)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Item] WHERE AND CategoryID = " + itemcatagory + "' AND DepartmentID = " + departmentid + " AND isDeactive = 'False' Order by ItemName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }

        //public DataSet getItemsNumb(int itemnumber, int departmentid)
        //{
        //    DataSet ds = new DataSet();
        //    String strSQL = "SELECT * FROM [Tyler.Item] WHERE AND ItemNumber = " + itemnumber + "' AND DepartmentID = " + departmentid + " Order by ItemName ASC";
        //    int count = 0;
        //    ds = objDB.GetDataSet(strSQL, out count);
        //    return ds;
        //}

        //public DataSet getItems(int departmentid)
        //{
        //    DataSet ds = new DataSet();
        //    String strSQL = "SELECT * FROM [Tyler.Item] WHERE DepartmentID = " + departmentid + " Order by ItemName ASC";
        //    int count = 0;
        //    ds = objDB.GetDataSet(strSQL, out count);
        //    return ds;
        //}

        public DataSet getItemsByNumber(int itemnumber)
        {
            DataSet ds = new DataSet();
            String strSQL = "SELECT * FROM [Tyler.Item] WHERE ItemNumber = " + itemnumber + " AND isDeactive = 'False' Order by ItemName ASC";
            int count = 0;
            ds = objDB.GetDataSet(strSQL, out count);
            return ds;
        }

        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnCheckout.Visible = true;
            divSearchItem.Visible = true;

            string itemname = gvItems.SelectedRow.Cells[2].Text.ToString();
            string itemnumber = gvItems.SelectedRow.Cells[1].Text.ToString();

            item.ItemName = itemname;
            item.ItemNumber = itemnumber;

            itemList.Add(item);
            //itemNumberList.Add(item);

            gvCart.DataSource = itemList;
            gvCart.DataBind();


        }

        protected void btnItemSearch_Click(object sender, EventArgs e)
        {
            divSearchItem.Visible = true;
            string search = hdnSearchItem.Value;
            DataSet ds = new DataSet();
            if (search == "number")
            {
                int itemnumber = Int32.Parse(txtItemNo.Text);

                ds = getItemsByNumber(itemnumber);

            }
            else if (search == "details")
            {
                string itemname = txtItemName.Text;
                int itemdepartment = Int32.Parse(ddlItemDepartment.SelectedValue.ToString());
                int itemcategory = Int32.Parse(ddlCategory.SelectedValue.ToString());

                if (itemname != "" && itemcategory != 0)
                {
                    ds = getItemsNameCatag(itemname, itemdepartment, itemcategory);
                }
                else if (itemname != "" && itemcategory == 0)
                {
                    ds = getItemsName(itemname, itemdepartment);
                }
                else if (itemname == "" && itemcategory != 0)
                {
                    ds = getItemsCatag(itemdepartment, itemcategory);
                }
            }
            gvItems.DataSource = ds;
            gvItems.DataBind();
        }


        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            lblChangingHeader.Text = " Review before checkout";
            for (int row = 0; row < gvCart.Rows.Count; row++)
            {
                item.ItemName = gvCart.Rows[row].Cells[0].Text;
                item.DueDate = "01/01/90";
                item.ItemPrice = "$10";
                item.LateFee = "$1";

                itemList.Add(item);
            }

            gvReviewCart.DataSource = itemList;
            gvReviewCart.DataBind();

            divSearchItem.Visible = false;
            divItemsList.Visible = false;
            divShoppingCart.Visible = false;
            divReviewCart.Visible = true;


        }

        protected void btnCheckOutFinal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOutReceipt.aspx");
        }
    }
}