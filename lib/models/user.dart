class User {
  final String username;
  final String email;
  final String password;
  final String accessToken;
  final String firstName;
  final String lastName;
  final String imgUrl;
  final String cin;
  final String passport;
  final String birthDate;
  final String country;

  User({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.accessToken,
    this.imgUrl,
    this.cin,
    this.passport,
    this.birthDate,
    this.country,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      email: json["email"] as String,
      accessToken: json["accesToken"] as String,
      firstName: json["name"] as String,
      lastName: json["lastName"] as String,
      password: json["password"] as String,
      imgUrl: json["imageUrl"] as String,
      cin: json["cin"] as String,
      passport: json["passport"] as String,
      birthDate: json["birthDate"] as String,
      country: json["country"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        'email': email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "imgUrl": imgUrl,
        "cin": cin,
        "passport": passport,
        "birthDate": birthDate,
        "country": country,
        "accessToken": accessToken,
      };

  Map<String, dynamic> register() => {
        "username": username,
        "email": email,
        "password": password,
      };

  Map<String, dynamic> logIn() => {
        "email": email,
        "password": password,
      };
}
