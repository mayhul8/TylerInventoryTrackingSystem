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
    public partial class AddDepartment : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtNewDepartment.Text != "" && txtDesc.Text != "")
            {
                string strSQL = "INSERT INTO [Tyler.Department] (DepartmentName, DepartmentDesc) VALUES ('" + txtNewDepartment.Text + "','" + txtDesc.Text + "')";
                objDB.DoUpdate(strSQL);
            }
        }
    }
}