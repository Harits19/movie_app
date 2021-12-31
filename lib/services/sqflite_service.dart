import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/utils/constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserProvider {
  UserProvider();

  late Database db;

  Future open() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "user.db");

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table ${SqfliteKey.tableUser} ( 
  ${SqfliteKey.columnEmail} text primary key, 
  ${SqfliteKey.columnPassword} text not null,
  ${SqfliteKey.columnUsername} text not null)
''');
    });
  }

  Future<User> insert(User user) async {
    final _user = await getUser(user.email ?? "");
    if (_user != null) throw "Email already registered";
    await db.insert(SqfliteKey.tableUser, user.toMap());
    return user;
  }

  Future<User?> getUser(String email) async {
    List<Map<String, dynamic>> maps = await db.query(SqfliteKey.tableUser,
        columns: [
          SqfliteKey.columnEmail,
          SqfliteKey.columnPassword,
          SqfliteKey.columnUsername
        ],
        where: '${SqfliteKey.columnEmail} = ?',
        whereArgs: [email]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(String email) async {
    return await db.delete(SqfliteKey.tableUser,
        where: '${SqfliteKey.columnEmail} = ?', whereArgs: [email]);
  }

  Future<int> update(User user) async {
    return await db.update(SqfliteKey.tableUser, user.toMap(),
        where: '${SqfliteKey.columnEmail} = ?', whereArgs: [user.email]);
  }

  Future close() async => db.close();
}
