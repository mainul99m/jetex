class Order{
  final String trackingId;
  final String country;
  final String date;
  final String timeRange;
  final int quantity;
  final double price;
  final double deliveryFee;
  final String additionalNotes;
  final String company;
  final OrderStatus orderStatus;

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
    this.orderStatus
  });
}

enum OrderStatus{
  Unpaid,
  OutForDelivery,
  InWareHouse,
  Delivered
}