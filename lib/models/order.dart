class Order {
  final String name;
  final int quantity;
  final double price;

  Order({
    this.name,
    this.quantity,
    this.price,
  });

  factory Order.fromJson(Map<dynamic, dynamic> json) {
    return Order(
      name: json["name"],
      quantity: json["quantity"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
      };
}
