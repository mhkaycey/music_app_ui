import 'package:flutter/material.dart';
import 'package:music_app/src/theme/color.dart';

class WidgetRecom extends StatelessWidget {
  final int itemConut;
  final double mainHeight;
  final double? width;
  final String? title;
  final String? subTitle;
  final Widget? image;

  const WidgetRecom({
    super.key,
    required this.itemConut,
    required this.mainHeight,
    this.width,
    this.title,
    this.subTitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mainHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemConut,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: image!,
              ),
              const SizedBox(height: 10),
              Text(
                title!,
                // 'Sound of Sky',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subTitle!,
                // 'Based on your recent activity',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}