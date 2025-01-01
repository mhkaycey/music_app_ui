// ignore_for_file: file_names

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:music_app/src/features/home/components/drawer.dart';
import 'package:music_app/src/features/home/components/widget_recon_playlist.dart';
import 'package:music_app/src/theme/color.dart';

class Homepage extends StatefulWidget {
  final Function(bool) afterScrollResult;
  const Homepage({super.key, required this.afterScrollResult});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isVisble = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisble) {
          widget.afterScrollResult(false);
          _isVisble = false;
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisble) {
          widget.afterScrollResult(true);
          _isVisble = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        elevation: 5,
        child: AppDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.lightDarkV1,
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: AppColors.grey,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: AppColors.grey.withOpacity(0.5),
                    width: 0.5,
                  ),
                )),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Hot Recommendations',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    WidgetRecom(
                      itemConut: 5,
                      mainHeight: 220,
                      title: "Sound of Sky",
                      subTitle: 'Robert Plant',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Playlists',
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                  Text(
                    "View all",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.organge,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
              Container(
                height: 270,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: AppColors.grey.withOpacity(0.5),
                    width: 0.5,
                  ),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    WidgetRecom(
                      itemConut: 5,
                      mainHeight: 250,
                      image: CachedNetworkImage(
                        imageUrl: 'https://picsum.photos/300/150?random',
                        width: 170,
                        height: 172,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: "Sound of Sky",
                      subTitle: 'Robert Plant',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recently Played',
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                  Text(
                    "View all",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.organge,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildRecentlyPlayed();
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 0.1,
                ),
                itemCount: 5,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecentlyPlayed() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            // color: AppColors.organge.withOpacity(0.5),
            // gradient: AppColors.gradient2,
            border: Border.all(color: AppColors.organge, width: 2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: AppColors.organge,
          ),
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sound of Sky',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 0),
            Text(
              'Robert Plant',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            const Icon(
              Icons.favorite,
              color: AppColors.organge,
              fill: 0,
            ),
            const SizedBox(height: 5),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              onRatingUpdate: (value) => log(value.toString()),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: AppColors.organge,
              ),
              itemCount: 5,
              itemSize: 20,
              unratedColor: AppColors.grey,
              direction: Axis.horizontal,
            ),
            const SizedBox(height: 10)
          ],
        ),
      ],
    );
  }
}
