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
    public partial class EditStudent : System.Web.UI.Page
    {
        /*public override void VerifyRenderingInServerForm(Control control)
        {
             Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time.
        }*/
        DBConnect objDB = new DBConnect();
        string strSQL = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEmail.Visible = false;
            lblFname.Visible = false;
            lblLname.Visible = false;
            lbltuID.Visible = false;
            gvConsumers.DataSource = null;
            gvConsumers.Visible = false;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            strSQL = "UPDATE [Tyler.Consumer] SET ConsumerFirstName='" + txtFname.Text + "', ConsumerLastName='" + txtLname.Text + "', ConsumerTUID='" + txttuID.Text + "', ConsumerEmail='" + txtEmail.Text + "' WHERE ConsumerID='" + Session["ConsumerSelect"].ToString() + "'";
            objDB.DoUpdate(strSQL);

            Response.Redirect("EditConsumer.aspx");
        }

        protected void btnFindStudent_Click(object sender, EventArgs e)
        {
            

            if(txtSearchFName.Text == "" && txtSearchLName.Text == "" && txtSearchTUID.Text == "")
            {
                strSQL = "SELECT * FROM [Tyler.Consumer]";
            }
            else if (txtSearchLName.Text == "" && txtSearchTUID.Text == "")
            {
                // IF ONLY FIRST NAME IS SEARCHED
                strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerFirstName LIKE '%" + txtSearchFName.Text + "%'";
            }
            else if (txtSearchFName.Text == "" && txtSearchTUID.Text == "")
            {
                // IF ONLY LAST NAME IS SEARCHED
                strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerLastName LIKE '%" + txtSearchLName.Text + "%'";
            }
            else if (txtSearchFName.Text == "" && txtSearchLName.Text == "")
            {
                // IF ONLY TUID IS SEARCHED
                strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerTUID LIKE '%" + txtSearchTUID.Text + "%'";
            }
            else if (txtSearchFName.Text == "" && txtSearchLName.Text == "")
            {
                // IF FIRST NAME AND TUID ARE SEARCHED
                strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerFirstName LIKE '%" + txtSearchFName.Text + "%' AND ConsumerTUID LIKE '%" + txtSearchTUID.Text + "%'";
            }
            else if (txtSearchFName.Text == "" && txtSearchLName.Text == "")
            {
                // IF LAST NAME TUID ARE SEARCHED
                strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerLastName LIKE '%" + txtSearchLName.Text + "%' AND ConsumerTUID LIKE '%" + txtSearchTUID.Text + "%'";
            }
            else if (txtSearchFName.Text == "" && txtSearchLName.Text == "")
            {
                // IF FIRST NAME AND LAST NAME IS SEARCHED
                strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerFirstName LIKE '%" + txtSearchFName.Text + "%' AND ConsumerLastName LIKE '%" + txtSearchLName.Text + "%'";
            }
            else
            {
                // IF ALL ARE SEARCHED
                strSQL = "SELECT * FROM [Tyler.Consumer] WHERE ConsumerFirstName LIKE '%" + txtSearchFName.Text + "%' AND ConsumerLastName LIKE '%" + txtSearchLName.Text + "%' AND ConsumerTUID LIKE '%" + txtSearchTUID.Text + "%'";
            }

            DataSet myDS = objDB.GetDataSet(strSQL);

            gvConsumers.DataSource = myDS;
            gvConsumers.DataBind();
            gvConsumers.Visible = true;
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            Session["ConsumerSelect"] = gvr.Cells[1].Text;

            txtFname.Text = gvr.Cells[2].Text;
            txtLname.Text = gvr.Cells[3].Text;
            txttuID.Text = gvr.Cells[4].Text;
            txtEmail.Text = gvr.Cells[5].Text;

            btnFindStudent.Visible = false;
            txtSearchFName.Visible = false;
            lblSearchFName.Visible = false;
            txtSearchLName.Visible = false;
            lblSearchLName.Visible = false;
            txtSearchTUID.Visible = false;
            lblSearchTUID.Visible = false;

            lblEmail.Visible = true;
            lblFname.Visible = true;
            lblLname.Visible = true;
            lbltuID.Visible = true;
            txtEmail.Visible = true;
            txtFname.Visible = true;
            txtLname.Visible = true;
            txttuID.Visible = true;
            btnComplete.Visible = true;

        }
    }
}