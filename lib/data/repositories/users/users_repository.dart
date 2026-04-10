import '../../../model/user/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}
