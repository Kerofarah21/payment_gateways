import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/payment_intent_input.dart';
import '../../../data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CheckoutRepo checkoutRepo;

  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  Future<void> makePayment({
    required PaymentIntentInput paymentIntentInput,
  }) async {
    emit(PaymentLoading());

    var result =
        await checkoutRepo.makePayment(paymentIntentInput: paymentIntentInput);

    result.fold(
      (failure) => emit(PaymentFailure(failure.errMessage)),
      (success) => emit(PaymentSuccess()),
    );
  }
}
