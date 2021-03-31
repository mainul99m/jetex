class Balance{
  final double azn;
  final double tl;
  final double limited;

  Balance({
    this.azn,
    this.tl,
    this.limited
  });

  factory Balance.fromJSON(final json){
    return Balance(
      azn: json["azn"],
      tl: json["tl"],
      limited: json["limited"]
    );
  }

}