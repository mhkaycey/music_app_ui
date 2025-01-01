import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music_app/src/features/songs/widgets/menu.dart';
import 'package:music_app/src/theme/color.dart';

class ArtistsPage extends StatelessWidget {
  const ArtistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    width: 2,
                    color: AppColors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Artist 1',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '4 Albums',
                          style: TextStyle(color: Colors.white),
                        ),
                        //const SizedBox(width: 20),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        const Text("17 Songs",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  ShowMenu()
                      .showCustomMenu(context, details.globalPosition, index);
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
