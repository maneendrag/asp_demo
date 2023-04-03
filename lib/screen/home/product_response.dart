class ProductsResponse {
  List<P>? data;

  ProductsResponse({this.data});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <P>[];
      json['data'].forEach((v) {
        data!.add(P.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class P {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  P(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  P.fromJson(Map<String, dynamic> json) {
    try{
      id = json['id'];
      title = json['title'];
      price = double.parse(json['price'].toString()??"0");
      description = json['description'];
      category = json['category'];
      image = json['image'];
      rating =
      json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    }catch(e, s){
      print("in catch ===> $s");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = double.parse(json['rate'].toString());
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}

