import 'package:cbq_tasks/src/features/profile/widgets/personal_information_widget.dart';
import 'package:cbq_tasks/src/features/profile/widgets/profile_header_widget.dart';
import 'package:cbq_tasks/src/features/profile/widgets/select_language_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../provider/user/user_controller.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userFutureProvider);
    final locale = ref.watch(localeProvider);

    return Drawer(
      child: user.when(
        data: (data) => SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ProfileHeader(data: data),
              const SizedBox(height: 32.0),
              SelectLanguageWidget(locale: locale),
              const SizedBox(height: 32.0),
              PersonalInformation(data: data),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
        error: (error, sta) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
