class PaymentHistory{
  final String paymentFrom;
  final String paymentTo;
  final double amount;
  final String date;

  PaymentHistory({
    this.paymentFrom,
    this.paymentTo,
    this.amount,
    this.date
  });

  factory PaymentHistory.fromJSON(final json){
    return PaymentHistory(
      paymentFrom: json["from"],
      paymentTo: json["to"],
      amount: json["amount"],
      date: json["date"]
    );
  }
}