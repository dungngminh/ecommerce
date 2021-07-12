class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageSrc;
  final String productCategory;
  final String brand;
  final int quantity;
  final bool? isFavorite;
  final bool isPopular;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageSrc,
      required this.productCategory,
      required this.brand,
      required this.quantity,
      this.isFavorite,
      required this.isPopular});
}
