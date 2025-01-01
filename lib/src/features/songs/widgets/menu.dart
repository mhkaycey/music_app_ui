import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_app/src/theme/color.dart';

class ShowMenu {
  void showCustomMenu(BuildContext context, Offset position, int index) async {
    final selectedValue = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx, // X position
        position.dy, // Y position
        position.dx, // Right boundary
        position.dy, // Bottom boundary
      ),
      color: AppColors.lightGrey.withOpacity(0.9),
      items: [
        const PopupMenuItem<String>(
          value: 'Play',
          child: Text(
            'Play',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Play Next',
          child: Text(
            'Play Next',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Add to playing queue',
          child: Text(
            'Add to playing queue',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Add to playlist',
          child: Text(
            'Add to playlist',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Rename',
          child: Text(
            'Rename',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Tag editor',
          child: Text(
            'Tag editor',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Goto artist',
          child: Text(
            'Goto artist',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Delete from device',
          child: Text(
            'Delete from device',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Share',
          child: Text(
            'Share',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );

    // Handle menu item selection
    if (selectedValue != null) {
      log('Selected: $selectedValue at index $index');
    }
  }
}
