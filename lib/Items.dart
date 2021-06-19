class Items {
  final String id;
  final String desc;
  final String name;
  final num price;
  final String color;
  final String image;

  Items({this.id, this.desc, this.name, this.price, this.color, this.image});
}

final products = [
  Items(
    id: "001",
    name: "Tom",
    price: 150,
  ),
];
