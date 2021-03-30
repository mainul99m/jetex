import 'package:jetex_app/models/credit_card_model.dart';

class NewOrder {
  String country;
  String link;
  int quantity;
  double price;
  double deliveryFee;
  String additionalNotes;
  CreditCard creditCard;

  NewOrder({
    this.country,
    this.link,
    this.quantity,
    this.price,
    this.deliveryFee,
    this.additionalNotes,
    this.creditCard
  });

  factory NewOrder.fromJSON(final json){
    return NewOrder(
      country: json["country"],
      link: json["link"],
      quantity: json["quantity"],
      price: json["price"],
      deliveryFee: json["deliveryFee"],
      additionalNotes: json["additionalNotes"],
      creditCard: CreditCard.fromJSON(json["creditCard"])
    );
  }
}