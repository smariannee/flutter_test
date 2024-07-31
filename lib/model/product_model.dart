class ProductModel {
  final int id;
  final String name;
  final int stock;
  final double price;
  final int status;
  final String image;
  final String description;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.status,
    required this.image,
    required this.description,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      stock: json['stock'],
      price: json['price'],
      status: json['status'],
      image: json['image'],
      description: json['description'] ?? '',
      category: json['category_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'stock': stock,
      'price': price,
      'status': status,
      'image': image,
      'description': description,
      'category': category,
    };
  }
}
