//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:stripe_platform_interface/stripe_platform_interface.dart';
// import 'book.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   Stripe.publishableKey = 'pk_test_51PAt0FRtJBuWWet1NmfBZE0PP03RlafFc3aqlzIGYkW2393B3oc17Y4BoneH2zqz3LFcAXQs0o2U3qCCMDfNM2Dc007qoTA8Y9'; // Replace with your Stripe publishable key
//   runApp(PaymentPage(cartItems: [],));
// }
//
//
//
// class PaymentPage extends StatelessWidget {
//
//   Map<String, dynamic> ? paymentIntent;
//   Future<void> makePayment(BuildContext context) async {
//     try {
//       final paymentIntent = await createPaymentIntent();
//       final paymentSheetParameters = SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentIntent["client_secret"],
//         style: ThemeMode.dark,
//         merchantDisplayName: "Mety",
//       );
//       await Stripe.instance.initPaymentSheet(paymentSheetParameters: paymentSheetParameters);
//       await displayPaymentSheet(context);
//     } catch (e) {
//       print("Failed to initialize payment sheet: $e");
//       // Handle error
//     }
//   }
//
//   Future<void> displayPaymentSheet(BuildContext context) async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//       print("Payment completed successfully");
//
//       // Handle successful payment
//     } catch (e) {
//       print("Failed to present payment sheet: $e");
//       // Handle error
//     }
//   }
//
//   Future<Map<String, dynamic>> createPaymentIntent() async {
//     try {
//       final body = {
//         "amount": "1000",
//         "currency": "USD",
//       };
//       final response = await http.post(
//         Uri.parse("https://api.stripe.com/v1/payment_intents"),
//         body: body,
//         headers: {
//           "Authorization": "Bearer sk_test_51PAt0FRtJBuWWet1UsIs26BIjqNRy7miXMSCP3FIY161BXGFIUGempAWiFFWsUQSY6wNdv707Lj7oIzMrcKCjrdO00JV6s0yWw", // Replace with your Stripe secret key
//           "Content-Type": "application/x-www-form-urlencoded",
//         },
//       );
//       return json.decode(response.body);
//     } catch (e) {
//       throw Exception("Failed to create payment intent: $e");
//     }
//   }
//   final List<Book> cartItems;
//
//   PaymentPage({required this.cartItems});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stripe Payment Example',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 24.0),
//               Text(
//                 'Selected Books',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Container(
//                 height: 150.0,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: cartItems.length,
//                   itemBuilder: (context, index) {
//                     final book = cartItems[index];
//                     return Container(
//                       margin: EdgeInsets.only(right: 8.0),
//                       child: Column(
//                         children: [
//                           Image.asset(
//                             book.imagePath,
//                             width: 80.0,
//                             height: 100.0,
//                             fit: BoxFit.cover,
//                           ),
//                           SizedBox(height: 4.0),
//                           Text(
//                             book.title,
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               ElevatedButton(
//                 onPressed: () {
//                   makePayment(context);
//                 },
//                 child: Text('Make Payment'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_platform_interface/stripe_platform_interface.dart';
import 'book.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatelessWidget {
  final List<Book> cartItems;

  PaymentPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final Color appColor = const Color(0xFF8A95D6); // Define the app color
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Payment Page')),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Set the button background color
                    onPrimary: appColor, // Set the button text color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Set the button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: appColor)
                      // Set the button border radius
                    ),
                  ),
                  onPressed: () {
                    makePayment(context);
                  },
                  child: Text('Make Payment'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment(BuildContext context) async {
    try {
      final paymentIntent = await createPaymentIntent();
      final paymentSheetParameters = SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent["client_secret"],
        style: ThemeMode.dark,
        merchantDisplayName: "Mety",
      );
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: paymentSheetParameters);
      await displayPaymentSheet(context);
    } catch (e) {
      print("Failed to initialize payment sheet: $e");
      // Handle error
    }
  }

  Future<void> displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("Payment completed successfully");

      // Handle successful payment
    } catch (e) {
      print("Failed to present payment sheet: $e");
      // Handle error
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent() async {
    try {
      final body = {
        "amount": "1000",
        "currency": "USD",
      };
      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: body,
        headers: {
          "Authorization": "Bearer sk_test_51PAt0FRtJBuWWet1UsIs26BIjqNRy7miXMSCP3FIY161BXGFIUGempAWiFFWsUQSY6wNdv707Lj7oIzMrcKCjrdO00JV6s0yWw", // Replace with your Stripe secret key
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );
      return json.decode(response.body);
    } catch (e) {
      throw Exception("Failed to create payment intent: $e");
    }
  }
}