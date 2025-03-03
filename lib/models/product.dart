class Product {
  int? id;
  String name;
  String description;
  String picture;
  String price;
  String category;
  int isLike;
  String star;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.price,
    required this.category,
    required this.isLike,
    required this.star,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'picture': picture,
      'price': price,
      'category': category,
      'isLike': isLike,
      'star': star,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      picture: map['picture'],
      price: map['price'],
      category: map['category'],
      isLike: map['isLike'],
      star: map['star'],
    );
  }
}
