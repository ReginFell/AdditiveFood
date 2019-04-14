import '../api.dart';
import 'model/user.dart';

class UserRepository {
  final Api api;

  UserRepository(this.api);

  Future<User> me() {
    return Future.value(User(id: "temp", name: "hello"));
  }
}
