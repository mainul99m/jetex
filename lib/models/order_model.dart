class Order{
  String trackingId;
  String country;
  String date;
  String timeRange;
  int quantity;
  double price;
  double deliveryFee;
  String additionalNotes;
  String company;
  int orderStatus;

  Order({
    this.trackingId,
    this.country,
    this.date,
    this.timeRange,
    this.quantity,
    this.price,
    this.deliveryFee,
    this.additionalNotes,
    this.company,
    this.orderStatus,
  });

  factory Order.fromJSON(final json){
    return Order(
      trackingId: json["id"],
      country: json["country"],
      date: json["date"],
      timeRange: json["timeRange"],
      quantity: json["quantity"],
      price: json["price"],
      deliveryFee: json["deliveryFee"],
      additionalNotes: json["notes"],
      company: json["company"],
      orderStatus: json["status"]
    );
  }
}

/*
enum OrderStatus{
  Unpaid,
  OutForDelivery,
  InWareHouse,
  Delivered
}

 */