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
    public partial class AddCategory : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        DataSet myDS = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Department"] = ddlDepartment.Text;

            string strSQL = "SELECT DepartmentName FROM [Tyler.Department] WHERE isDeactive='False'";
            myDS = objDB.GetDataSet(strSQL);

            ddlDepartment.DataSource = myDS;
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtNewCategory.Text != "")
            {
                string strSQL = "INSERT INTO [Tyler.Category] (DepartmentName, CategoryName) VALUES ('" + Session["Department"].ToString() + "','" + txtNewCategory.Text + "')";
                objDB.DoUpdate(strSQL);
            }
        }
    }
}