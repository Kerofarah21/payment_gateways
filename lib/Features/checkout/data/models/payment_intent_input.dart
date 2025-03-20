class PaymentIntentInput {
  int? amount;
  String? currency;

  PaymentIntentInput({
    this.amount,
    this.currency,
  });

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
