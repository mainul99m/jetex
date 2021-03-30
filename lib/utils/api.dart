import 'package:jetex_app/models/contact_model.dart';
import 'package:jetex_app/models/credit_card_model.dart';
import 'package:jetex_app/models/order_model.dart';
import 'package:jetex_app/models/payment_history.dart';

class API {

   static Contact getContact(){
     final json = {
       "name": "Jetex Azerbaijan",
       "address": "Atakent mahallesi 1.etap 2.bolge 215. Sokak Sutek B9 5. giriş 1b JTX-020696",
       "city": "Istanbul",
       "province": "Küçükcekmece",
       "postcode": "34303",
       "mobile": "+9055442356",
       "phone": "99856644"
     };

     return Contact.fromJSON(json);
   }

   static List<PaymentHistory> getPaymentHistory(){
      List<PaymentHistory> history = [];
      final response = [
        {
          "from": "Sifariş Balansi",
          "to" : "Negd",
          "amount": -23.2,
          "date": "08.03.2021"
        },
        {
          "from": "Baglama Balansi",
          "to" : "Dostundan",
          "amount": 112.25,
          "date": "01.03.2021"
        },
        {
          "from": "Dostundan",
          "to" : "Sifariş Balansi",
          "amount": 113.2,
          "date": "23.02.2017"
        },
        {
          "from": "Sifariş Balansi",
          "to" : "Dostundan",
          "amount": 2452.2,
          "date": "23.02.2017"
        },
        {
          "from": "Negd",
          "to" : "Sifariş Balansi",
          "amount": -100.2,
          "date": "23.02.2017"
        }
      ];

      for(var element in response){
        PaymentHistory h = PaymentHistory.fromJSON(element);
        history.add(h);
      }
      return history;
   }


   ///Get new order history
   ///is called from the order view
   ///new order
   static List<Order> getNewOrderHistory(){
     var response = [
       {
         "id" : "JTX-123232",
         "country": "Turkey",
         "date": "20.02.2021",
         "timeRange": "16:00 - 20:00",
         "quantity" : 2,
         "price" : 20.12,
         "deliveryFee" : 4.44,
         "notes": "Some random notes",
         "company": "FLO",
         "status" : "Paid"
       },
       {
         "id" : "JTX-1214452",
         "country": "Turkey",
         "date": "20.02.2021",
         "timeRange": "16:00 - 20:00",
         "quantity" : 2,
         "price" : 20.12,
         "deliveryFee" : 4.44,
         "notes": "Some random notes",
         "company": "FLO",
         "status" : "Paid"
       },
       {
         "id" : "JTX-125686",
         "country": "Turkey",
         "date": "20.02.2021",
         "timeRange": "16:00 - 20:00",
         "quantity" : 2,
         "price" : 20.12,
         "deliveryFee" : 4.44,
         "notes": "Some random notes",
         "company": "FLO",
         "status" : "Paid"
       },
       {
         "id" : "JTX-122344",
         "country": "Turkey",
         "date": "20.02.2021",
         "timeRange": "16:00 - 20:00",
         "quantity" : 2,
         "price" : 20.12,
         "deliveryFee" : 4.44,
         "notes": "Some random notes",
         "company": "FLO",
         "status" : "Paid"
       },
       {
         "id" : "JTX-112343",
         "country": "Turkey",
         "date": "20.02.2021",
         "timeRange": "16:00 - 20:00",
         "quantity" : 2,
         "price" : 20.12,
         "deliveryFee" : 4.44,
         "notes": "Some random notes",
         "company": "FLO",
         "status" : "Paid"
       },
       {
         "id" : "JTX-166854",
         "country": "Turkey",
         "date": "20.02.2021",
         "timeRange": "16:00 - 20:00",
         "quantity" : 2,
         "price" : 20.12,
         "deliveryFee" : 4.44,
         "notes": "Some random notes",
         "company": "FLO",
         "status" : "Paid"
       }
     ];

     List<Order> orders = [];
     for(var element in response){
       Order o = Order.fromJSON(element);
       orders.add(o);
     }

     return orders;
   }

}