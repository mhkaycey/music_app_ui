import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/src/features/songs/widgets/album_button.dart';
import 'package:music_app/src/features/songs/widgets/album_list.dart';
import 'package:music_app/src/theme/color.dart';

class AlbumDetailsSheet extends StatelessWidget {
  final int index;
  final ScrollController scrollController;
  const AlbumDetailsSheet({
    super.key,
    required this.index,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://picsum.photos/150/150?random=$index';
    return Container(
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
                    'Album Details',
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
                      height: 270,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        height: 270,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.background.withOpacity(0.5),
                          // image: DecorationImage(
                          //   image: NetworkImage(
                          //     'https://picsum.photos/150/150?random=$index',
                          //   ),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        imageUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "History",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'by Michael Jackson',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "1996 . 18 Songs . 64 min",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AlbumDetailsButton(
                                  icon: const Icon(
                                    Icons.play_arrow_outlined,
                                    color: AppColors.white,
                                    size: 30,
                                  ),
                                  functionName: "Play",
                                  gradientColor: AppColors.gradient2,
                                ),
                                const AlbumDetailsButton(
                                  icon: Icon(
                                    Icons.share,
                                    color: AppColors.white,
                                    size: 20,
                                  ),
                                  functionName: "Share",
                                  color: AppColors.white,
                                ),
                                const AlbumDetailsButton(
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: AppColors.white,
                                    size: 20,
                                  ),
                                  functionName: "Add to favourites",
                                  color: AppColors.white,
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
            const AlbumList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
