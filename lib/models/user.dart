class User {
  final String userName;
  final String name;
  final String email;
  final String phone;
  final String gender;

  User({
    this.userName,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      userName: json["username"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      phone: json["phone"] as String,
      gender: json["gender"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        "phone": phone,
        "gender": gender,
        "username": userName,
      };
}
