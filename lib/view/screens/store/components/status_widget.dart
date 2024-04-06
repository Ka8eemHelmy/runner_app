import 'package:flutter/material.dart';
import 'package:run_app/model/status.dart';

import '../../../../view_model/utils/app_colors.dart';

class StatusWidget extends StatelessWidget {
  final Status status;
  const StatusWidget({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.darkPurple,
          radius: 40,
          child: CircleAvatar(
            radius: 36,
            backgroundImage: Image.network(
              status.image ?? '',
            ).image,
          ),
        ),
        const SizedBox(height: 6),
        Text(status.title ?? '',),
      ],
    );
  }
}
