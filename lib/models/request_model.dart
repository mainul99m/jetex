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
}