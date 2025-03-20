import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/checkout/presentation/views/my_cart_view.dart';
import 'core/utils/dio_helper.dart';
import 'core/utils/my_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  Bloc.observer = MyBlocObserver();

  runApp(
    const PaymentGatewaysApp(),
  );
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
