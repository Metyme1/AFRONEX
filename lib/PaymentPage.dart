import 'package:flutter/material.dart';
import 'book.dart';

class PaymentPage extends StatelessWidget {
  final List<Book> cartItems;

  PaymentPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Page',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Selected Books',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final book = cartItems[index];
                  return Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          book.imagePath,
                          width: 80.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          book.title,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Expiration Date',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'CVV',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Implement payment processing logic here
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
