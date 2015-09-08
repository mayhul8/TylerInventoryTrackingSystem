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
    public partial class AddWorker : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["DepartmentSelect"] = ddlItemDepartment.Text;

            string strSQL = "SELECT DepartmentName FROM [Tyler.Department]";
            DataSet myDS = objDB.GetDataSet(strSQL);
            ddlItemDepartment.DataSource = myDS;
            ddlItemDepartment.DataTextField = "DepartmentName";
            ddlItemDepartment.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool admin = false;

            if (chkIsAdmin.Checked)
            {
                admin = true;
            }

            string strSQL = "INSERT INTO [Tyler.Worker] (WorkerFirstName, WorkerLastName, WorkerTUID, WorkerEmail, WorkerPhone, WorkerDepartment, WorkerIsAdmin) VALUES ('" + txtFName.Text + "','" + txtLName.Text + "','" + txtTUID.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + Session["DepartmentSelect"].ToString() + "','" + admin + "')";
            objDB.DoUpdate(strSQL);
        }
    }
}