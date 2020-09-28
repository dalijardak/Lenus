class Occupation {
  final String title;
  final double occupation;

  Occupation({
    this.title,
    this.occupation,
  });

  factory Occupation.fromJson(Map<dynamic, dynamic> json) {
    return Occupation(
      title: json["name"],
      occupation: json["occupation"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": title,
        "occupation": occupation,
      };
}
