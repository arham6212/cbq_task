import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routes/routes.dart';

final errorProvider = Provider(
    (ref) => ErrorNotifier(ref.watch(navigatorKeyKeyProvider).currentContext!));

class ErrorNotifier {
  String? errorMessage;
  BuildContext? context;

  ErrorNotifier(BuildContext buildContext) : context = buildContext;

  void setError(String message) {
    errorMessage = message;
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(errorMessage!),
      duration: const Duration(seconds: 3),
    ));
  }

  void clearError() {
    errorMessage = null;
  }
}
