import 'package:flutter/material.dart';
import 'PaymentPage.dart';
import 'book.dart';


class Cart {
  static List<Book> cartItems = [];

  static void addToCart(Book book) {
    cartItems.add(book);
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
    final total = Cart.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.separated(
        itemCount: Cart.cartItems.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 1.0,
        ),
        itemBuilder: (context, index) {
          final book = Cart.cartItems[index];
          return ListTile(
            leading: Image.asset(
              book.imagePath,
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: Text('\$${book.price.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage(cartItems: Cart.cartItems)),
                );
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}