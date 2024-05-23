// Item model class
class Item {
  String image;
  String coffee;
  List<String> beans;
  List<String> type;
  double price;
  String rating;
  String description;
  List<String> sizes;
  int? selectedSize;
  int? quantity;
  String? typeSelected;

  Item({
    required this.image,
    required this.coffee,
    required this.beans,
    required this.type,
    required this.price,
    required this.rating,
    required this.description,
    required this.sizes,
    this.selectedSize,
    this.quantity,
    this.typeSelected,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      image: json['image'],
      coffee: json['coffee'],
      beans: List<String>.from(json['beans']),
      type: List<String>.from(json['type']),
      price: json['price'],
      rating: json['rating'],
      description: json['description'],
      sizes: List<String>.from(json['sizes']),
      selectedSize: json['selectedSize'],
      quantity: json['quantity'],
      typeSelected: json['typeSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'coffee': coffee,
      'beans': beans,
      'type': type,
      'price': price,
      'rating': rating,
      'description': description,
      'sizes': sizes,
      'selectedSize': selectedSize,
      'quantity': quantity,
      'typeSelected': typeSelected,
    };
  }
}

// Coffee model class
class CoffeeModel {
  String type;
  List<Item> items;

  CoffeeModel({
    required this.type,
    required this.items,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      type: json['type'],
      items: (json['items'] as List).map((i) => Item.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'items': items.map((i) => i.toJson()).toList(),
    };
  }
}
