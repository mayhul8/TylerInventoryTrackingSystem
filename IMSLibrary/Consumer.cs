using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSLibrary
{
    public class Consumer
    {
        string lastname;
        string firstname;
        string tuid;
        string email;
        string phone;
        bool isrestricted;
        bool isdeactive;
        bool ismetals;
        decimal metalsfees;
        decimal restrictedfees;

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
        public string TUID
        {
            get { return tuid; }
            set { tuid = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        public bool IsRestricted
        {
            get { return isrestricted; }
            set { isrestricted = value; }
        }
        public bool IsDeactive
        {
            get { return isdeactive; }
            set { isdeactive = value; }
        }
        public bool IsMetals
        {
            get { return ismetals; }
            set { ismetals = value; }
        }
        public decimal MetalsFees
        {
            get { return metalsfees; }
            set { metalsfees = value; }
        }
        public decimal RestrictedFees
        {
            get { return restrictedfees; }
            set { restrictedfees = value; }
        }


    }
}