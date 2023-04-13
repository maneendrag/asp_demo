class OrdersResponse {
  List<Orders>? orders;

  OrdersResponse({this.orders});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  double? totalOrderPrice;
  double? totalOrderdItems;
  String? orderId;
  String? createdAt;
  String? address;

  Orders(
      {this.totalOrderPrice,
        this.totalOrderdItems,
        this.orderId,
        this.createdAt,
      this.address});

  Orders.fromJson(Map<String, dynamic> json) {
    totalOrderPrice = double.parse(json['total_order_price'].toString() ?? "0");
    totalOrderdItems = double.parse(json['total_orderd_items'].toString() ?? "0");
    orderId = json['order_id'];
    createdAt = json['created_at'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_order_price'] = this.totalOrderPrice;
    data['total_orderd_items'] = this.totalOrderdItems;
    data['order_id'] = this.orderId;
    data['created_at'] = this.createdAt;
    data['address'] = this.address;
    return data;
  }
}