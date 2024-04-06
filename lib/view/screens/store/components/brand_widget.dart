import 'package:flutter/material.dart';
import 'package:run_app/model/brand.dart';
import 'package:run_app/view_model/utils/app_colors.dart';

class BrandWidget extends StatelessWidget {
  final Brand brand;
  final void Function()? onTap;
  const BrandWidget({required this.brand, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 120,
            height: 130,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: AppColors.white.withOpacity(0.2),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Image.network(
                    brand.image ?? '',
                    fit: BoxFit.cover,
                    color: AppColors.white,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: AppColors.red,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  brand.title ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
