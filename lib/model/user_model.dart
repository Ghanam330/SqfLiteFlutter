

import 'package:sqfliteyotubenotaapp/helper/conestant.dart';

class UserModel {
  int id;
  String name, email, phone;

  UserModel({this.name, this.email, this.id, this.phone});

  toJson() {
    return {columnName: name, columnEmail: email, columnPhone: phone};
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    phone = map[columnPhone];
    email = map[columnEmail];
  }
}
