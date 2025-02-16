import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/src/theme/color.dart';

class ArtistDetails extends StatelessWidget {
  final int index;
  final ScrollController scrollController;
  const ArtistDetails({
    super.key,
    required this.index,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://picsum.photos/150/150?random=$index';
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Artist Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.white,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.search,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ClipRRect(
                    child: Stack(
                      children: [
                        Image.network(
                          imageUrl,
                          height: 250,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.background.withOpacity(0.5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Dilon Bruce",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Pop rock, Alternative rock, Indie rock',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "4,367",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "Followers",
                                          style: TextStyle(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "128,980",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "Listerners",
                                          style: TextStyle(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    followButton(
                                      title: "Follow",
                                      color: AppColors.pink,
                                      textColor: AppColors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Artist Details",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget followButton(
      {required String title, required Color color, required Color textColor}) {
    return SizedBox(
      height: 40,
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
