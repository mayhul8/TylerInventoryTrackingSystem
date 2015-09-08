using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSLibrary
{
    public class DueBack
    {
        int id = 0;
        string firstname = "";
        string lastname = "";
        string department = "";
        string itemcategory = "";
        string itemname = "";
        string itemserial = "";

        public int ID
        {
            get { return id; }
            set { id = value; }
        }
        public string FirstName
        {
            get { return firstname; }
            set { firstname = value; }
        }
        public string LastName
        {
            get { return lastname; }
            set { lastname = value; }
        }
        public string Department
        {
            get { return department; }
            set { department = value; }
        }
        public string ItemCategory
        {
            get { return itemcategory; }
            set { itemcategory = value; }
        }
        public string ItemName
        {
            get { return itemname; }
            set { itemname = value; }
        }
        public string ItemSerial
        {
            get { return itemserial; }
            set { itemserial = value; }
        }
    }
}
