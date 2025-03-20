class PaymentIntentInput {
  int? amount;
  String? currency;

  PaymentIntentInput({
    this.amount,
    this.currency,
  });

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
    };
  }
}
