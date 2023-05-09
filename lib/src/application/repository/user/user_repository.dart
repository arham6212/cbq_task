import 'package:cbq_tasks/src/application/model/user-model/user-model.dart';
import 'package:cbq_tasks/src/application/repository/user/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_connection/connectivity_service.dart';


abstract class UserRepository {
  Future<UserModel> getUserModel(String userId);
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final httpService = ref.watch(httpServiceProvider);

  return UserRepositoryImplm(httpService);
});
