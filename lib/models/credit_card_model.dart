class CreditCard{
  final String name;
  final String number;
  final String expirationDate;
  final String type;

  CreditCard({
    this.name,
    this.number,
    this.expirationDate,
    this.type
  });

  factory CreditCard.fromJSON(final json){
    return CreditCard(
      name: json["name"],
      number: json["number"],
      expirationDate: json["expirationDate"],
      type: json["cardType"]
    );
  }
}