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
    public partial class AddStudent : System.Web.UI.Page
    {
        Consumer newUser = new Consumer();
        DBConnect objDB = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                newUser.FirstName = txtFName.Text;
                newUser.LastName = txtLName.Text;
                newUser.TUID = txtTUID.Text;
                newUser.Email = txtEmail.Text;
                newUser.Phone = txtPhone.Text;
                newConsumers(newUser);

                if (Session["transactionType"] != null)
                {
                    Response.Redirect("Transaction.aspx");
                }
                else
                {
                    Response.Redirect("HomePage.aspx");
                }
            }
        }

        
        public void newConsumers(Consumer user)
        {
            String strSQL = "INSERT INTO [Tyler.Consumer] (ConsumerFirstName, ConsumerLastName, ConsumerTUID, ConsumerEmail, ConsumerPhone) VALUES ('" + user.FirstName + "','" + user.LastName + "','" + user.TUID + "','" + user.Email + "','" + user.Phone + "')";
            objDB.DoUpdate(strSQL);
        }
    }
}