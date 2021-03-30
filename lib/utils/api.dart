import 'package:jetex_app/models/contact_model.dart';
import 'package:jetex_app/models/credit_card_model.dart';

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
}