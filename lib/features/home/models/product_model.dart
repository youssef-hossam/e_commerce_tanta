class ProductModel {
  int id;
  String title;
  String description;
  String category;
  double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
  });

// send request
  // model to json

// retreive response
  // json to model

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price']);
  }
}

// "id": 2,
// "title": "Eyeshadow Palette with Mirror",
// "description": "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",
// "category": "beauty",
// "price": 19.99,
