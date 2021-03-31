class Transaction{
  final String email;
  final double amount;
  final String date;

  Transaction({
    this.email,
    this.amount,
    this.date
  });

  factory Transaction.fromJSON(final json){
    return Transaction(
      email: json["email"],
      amount: json["amount"],
      date: json["date"]
    );
  }
}