using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSLibrary
{
    public class ItemDetails
    {
        string serial = "";
        string itemName = "";
        string depart = "";
        string category = "";
        string dueDate = "";
        string itemPrice = "";
        string lateFee = "";
        string itemnumber = "";

        public string ItemNumber
        {
            get { return itemnumber; }
            set { itemnumber = value; }
        }
        public string SerialNumber
        {
            get { return serial; }
            set { serial = value; }
        }
        public string ItemName
        {
            get { return itemName; }
            set { itemName = value; }
        }
        public string Department
        {
            get { return depart; }
            set { depart = value; }
        }
        public string Category
        {
            get { return category; }
            set { category = value; }
        }
        public string DueDate
        {
            get { return dueDate; }
            set { dueDate = value; }
        }
        public string ItemPrice
        {
            get { return itemPrice; }
            set { itemPrice = value; }
        }
        public string LateFee
        {
            get { return lateFee; }
            set { lateFee = value; }
        }

    }
}
