enum Shade { orange, green }

class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String quantity;
  final String? description;
  final bool inCart;
  final Shade shade;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });

  String getFormattedPrice() {
    return '\$$price';
  }
}
