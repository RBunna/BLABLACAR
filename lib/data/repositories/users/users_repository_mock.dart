import 'dart:math';

import '../../../model/user/user.dart';
import '../../dummy_data.dart';
import 'users_repository.dart';

class UsersRepositoryMock implements UsersRepository {
  final List<User> _users = fakeUsers;

  @override
  Future<List<User>> getUsers() async {
    // await _simulateDelay();
    return _users;
  }

  Future<void> _simulateDelay() async {
    await Future.delayed(Duration(milliseconds: 300 + Random().nextInt(500)));
  }
}
