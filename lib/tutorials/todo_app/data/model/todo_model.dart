class TodoModel {
  int? id;
  String? title;
  double? price;
  String? description;
  bool? published;
  String? createdAt;
  String? updatedAt;

  TodoModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.published,
        this.createdAt,
        this.updatedAt});

  TodoModel.fromJson(Map<String, dynamic> json) {
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
