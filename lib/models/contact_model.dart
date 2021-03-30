class Contact{
  final String name;
  final String addressLine;
  final String city;
  final String province;
  final String postCode;
  final String mobile;
  final String phone;

  Contact({
    this.name,
    this.addressLine,
    this.city,
    this.province,
    this.postCode,
    this.mobile,
    this.phone
  });

  factory Contact.fromJSON(final json){
    return Contact(
      name: json["name"],
      addressLine: json["address"],
      city: json["city"],
      province: json["province"],
      postCode: json["postcode"],
      mobile: json["mobile"],
      phone: json["phone"]
    );
  }


}