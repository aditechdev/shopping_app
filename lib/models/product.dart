class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  
  //Rating

  Product(
      {required this.name,
      required this.description,
      required this.quantity,
      required this.images,
      required this.category,
      required this.price,
      this.id,
      });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
     
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      quantity: map['quantity'].toDouble() ?? 0.0,
      images: map['images'] ?? "",
      category: map['category'] ?? "",
      price: map['price'].toDouble() ?? 0.0,
      id: map['_id'] ?? "",
     
    );
  }
}
