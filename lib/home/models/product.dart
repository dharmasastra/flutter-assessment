class Product {
  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    this.specs,
    required this.features,
    this.category,
    this.price,
    this.priceLabel,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: json['brand'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: json['rating'].toDouble() as double,
      reviewCount: json['reviewCount'] as int,
      specs: json['specs'] as String?,
      features: List<String>.from(json['features'] as List),
      category: json['category'] as String?,
      price: json['price']?.toDouble() as double?,
      priceLabel: json['priceLabel'] as String?,
    );
  }

  final int id;
  final String name;
  final String brand;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String? specs;
  final List<String> features;
  final String? category;
  final double? price;
  final String? priceLabel;
}
