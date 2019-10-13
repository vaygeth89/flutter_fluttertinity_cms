class User {
  int id;
  String name;
  String email;

  User({this.id, this.name, this.email});

  User.fromJson(json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email};
  }
}
