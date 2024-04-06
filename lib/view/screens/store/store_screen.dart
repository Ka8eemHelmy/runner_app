import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:run_app/model/banner.dart';
import 'package:run_app/model/brand.dart';
import 'package:run_app/model/status.dart';
import 'package:run_app/view/components/scaffold_custom/scaffold_custom.dart';
import 'package:run_app/view/screens/store/components/status_widget.dart';
import 'package:run_app/view_model/utils/app_assets.dart';
import '../../../view_model/utils/app_colors.dart';
import 'components/banner_widget.dart';
import 'components/brand_widget.dart';
import 'components/shop_item_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.direct,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.notification,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            SizedBox(
              height: 110,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StatusWidget(
                    status: statuses[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 6,
                ),
                itemCount: statuses.length,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return BannerWidget(
                    banner: banners[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 12,
                ),
                itemCount: banners.length,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                brandes.length,
                (index) => BrandWidget(
                  brand: brandes[index],
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Popular',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 6 / 7,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ShopItemWidget(),
                ShopItemWidget(),
                ShopItemWidget(),
                ShopItemWidget(),
                ShopItemWidget(),
                ShopItemWidget(),
                ShopItemWidget(),
                ShopItemWidget(),
                ShopItemWidget(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: AppColors.purple.withOpacity(0.4),
            ),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.home,
                ),
                activeIcon: SvgPicture.asset(AppAssets.home,
                    colorFilter: ColorFilter.mode(
                      AppColors.purple,
                      BlendMode.srcIn,
                    )),
                label: 'Home',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.cup,
                ),
                label: 'Cup',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.shopping,
                ),
                label: 'Shopping',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.user,
                ),
                label: 'User',
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
