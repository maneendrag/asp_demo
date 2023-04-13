class UserResponse {
  List<User>? user;

  UserResponse({this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? userEmail;
  String? userName;
  String? userPhone;
  String? address;

  User({this.userEmail, this.userName, this.userPhone, this.address});

  User.fromJson(Map<String, dynamic> json) {
    userEmail = json['user_email'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_email'] = this.userEmail;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['address'] = this.address;
    return data;
  }
}