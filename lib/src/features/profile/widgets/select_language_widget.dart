import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget({
    super.key,
    required this.locale,
  });

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)?.selectLanguage ?? '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Radio(
                value: 'en',
                groupValue: locale.languageCode,
                onChanged: (value) {
                  ref.read(localeProvider.notifier).state = const Locale('en');
                },
              ),
              const Text('English'),
              Radio(
                value: 'ar',
                groupValue: locale.languageCode,
                onChanged: (value) {
                  ref.read(localeProvider.notifier).state = const Locale('ar');
                },
              ),
              const Text('العربية'),
            ],
          ),
        ],
      );
    });
  }
}
