import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../Features/checkout/data/models/payment_intent/payment_intent_model.dart';
import '../../Features/checkout/data/models/payment_intent_input.dart';
import 'api_keys.dart';
import 'dio_helper.dart';

class StripeService {
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInput paymentIntentInput,
  ) async {
    var response = await DioHelper.postData(
      endpoint: 'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentInput.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );

    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Kerolos Farah',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInput paymentIntentInput,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInput);

    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );

    await displayPaymentSheet();
  }
}
