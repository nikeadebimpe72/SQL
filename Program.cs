using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace June27Demo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*
            int num;
            num = 10;

            string name = "Luis";

            int[] intArray = new int[4];

            intArray[0] = 10;
            intArray[1] = 20;
            intArray[2] = 30;
            intArray[3] = 40;

            //Displaying arrays (1 dim) = 1 For-loop 
            for(int i = 0; i < intArray.Length; i++) {

                Console.WriteLine(intArray[i]);

            }

            Console.WriteLine("----------------------------");

            //Foreach?
            foreach(int element in intArray)
            {
                Console.WriteLine(element);
            }
            */

            /*
            Customer myCustomer = new Customer();
            myCustomer.CustomerID = "CUST-0001";

            string[] myProducts = new string[3];
            myProducts[0] = "Laptop";
            myProducts[1] = "Smartphone";
            myProducts[2] = "PlayStation";

            myCustomer.Products = myProducts; //This is the critical part (making the connection)

            foreach( string tempElement  in myCustomer.Products)
            {
                Console.WriteLine("The product is " + tempElement);
            }

            Console.WriteLine(myCustomer.Products.GetHashCode());
            Console.WriteLine(myProducts.GetHashCode());
            */

            Customer myNewCustomer = new Customer();
            myNewCustomer.CustomerID = "CUST-0001";

            Product[] myProducts = new Product[3];

            Product prod1 = new Product("Laptop",9);
            Product prod2 = new Product("Smarpthone", 6);
            Product prod3 = new Product("PlayStation", 7);

            //Making first references (from prod1,prod2,prod3 to myProducts array)
            myProducts[0] = prod1;
            myProducts[1] = prod2;
            myProducts[2] = prod3;

            myNewCustomer.Products = myProducts;

            Console.WriteLine(myNewCustomer.Products[1].ProductName);

            // 2 dimension arrays
            int[,] matrix = new int[5,5];

            //matrix[2, 2] = 10;
            //Displaying arrays (2 dim) = 2 nested For-loop 

            //Random numbers
            Random random = new Random();

            int numberRows = matrix.GetLength(0);
            int numberCols = matrix.GetLength(1);
            int numberElements = matrix.Length;

            Console.WriteLine("Number of Rows: " + numberRows);
            Console.WriteLine("Number of Columns: " + numberCols);
            Console.WriteLine("Number of Elements: " + numberElements);

            //int posI = int.Parse(Console.ReadLine()); //111100000000
            //int posJ = int.Parse(Console.ReadLine());

            //matrix[posI, posJ] = 10; 

            //Walking around the rows
            for(int i = 0; i < numberRows;i++)
            {
                //For each row, I'm walking around the rows
                for (int j = 0;j < numberCols; j++)
                {
                    int newRandomNumber = random.Next(100);

                    if (i == j)
                    {
                        matrix[i, j] = -1;
                    }
                    else
                    {
                        matrix[i, j] = newRandomNumber;
                    }

                    
                }
            }

            //Displaying the entire matrix
            for (int i = 0; i < numberRows; i++)
            {
                //For each row, I'm walking around the rows
                for (int j = 0; j < numberCols; j++)
                {
                    Console.Write(matrix[i, j]+"\t");
                }
                Console.WriteLine();
            }



            Console.ReadKey();

        }
    }
}
