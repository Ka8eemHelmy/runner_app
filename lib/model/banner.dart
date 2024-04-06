import 'package:flutter/material.dart';
import 'package:run_app/view_model/utils/app_colors.dart';

class Banner {
  String? title;
  String? subTitle;
  String? image;
  List<Color>? colors;

  Banner({this.title, this.subTitle, this.image, this.colors});
}

List<Banner> banners = [
  Banner(
    title: 'Today\'s Special',
    subTitle: '50% Off On All Items',
    image: 'https://static.vecteezy.com/system/resources/previews/035/923/166/original/3d-illustration-great-pirate-3d-cartoon-character-pirates-managed-to-find-treasure-the-pirate-lifted-one-foot-onto-the-exposed-treasure-she-smiled-happily-at-his-discovery-3d-cartoon-character-png.png',
    colors: [AppColors.red, AppColors.lightOrange,],
  ),
  Banner(
    title: 'New Collection',
    subTitle: 'New Arrivals',
    image: 'https://static.vecteezy.com/system/resources/previews/035/923/170/original/3d-illustration-creepy-pirate-3d-cartoon-character-the-pirate-aims-the-gun-at-the-opponent-in-front-of-him-the-pirate-shows-a-scary-angry-expression-3d-cartoon-character-png.png',
    colors: [Color(0xFF7B61FF), Color(0xFF614385)],
  ),
];