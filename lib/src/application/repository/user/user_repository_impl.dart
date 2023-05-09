import 'package:cbq_tasks/src/application/model/user-model/user-model.dart';
import 'package:cbq_tasks/src/application/repository/user/user_repository.dart';

import '../../../api_connection/connectivity_service.dart';


class UserRepositoryImplm implements UserRepository {
  final HttpService _httpService;
  UserRepositoryImplm(this._httpService);

  @override
  Future<UserModel> getUserModel(String userId) async {
    final response = await _httpService.get('users/$userId');
    return UserModel.fromJson(response);
  }
}
