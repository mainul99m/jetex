import 'dart:io';

import 'package:flutter/material.dart';

class Declare{
  final String country;
  final String trackingNumber;
  final String website;
  final String company;
  final String category;
  final double price;
  final String currency;
  final int quantity;
  final String notes;
  final File invoice;

  Declare({
    this.country,
    this.trackingNumber,
    this.website,
    this.company,
    this.category,
    this.price,
    this.currency,
    this.quantity,
    this.notes,
    this.invoice
  });

  Map<String, dynamic> toJSON() => {
    "country" : country,
    "trackingID" : trackingNumber,
    "website" : website,
    "company": company,
    "category": category,
    "price": price,
    "currency" : currency,
    "quantity" : quantity,
    "quality": quantity,
    "notes" : notes,
    "invoice": invoice
  };
}