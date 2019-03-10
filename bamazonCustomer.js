// Dependencies
const mysql = require("mysql");
const inquirer = require("inquirer");
const dotenv = require("dotenv");

dotenv.config()

// Establishing connnection to server
var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,  
    user: "root",      
    password: "Digital#1",
    database: "bamazon_db"
});

connection.connect(function(err)    {
    console.log("Connected as id = " + connection.threadId);
//    connection.end();
    showProduct();
});

// Display products
function showProduct()  {
    connection.query("SELECT * FROM products", function(err, response)  {
        if (err)    {
            throw err;
        }   else    { 
        for(var i = 0; i < response.length; i++)    {
            console.log("ID: " + response[i].item_id + " | Product: " + response[i].product_name + " | Price: " + response[i].price);
            console.log("\n==================================================================\n");
        }
    }    
        buyProduct();
    })
}

// Purchase products
function buyProduct(answer)   {
    inquirer
        .prompt([
        {    
            name: "productId",
            type: "input",
            message: "What is the ID of the product you want to buy?"
        },
        {
            name: "quantity",
            type: "input",
            message: "How many units would you like to buy?",
            validate: function(value)   {
                if(isNaN(value) === false)  {
                    return true;
            }
                return false;
            }    
        }    
    ])
        .then(function(answer)  {
            connection.query("SELECT * FROM products WHERE ?", { item_id: answer.productId }, function(err, data)   {
                if(err) throw err;
                var id = answer.productId;
                var totalCost = parseInt(data[0].price * answer.quantity);
                var updateQuantity = parseInt(data[0].stock_quantity - answer.quantity);
                    if(answer.quantity > data[0].stock_quantity)    {
                        console.log("Insufficient quantity!");           
                    } else  {
                        updateQuantity--;
                        console.log("You ordered " + answer.quantity + " units of " + id);
                        console.log("\n------------------------------------------------\n");
                        console.log("Your total cost is: " + "$" + totalCost); 
                        connection.query(
                            "UPDATE products SET ? WHERE ?",
                            [
                                {
                                    item_id: answer.productId 
                                },
                                {
                                    stock_quantity: answer.quantity
                                }
                            ]
                        )
                        if (err) throw err;
                            connection.end();
                    }
                })
            })
        }    
        
    

                // function(err)   {
                //      if(err) throw err;
                // }   
//                     if(input.productId >= 0);
//                 return input.productId;
//             })  
//             else {
//                 console.log("I'm sorry. We are currently out of stock with this product.");
//                 connection.end();
//             }
 
// buyProduct();