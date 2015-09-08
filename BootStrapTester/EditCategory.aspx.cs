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
    public partial class EditCategory : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        DataSet myDS = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Department"] = ddlDepartment.Text;
            Session["Category"] = ddlCategory.Text;
            
            if(!IsPostBack)
            {
                string strSQL = "SELECT DepartmentName FROM [Tyler.Department] WHERE isDeactive='False'";
                myDS = objDB.GetDataSet(strSQL);

                ddlDepartment.DataSource = myDS;
                ddlDepartment.DataTextField = "DepartmentName";
                ddlDepartment.DataBind();
            }

            string strSQL2 = "SELECT * FROM [Tyler.Category] WHERE DepartmentName='" + Session["Department"] + "'";
            DataSet myDS2 = objDB.GetDataSet(strSQL2);

            ddlCategory.DataSource = myDS2;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataBind();
        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            string strSQL = "UPDATE [Tyler.Category] SET isDeactive='" + true + "', CategoryLastModified='" + DateTime.Now + "' WHERE CategoryName='" + Session["Category"].ToString() + "'";
            objDB.DoUpdate(strSQL);
            Response.Redirect("EditCategory.aspx");
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            string strSQL = "UPDATE [Tyler.Category] SET isDeactive='" + false + "', CategoryLastModified='" + DateTime.Now + "' WHERE CategoryName='" + Session["Category"].ToString() + "'";
            objDB.DoUpdate(strSQL);
            Response.Redirect("EditCategory.aspx");
        }

    }
}