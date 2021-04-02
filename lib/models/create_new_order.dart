import 'package:jetex_app/models/credit_card_model.dart';

class CreateNewOrder {
  String country;
  /*
  String link;
  int quantity;
  double price;
  double deliveryFee;
  String additionalNotes;
   */
  List<Product> products;
  CreditCard creditCard;

  CreateNewOrder({
    this.country,
    /*
    this.link,
    this.quantity,
    this.price,
    this.deliveryFee,
    this.additionalNotes,
     */
    this.products,
    this.creditCard
  });

  factory CreateNewOrder.fromJSON(final json){
    return CreateNewOrder(
      country: json["country"],
      /*
      link: json["link"],
      quantity: json["quantity"],
      price: json["price"],
      deliveryFee: json["deliveryFee"],
      additionalNotes: json["additionalNotes"],
       */
      creditCard: CreditCard.fromJSON(json["creditCard"]),
      products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "country": country,
    "creditCard": creditCard.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product{
  String link;
  int quantity;
  double price;
  double deliveryFee;
  String additionalNotes;

  Product({
    this.link,
    this.quantity,
    this.price,
    this.deliveryFee,
    this.additionalNotes,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    link: json["link"],
    quantity: json["quantity"],
    price: json["price"],
    deliveryFee: json["deliveryFee"],
    additionalNotes: json["notes"]
  );

  Map<String, dynamic> toJson() => {
    "link": link,
    "quantity" : quantity,
    "price" : price,
    "deliveryFee" : deliveryFee,
    "notes" : additionalNotes
  };
}