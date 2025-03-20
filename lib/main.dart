import 'package:flutter/material.dart';

import 'Features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const PaymentGatewaysApp());
}

class PaymentGatewaysApp extends StatelessWidget {
  const PaymentGatewaysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
