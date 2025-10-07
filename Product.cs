using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace June27Demo
{
    internal class Product
    {
        private string productName;
        private int productRating; //From 1-10

        public Product()
        {

        }
        public Product(string productName, int productRating)
        {
            this.productName = productName;
            this.productRating = productRating;
        }

        public string ProductName { get => productName; set => productName = value; }
        public int ProductRating { get => productRating; set => productRating = value; }
    }
}
