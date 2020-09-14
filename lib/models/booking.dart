class Booking {
  String name;
  int number;
  String date;
  String get getName => name;

  set setName(String name) => this.name = name;

  int get getNumber => number;

  set setNumber(int number) => this.number = number;

  String get getDate => date;

  set setDate(String date) => this.date = date;

  Booking({
    this.name,
    this.date,
    this.number,
  });
}
