class User{
  final String name;
  final String id;
  final String profileImageURL;
  final String fin;
  final String gender;
  final String phone;
  final String dob;
  final String address;

  User({
    this.name,
    this.id,
    this.profileImageURL,
    this.fin,
    this.gender,
    this.phone,
    this.dob,
    this.address
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
      dob: json["dob"]
    );
  }
}