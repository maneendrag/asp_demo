import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel{

  @HiveField(0)
  String? userID;
  @HiveField(1)
   bool? isLoggedIn;
  @HiveField(2)
  String? displayName;
  @HiveField(3)
  String? userPhone;
  @HiveField(4)
  String? userEmail;
  @HiveField(6)
  int? cartCount;
  @HiveField(7)
  String? firebaseId;
  @HiveField(8)
  String? userAddress;

}