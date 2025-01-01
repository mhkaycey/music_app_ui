import 'package:flutter/material.dart';
import 'package:music_app/src/theme/color.dart';

class AlbumDetailsButton extends StatelessWidget {
  final Gradient? gradientColor;
  final Color? color;
  final Border? border;
  final String functionName;
  final Widget icon;
  const AlbumDetailsButton({
    super.key,
    this.gradientColor,
    this.color,
    required this.functionName,
    required this.icon,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(
        top: 15,
      ),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: gradientColor,
          // color: color,
          border: color != null
              ? Border.all(
                  color: color!,
                  width: 2,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              functionName,
              style: const TextStyle(
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
