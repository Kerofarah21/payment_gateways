import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/stripe_service.dart';
import '../models/payment_intent_input.dart';
import 'checkout_repo.dart';

class CheckoutRepoImp implements CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImp({required this.stripeService});

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInput paymentIntentInput,
  }) async {
    try {
      await stripeService.makePayment(paymentIntentInput: paymentIntentInput);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
