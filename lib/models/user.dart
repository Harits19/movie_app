import 'package:majootestcase/utils/constant.dart';

class User {
  String? email;
  String? password;
  String? username;

  User({this.email, this.password, this.username});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      SqfliteKey.columnEmail: email,
      SqfliteKey.columnPassword: password,
      SqfliteKey.columnUsername: username,
    };

    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    email = map[SqfliteKey.columnEmail];
    password = map[SqfliteKey.columnPassword];
    username = map[SqfliteKey.columnUsername];
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'username': username,
      };
}
