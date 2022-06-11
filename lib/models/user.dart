import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User(this.id, this.name, this.email, this.password, this.address, this.type,
      this.token);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        map['_id'] ?? "",
        map['name'] ?? "",
        map['email'] ?? "",
        map['password'] ?? "",
        map['address'] ?? "",
        map['type'] ?? "",
        map['token'] ?? "");
  }

  String toJson() => jsonEncode(toMap());
  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));
}
