// // class ProductDetailsResponse{
// //   List<ProductDetails>? data;
// //
// //
// //   ProductDetailsResponse({this.data});
// //
// //
// //   ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
// //     print("Json(data) ======> ${json['data']}");
// //    try {
// //       if (json['data'] != null) {
// //
// //         data = <ProductDetails>[];
// //         json['data'].forEach((v) {
// //           data!.add(ProductDetails.fromJson(v));
// //           print("List in json ----> ${data}");
// //         });
// //       }
// //     }catch(e){
// //      print("in from json ====>$e");
// //    }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.data != null) {
// //       data['data'] = this.data!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// //
// // }
//
// // class ProductDetailsResponse {
// //   ProductDetails? data;
// //   ProductDetailsResponse({this.data});
// //   ProductDetailsResponse.fromJson(Map<String, dynamic> json){
// //     try{
// //       data = json['data'];
// //       print("injson ===> $data");
// //     }catch(e){
// //       print("injson error ===> $e");
// //     }
// //   }
// //   Map<String, dynamic> toJson(){
// //     final Map<String, dynamic> data = {};
// //     data['data'] = this.data;
// //     return data;
// //   }
// // }
// class ProductDetails {
//   int? id;
//   String? title;
//   String? description;
//   String? brand;
//   String? category;
//   String? thumbnail;
//
//
//   ProductDetails(
//       {this.id,
//         this.title,
//         this.description,
//         this.brand,
//         this.category,
//         this.thumbnail,
//         });
//
//   ProductDetails.fromJson(Map<String, dynamic> json) {
//     try{
//       id = json['id'];
//       title = json['title'];
//       description = json['description'];
//       brand = json['brand'];
//       category = json['category'];
//       thumbnail = json['thumbnail'];
//     }catch(e){
//       print("in to jerr ----->$e");
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['brand'] = this.brand;
//     data['category'] = this.category;
//     data['thumbnail'] = this.thumbnail;
//     print("in to jerr ----->$data");
//     return data;
//   }
// }


class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  double? discountPercentage;
  double? rating;
  double? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()??"0"),
      discountPercentage: double.parse(json['discountPercentage'].toString()??"0"),
      rating: double.parse(json['rating'].toString()??"0"),
      stock: double.parse(json['stock'].toString()??"0"),
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
}