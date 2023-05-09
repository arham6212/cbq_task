import 'package:flutter/material.dart';

import '../../../application/model/user-model/user-model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    Key? key,
    required this.data,
  }) : super(key: key);

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
            AppLocalizations.of(context)?.personalInformation ?? ''),
        const SizedBox(height: 16.0),
        _buildInformationItem(
          context,
          title: AppLocalizations.of(context)?.name ?? '',
          subtitle: data.name,
        ),
        _buildInformationItem(
          context,
          title: AppLocalizations.of(context)?.email ?? '',
          subtitle: data.email,
        ),
        _buildInformationItem(
          context,
          title: AppLocalizations.of(context)?.phone ?? '',
          subtitle: data.phone,
        ),
        _buildInformationItem(
          context,
          title: AppLocalizations.of(context)?.website ?? '',
          subtitle: data.website,
        ),
      ],
    );
  }

  Widget _buildInformationItem(BuildContext context,
      {required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
