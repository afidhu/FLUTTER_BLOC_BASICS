class ProductModle {
  int? id;
  String? title;
  double? price;
  String? description;
  bool? published;
  String? createdAt;
  String? updatedAt;

  ProductModle(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.published,
        this.createdAt,
        this.updatedAt});

  ProductModle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    published = json['published'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['published'] = this.published;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}


class CartModel {
  int? cartId;
  int? productId;
  String? createdAt;
  String? updatedAt;

  CartModel({this.cartId, this.productId, this.createdAt, this.updatedAt});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    productId = json['productId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['productId'] = this.productId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}



/////////////counts

class CartCountModel {
  int? counts;

  CartCountModel({this.counts});

  CartCountModel.fromJson(Map<String, dynamic> json) {
    counts = json['counts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counts'] = this.counts;
    return data;
  }
}


