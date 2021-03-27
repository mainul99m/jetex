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
  OrderStatus orderStatus;

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
}

enum OrderStatus{
  Unpaid,
  OutForDelivery,
  InWareHouse,
  Delivered
}