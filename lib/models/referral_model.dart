class Referral{
  final double balance;
  final String link;

  Referral({
    this.balance,
    this.link
  });

  factory Referral.fromJSON(final json){
    return Referral(
      balance: json["balance"],
      link: json["link"]
    );
  }

}