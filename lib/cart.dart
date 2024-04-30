import 'package:flutter/material.dart';
import 'package:task/paymentPage.dart';
import 'book.dart';

class Cart {
  static List<Book> cartItems = [];

  static void addToCart(Book book) {
    cartItems.add(book);
  }

  static void removeFromCart(Book book) {
    cartItems.remove(book);
  }

  static double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += item.price;
    }
    return totalPrice;
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color appColor = const Color(0xFF3E2F84);
    final total = Cart.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),

        backgroundColor: appColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: Cart.cartItems.length,
        itemBuilder: (context, index) {
          final book = Cart.cartItems[index];
          return Dismissible(
            key: Key(book.title),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16.0),
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              Cart.removeFromCart(book);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${book.title} removed from cart'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    book.imagePath,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            book.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            '\$${book.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          // Decrease the quantity of the item
                        },
                      ),
                      Text('1'), // This should display the current quantity of the item
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Increase the quantity of the item
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage(cartItems: Cart.cartItems)),
                );
              },
              label: Text('Check Out'),
              icon: Icon(Icons.payment),
              backgroundColor:appColor,
            ),
          ],
        ),
      ),
    );
  }
}