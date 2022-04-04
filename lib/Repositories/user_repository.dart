import '../Model/user_model.dart';
import '../providers/user_data_provider.dart';

class UserRepository {
// Use UserDataSource later
  final UserDataProvider userDataProvider;

  const UserRepository({required this.userDataProvider});

  Future<User> storeUser(
      {required String firstName, required String lastName, required String email, required String password, required String phone }) async {
    User user = await userDataProvider.registerUser(firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone);
    return user;
  }
}