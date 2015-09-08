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
    public partial class EditWorker : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            gvWorkers.DataSource = null;

            if (!IsPostBack)
            {
                string strSQL = "SELECT * FROM [Tyler.Worker]";
                DataSet myDS = objDB.GetDataSet(strSQL);
                gvWorkers.DataSource = myDS;
                gvWorkers.DataBind();
            }
        }

        protected void btnSelect_Click1(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            gvWorkers.Visible = false;
            lbltuID.Visible = true;
            txttuID.Visible = true;
            lblFname.Visible = true;
            txtFname.Visible = true;
            lblLname.Visible = true;
            txtLname.Visible = true;
            lblPhone.Visible = true;
            txtPhone.Visible = true;
            chkIsAdmin.Visible = true;
            lblEmail.Visible = true;
            txtEmail.Visible = true;
            lblDepartment.Visible = true;
            ddlDepartment.Visible = true;
            btnSubmit.Visible = true;

            string strSQL = "SELECT * FROM [Tyler.Department]";
            DataSet myDS = objDB.GetDataSet(strSQL);

            ddlDepartment.DataSource = myDS;
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataBind();

            Session["WorkerSelect"] = gvr.Cells[1].Text;
            string strSQL2 = "SELECT * FROM [Tyler.Worker] WHERE WorkerID='" + Session["WorkerSelect"].ToString() + "'";
            DataSet myDS2 = objDB.GetDataSet(strSQL2);

            txtFname.Text = myDS2.Tables[0].Rows[0]["WorkerFirstName"].ToString();
            txtLname.Text = myDS2.Tables[0].Rows[0]["WorkerLastName"].ToString();
            txttuID.Text = myDS2.Tables[0].Rows[0]["WorkerTUID"].ToString();
            txtPhone.Text = myDS2.Tables[0].Rows[0]["WorkerPhone"].ToString();
            txtEmail.Text = myDS2.Tables[0].Rows[0]["WorkerEmail"].ToString();
            if (Convert.ToBoolean(myDS2.Tables[0].Rows[0]["WorkerIsAdmin"].ToString()) == true)
                chkIsAdmin.Checked = true;

            // SET DEPARTMENT TO RETURNED VALUE

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool isAdmin = false;
            if(chkIsAdmin.Checked)
                isAdmin = true;

            string strSQL = "UPDATE [Tyler.Worker] SET WorkerFistName='" + txtFname.Text + "', WorkerLastName='" + txtLname.Text + "', WorkerTUID='" + txttuID.Text + "', WorkerEmail='" + txtEmail.Text + "', WorkerPhone='" + txtPhone.Text + "', WorkerDepartment='" + ddlDepartment.Text + "', WorkerIsAdmin='" + isAdmin + "'"; 
            objDB.DoUpdate(strSQL);
        }
        
    }
}