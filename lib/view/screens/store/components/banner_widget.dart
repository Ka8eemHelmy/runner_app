import 'package:flutter/material.dart';
import '../../../../view_model/utils/app_colors.dart';

import '../../../../model/banner.dart' as model;

class BannerWidget extends StatelessWidget {
  final model.Banner banner;
  const BannerWidget({required this.banner, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width - 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: banner.colors ?? [
            AppColors.red,
            AppColors.lightOrange,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(banner.title ?? '', style: Theme.of(context).textTheme.titleLarge),
                Text(banner.subTitle ?? '', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          Expanded(
            child: Image.network(
              banner.image ?? '',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
