class Cart_Model {
  String? Name;
  String? description;
  num? price;
  dynamic? image;
  num? quantity;

  Cart_Model(
      {required this.Name,
      required this.description,
      required this.image,
      required this.price,
      required this.quantity});
}
