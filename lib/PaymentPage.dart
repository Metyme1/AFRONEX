import 'dart:async';

import 'book.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PaymentPage extends StatefulWidget {
  final List<Book> cartItems;

  PaymentPage({required this.cartItems});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  @override


  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Show pending UI.
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            _deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    });
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // Perform verification logic here.
    // Return a Future<bool> indicating whether the purchase is valid.
    // You can communicate with your backend server or validate locally.
    // For demonstration purposes, let's assume all purchases are valid.
    return Future.value(true);
  }

  void _handleError(IAPError error) {
    // Handle purchase error here.
  }

  void _deliverProduct(PurchaseDetails purchaseDetails) {
    // Deliver the purchased product to the user.
    // This can include unlocking premium features, updating user preferences, etc.
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // Handle invalid purchases here.
  }

  void _startPurchase(ProductDetails productDetails) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
    if (_isConsumable(productDetails)) {
      InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
    } else {
      InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
    }
    // The purchase flow will be handled by the underlying store.
    // Updates will be delivered to the `InAppPurchase.instance.purchaseStream`.
  }

  bool _isConsumable(ProductDetails productDetails) {
    // Determine if the given product is consumable or non-consumable.
    // Return `true` if it's consumable, `false` otherwise.
    // You can customize this logic based on your product setup.
    return true;
  }

  Future<List<ProductDetails>> _getProducts() async {
    // Retrieve the list of available products for purchase.
    // This can be fetched from your backend server or defined locally.
    // For demonstration purposes, let's assume the list is hardcoded.
    return [
      ProductDetails(
        id: 'book1',
        title: 'Book 1',
        description: 'Description of Book 1',
        price: '9.99', rawPrice: 3, currencyCode: '',
      ),
      ProductDetails(
        id: 'book2',
        title: 'Book 2',
        description: 'Description of Book 2',
        price: '14.99', rawPrice: 5, currencyCode: '',
      ),
    ];
  }

  Future<PurchaseDetails?> _initiatePurchase(List<ProductDetails> products) async {
    // Trigger the purchase flow and return the purchase details.
    // This can be customized based on your payment provider and product setup.
    // For demonstration purposes, let's assume a random product is chosen for purchase.
    final random = products[0];
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: random);
    PurchaseDetails? purchase = (await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam)) as PurchaseDetails?;
    return purchase;
  }

  void _handleSuccessfulPayment(PurchaseDetails purchase) {
    // Handle the successful purchase here.
    // This can include updating UI, saving purchase details, etc.
  }

  void _handleFailedPayment() {
    // Handle the failed purchase here.
    // This can include showing an error messageand allowing the user to retry the purchase.
  }

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
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final book = widget.cartItems[index];
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
              onPressed: () async {
                final List<ProductDetails> products = await _getProducts();
                final PurchaseDetails? purchase = await _initiatePurchase(products);
                if (purchase != null && purchase.status == PurchaseStatus.purchased) {
                  _handleSuccessfulPayment(purchase);
                } else {
                  _handleFailedPayment();
                }
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