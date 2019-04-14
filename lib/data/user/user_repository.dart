import 'package:firebase_auth/firebase_auth.dart';

import '../api.dart';
import 'model/user.dart';

class UserRepository {
  final Api _api;

  UserRepository(this._api);

  Future<User> me() {
    return FirebaseAuth.instance.currentUser().then((value) {
      if (value != null) {
        return User(id: value.uid, name: value.email);
      } else {
        return null;
      }
    });
  }
}
