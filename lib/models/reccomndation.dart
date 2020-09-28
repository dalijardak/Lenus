class Reccomandation {
  final String id;
  final String resCode;
  final String name;
  final String description;
  final String imageUrl;

  Reccomandation({
    this.id,
    this.resCode,
    this.name,
    this.description,
    this.imageUrl,
  });

  factory Reccomandation.fromJson(Map<dynamic, dynamic> json) {
    return Reccomandation(
      id: json['id'],
      resCode: json['resCode'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "resCode": resCode,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
      };
}
