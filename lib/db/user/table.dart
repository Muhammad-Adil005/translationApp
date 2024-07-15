import '../../sdk/ast.dart';

class UserTable {
  static const tblUser = "User";
  static const dbId = "id";
  static const dbUsername = "username";
  static const dbName = "name";
  static const dbDistCode = "distcode";
  static const dbDistName = "district_name";
  static const dbProCode = "procode";
  static const dbProName = "province_name";
  static const dbUserAuth = "userAuth";
  static const dbUserLevel = "userLevel";
  static const dbUType = "utype";
  static const dbPType = "ptype";
  static const dbDomain = "domain";
  static const dbCreatedOn = "created_on";
  static const dbEmail = "email"; // added by adil
  static const dbTotalChklst = "totalchklst"; // added by adil

  String id;
  String? username;
  String? name;
  String? distCode;
  String? districtName;
  String? proCode;
  String? provinceName;
  String? userAuth;
  String? userLevel;
  String? uType;
  String? pType;
  String? domain;
  int? createdOn;

  String totalchklst; // This field is added by adil

  String? email; // This field is added by adil

  UserTable.create({
    required this.id,
    this.username,
    this.name,
    this.distCode,
    this.districtName,
    this.proCode,
    this.provinceName,
    this.userAuth,
    this.userLevel,
    this.uType,
    this.pType,
    this.domain,
    this.createdOn,
    this.email,
    required this.totalchklst,
  });

  UserTable.update({
    required this.id,
    this.username,
    this.name,
    this.distCode,
    this.districtName,
    this.proCode,
    this.provinceName,
    this.userAuth,
    this.userLevel,
    this.uType,
    this.pType,
    this.domain,
    this.createdOn,
    this.email,
    required this.totalchklst,
  });

  factory UserTable.fromJson(Map<String, dynamic> json) => UserTable.create(
        id: asT<String>(json['id'])!,
        username: asT<String?>(json['username']),
        name: asT<String?>(json['name']),
        distCode: asT<String?>(json['distcode']),
        districtName: asT<String?>(json['district_name']),
        proCode: asT<String?>(json['procode']),
        provinceName: asT<String?>(json['province_name']),
        userAuth: asT<String?>(json['userAuth']),
        userLevel: asT<String?>(json['userLevel']),
        uType: asT<String?>(json['utype']),
        pType: asT<String?>(json['ptype']),
        domain: asT<String?>(json['domain']),
        createdOn: asT<int?>(DateTime.now().millisecondsSinceEpoch),
        email: asT<String?>(json['email']),
        totalchklst: asT<String>(json['totalchklst'])!,
      );

  UserTable.fromMap(Map<String, dynamic> map)
      : this.update(
          id: map[dbId],
          username: map[dbUsername],
          name: map[dbName],
          distCode: map[dbDistCode],
          districtName: map[dbDistName],
          proCode: map[dbProCode],
          provinceName: map[dbProName],
          userAuth: map[dbUserAuth],
          userLevel: map[dbUserLevel],
          uType: map[dbUType],
          pType: map[dbPType],
          domain: map[dbDomain],
          createdOn: map[dbCreatedOn],
          email: map[dbEmail],
          totalchklst: map[dbTotalChklst],
        );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      dbId: id,
      dbUsername: username,
      dbName: name,
      dbDistCode: distCode,
      dbDistName: districtName,
      dbProCode: proCode,
      dbProName: provinceName,
      dbUserAuth: userAuth,
      dbUserLevel: userLevel,
      dbUType: uType,
      dbPType: pType,
      dbDomain: domain,
      dbCreatedOn: createdOn,
      dbEmail: email,
      dbTotalChklst: totalchklst,
    };
    return map;
  }
}
