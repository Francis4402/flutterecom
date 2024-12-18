class BookData {
  int? productId;
  String? title;
  String? author;
  int? price;
  String? category;
  String? description;
  int? quantity;
  bool? inStock;
  String? image;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BookData(
      {this.productId,
        this.title,
        this.author,
        this.price,
        this.category,
        this.description,
        this.quantity,
        this.inStock,
        this.image,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  BookData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    title = json['title'];
    author = json['author'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    image = json['image'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['title'] = title;
    data['author'] = author;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['quantity'] = quantity;
    data['inStock'] = inStock;
    data['image'] = image;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}