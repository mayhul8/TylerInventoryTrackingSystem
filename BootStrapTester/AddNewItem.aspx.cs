using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Utilities;
using System.Data.SqlClient;

namespace BootStrapTester
{
    public partial class AddNewItem : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sqlDepartment = "SELECT * FROM [Tyler.Department] WHERE IsDeactive = 'false'";
                ddlItemDepartment.DataSource = objDB.GetDataSet(sqlDepartment);
                ddlItemDepartment.DataTextField = "DepartmentName";
                ddlItemDepartment.DataValueField = "DepartmentName";
                ddlItemDepartment.DataBind();

            }

            ShowCategories(ddlItemDepartment.SelectedValue);
        }

        protected void ddlItemDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowCategories(ddlItemDepartment.SelectedValue);
        }

        public void ShowCategories(String departent)
        {
            ddlItemCategory.DataSource = null;
            ddlItemCategory.DataBind();
            string sqlCategory = "SELECT * FROM [Tyler.Category] WHERE DepartmentName = '" + departent + "' AND IsDeactive = 'false'";
            ddlItemCategory.DataSource = objDB.GetDataSet(sqlCategory);
            ddlItemCategory.DataTextField = "CategoryName";
            ddlItemCategory.DataValueField = "CategoryName";
            ddlItemCategory.DataBind();
        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            string sqlDepartmentID = "SELECT DepartmentID FROM [Tyler.Department] WHERE DepartmentName = '" + ddlItemDepartment.SelectedValue + "'";
            string sqlCategoryID = "SELECT CategoryID FROM [Tyler.Category] WHERE CategoryName = '" + ddlItemCategory.SelectedValue + "'";

            DataSet dsDepartmentID = objDB.GetDataSet(sqlDepartmentID);
            DataSet dsCategoryID = objDB.GetDataSet(sqlCategoryID);

            foreach (DataTable table in dsDepartmentID.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    if (row["DepartmentID"].ToString() != "")
                    {
                        Session["DepartmentID"] = row["DepartmentID"];
                    }
                }
            }
            foreach (DataTable table in dsCategoryID.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    if (row["CategoryID"].ToString() != "")
                    {
                        Session["CategoryID"] = row["CategoryID"];
                    }
                }
            }

            String addItem = "INSERT INTO [Tyler.Item] (ItemNumber, ItemSerialNumber, ItemName, DepartmentID, CategoryID, ItemDesc, ItemLateFee, ItemReplaceCost) VALUES ('" + int.Parse(txtItemNumber.Text) + "', '" + txtSerialNumber.Text + "', '" + txtName.Text + "', '" + Session["DepartmentID"] + "', '" + Session["CategoryID"] + "', '" + txtComment.Text + "', '" + txtInputLateFee.Text + "', '" + txtInputReplaceFee.Text + "')";
            objDB.DoUpdate(addItem);
        }
    }
}