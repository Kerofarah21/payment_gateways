import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/payment_intent_input.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInput paymentIntentInput,
  });
}
