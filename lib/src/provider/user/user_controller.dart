import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/model/user-model/user-model.dart';
import '../../application/repository/user/user_repository.dart';

final userIdProvider = Provider((ref) => '1');

final userFutureProvider = FutureProvider<UserModel>((ref) async {
  final response = await ref.watch(userProvider).getUser();
  return response;
});

final userProvider = Provider<UserController>((ref) => UserController(ref));

class UserController {
  UserController(this.ref);

  final Ref ref;

  Future<UserModel> getUser() async {
    final userId = ref.watch(userIdProvider);

    return ref.read(userRepositoryProvider).getUserModel(userId);
  }
}
