import 'package:flutter/material.dart';

import '../../../application/model/user-model/user-model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.data,
  }) : super(key: key);

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32.0,
          backgroundImage: NetworkImage(
            'https://picsum.photos/seed/picsum/200/300',
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                '@${data.username}',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
