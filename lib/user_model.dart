import 'package:equatable/equatable.dart';

class UserModel {
  String uid = '';
  String username = '';
  String email = '';
  String avatarUrl = '';
  String password = '';
  String authType = '';
  String credential = '';

  UserModel([uid, username, email,avatarUrl, password,
      authType, credential]);

  var empty = UserModel('', '', '', '', '', '', '');

  Map toMap(UserModel user) {
    var data = <String, dynamic>{};

    data["uid"] = user.uid;
    data["username"] = user.username;
    data["email"] = user.email;
    data["avatar"] = user.avatarUrl;
    data["password"] = user.password;
    data["authType"] = user.authType;
    data["credential"] = user.credential;

    return data;
  }

  @override
  List<Object> get props =>
      [uid, username, email, avatarUrl, password, authType, credential];
}
