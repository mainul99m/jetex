import 'dart:io';

class User{
  final String name;
  final String id;
  final String profileImageURL;
  final String fin;
  final String gender;
  final String phone;
  final String dob;
  final String address;
  final File profileImageFile;

  User({
    this.name,
    this.id,
    this.profileImageURL,
    this.fin,
    this.gender,
    this.phone,
    this.dob,
    this.address,
    this.profileImageFile
  });

  factory User.fromJSON(final json){
    return User(
      name: json["name"],
      id: json["id"],
      profileImageURL: json["img_URL"],
      fin: json["fin"],
      gender: json["gender"],
      address: json["address"],
      phone: json["phone"],
      dob: json["dob"],
    );
  }

  Map<String, dynamic> toJSON() => {
    "name" : name,
    "id" : id,
    "fin" : fin,
    "gender" : gender,
    "address" : address,
    "phone": phone,
    "dob": dob,
    "image": profileImageFile
  };

}