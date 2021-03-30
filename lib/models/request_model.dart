import 'package:jetex_app/models/credit_card_model.dart';

class RequestOrder {
  String trackingNumber;
  String address;
  String additionalNotes;
  String date;
  String timeRange;
  double deliveryFee;
  CreditCard creditCard;

  RequestOrder({
    this.trackingNumber,
    this.address,
    this.additionalNotes,
    this.date,
    this.timeRange,
    this.deliveryFee,
    this.creditCard
  });

  factory RequestOrder.fromJSON(final json){
    return RequestOrder(
      trackingNumber: json["trackingId"],
      address: json["address"],
      additionalNotes: json["notes"],
      date: json["date"],
      timeRange: json["timeRange"],
      deliveryFee: json["deliveryFee"],
      creditCard: CreditCard.fromJSON(json["creditCard"])
    );
  }
}