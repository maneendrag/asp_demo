class CartDataResponse {
  List<Cart>? data;

  CartDataResponse({this.data});

  CartDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      data = <Cart>[];
      json['cart'].forEach((v) {
        data!.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['cart'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int? productId;
  String? productName;
  double? count;
  double? productPrice;

  Cart({this.productId, this.productName, this.count, this.productPrice});

  Cart.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    count = double.parse(json['count'].toString() ?? "0");
    productPrice = double.parse(json['product_price'].toString() ?? "0");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['count'] = this.count;
    data['product_price'] = this.productPrice;
    return data;
  }
}