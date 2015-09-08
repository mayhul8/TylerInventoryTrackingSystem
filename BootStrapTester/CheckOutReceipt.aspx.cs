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
    public partial class CheckOutReceipt : System.Web.UI.Page
    {
        ItemDetails items = new ItemDetails();
        ArrayList itemList = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            items.SearchItemName = "Nikon Camera DSLR";
            items.SearchDueDate = "01/01/90";
            items.SearchItemPrice = "$10";
            items.SearchLateFee = "$1";
            items.ItemAccessories = "32mb SD card, shoulder strap";
            items.ItemComments = "Lense previously cracked";

            itemList.Add(items);

            gvFinal.DataSource = itemList;
            gvFinal.DataBind();
        }


        public class ItemDetails
        {
            string serial = "";
            string itemName = "";
            string accessories = "";
            string comments = "";
            string dueDate = "";
            string itemPrice = "";
            string lateFee = "";
        public string SearchSerialNumber
            {
                get { return serial; }
                set { serial = value; }
            }
            public string SearchItemName
            {
                get { return itemName; }
                set { itemName = value; }
            }
            public string ItemAccessories
            {
                get { return accessories; }
                set { accessories = value; }
            }
            public string ItemComments
            {
                get { return comments; }
                set { comments = value; }
            }
            public string SearchDueDate
            {
                get { return dueDate; }
                set { dueDate = value; }
            }
            public string SearchItemPrice
            {
                get { return itemPrice; }
                set { itemPrice = value; }
            }
            public string SearchLateFee
            {
                get { return lateFee; }
                set { lateFee = value; }
            }

        }
    }
}