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
    public partial class EditDepartment : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        DataSet myDS = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strSQL = "SELECT DepartmentName FROM [Tyler.Department]";
                myDS = objDB.GetDataSet(strSQL);

                ddlDepartment.DataSource = myDS;
                ddlDepartment.DataTextField = "DepartmentName";
                ddlDepartment.DataBind();
            }
        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            string strSQL = "UPDATE [Tyler.Department] SET isDeactive='" + true + "', DepartmentLastModified='" + DateTime.Now + "' WHERE DepartmentName='" + ddlDepartment.Text + "'";
            objDB.DoUpdate(strSQL);
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            string strSQL = "UPDATE [Tyler.Department] SET isDeactive='" + false + "', DepartmentLastModified='" + DateTime.Now + "' WHERE DepartmentName='" + ddlDepartment.Text + "'";
            objDB.DoUpdate(strSQL);
        }
    }
}