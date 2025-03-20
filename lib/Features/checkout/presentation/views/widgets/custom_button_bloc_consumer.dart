import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/payment_intent_input.dart';
import '../../cubits/payment_cubit/payment_cubit.dart';
import '../thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }

        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Continue',
          isLoading: state is PaymentLoading,
          onTap: () async {
            await BlocProvider.of<PaymentCubit>(context).makePayment(
              paymentIntentInput: PaymentIntentInput(
                amount: 100,
                currency: 'usd',
              ),
            );
          },
        );
      },
    );
  }
}
