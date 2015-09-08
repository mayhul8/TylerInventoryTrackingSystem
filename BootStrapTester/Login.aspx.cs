using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Utilities;

namespace BootStrapTester
{
    public partial class Login : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();
        string strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (txtEmail.Text == "" || txtPassword.Text == "")
            {
                lblError.Text = "Please Fill in both Email and Password Boxes";
                   
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
        }
    }
}