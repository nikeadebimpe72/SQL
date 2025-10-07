using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace June27Demo
{
    internal class Customer
    {
        private string customerID; //CUST-0001
        private Product[] products;

        public Customer()
        {

        }

        public Customer(string customerID, Product[] products)
        {
            this.customerID = customerID;
            this.products = products;
        }

        public string CustomerID { get => customerID; set => customerID = value; }
        internal Product[] Products { get => products; set => products = value; }
    }
}
