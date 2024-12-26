import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/src/features/home/components/drawer.dart';
import 'package:music_app/src/features/songs/data/playlist_data.dart';
import 'package:music_app/src/features/songs/model/playlist_model.dart';
import 'package:music_app/src/theme/color.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({super.key});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  // late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'All Songs'),
    const Tab(text: 'Playlists'),
    const Tab(text: 'Albums'),
    const Tab(text: 'Artists'),
    const Tab(text: 'Genres'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        drawer: const Drawer(
          child: AppDrawer(),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: AppColors.background,

              floating: true,
              pinned: true,
              elevation: 5,
              // flexibleSpace: FlexibleSpaceBar(
              title: const Text('Songs'),
              // background: Image.asset(
              //   'assets/images/cover.jpg',
              //   fit: BoxFit.cover,
              // ),
              // ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                unselectedLabelColor: AppColors.white,
                labelColor: AppColors.pink,
                indicatorColor: AppColors.pink,
                isScrollable: true,
                dividerHeight: 0,
                tabs: myTabs,
              ),
            ),
          ],
          body: Stack(
            children: [
              TabBarView(
                children: [
                  buildAllSongs(),
                  buildPlaylist(),
                  buildAlbums(),
                  buildAllSongs(),
                  buildAllSongs(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  color: Colors.black.withOpacity(0.5),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.organge,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Song Name',
                              style: TextStyle(color: AppColors.white)),
                          Text('Artist Name',
                              style: TextStyle(
                                  color: AppColors.grey.withOpacity(0.5))),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.skip_previous,
                              color: AppColors.white),
                          const SizedBox(width: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.play_arrow,
                                color: AppColors.white),
                          ),
                          const SizedBox(width: 30),
                          const Icon(Icons.skip_next, color: AppColors.white),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                right: 0,
                child: Builder(
                  builder: (context) {
                    final tabController = DefaultTabController.of(context);
                    return AnimatedBuilder(
                      animation: tabController,
                      builder: (context, child) {
                        return tabController.index == 1
                            ? DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: AppColors.background,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.lightDarkV1,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.pink,
                                      size: 45,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    );
                  },
                ),
              ),
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   left: 0,
              //   bottom: 90,
              //   child: Container(
              //     color: AppColors.organge,
              //     child: Text(
              //       'Your Balance',
              //       style: TextStyle(
              //         fontSize: 18,
              //         color: AppColors.white,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlaylist() {
    return Column(
      children: [
        SizedBox(
          height: 500,
          width: 500,
          child: GridView.count(
            crossAxisCount: 2,
            // scrollDirection: Axis.horizontal,

            //physics: const NeverScrollableScrollPhysics(),

            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            // shrinkWrap: true,
            children: List.generate(playlistData.length, (index) {
              PlaylistModel playlist = playlistData[index];
              return GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black.withOpacity(0.2),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      playlist.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    playlist.subTitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child:
                          Icon(Icons.play_arrow_rounded, color: Colors.black),
                    ),
                  ),
                ),
                child: Image.network(
                    'https://picsum.photos/500/500?random=$index'),
              );
            }),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://picsum.photos/500/500?random=$index'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Image.network(
                    //   ,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Description $index',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  buildAllSongs() {
    return ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title:
              Text('Song $index', style: const TextStyle(color: Colors.white)),
          subtitle: Text('Artist $index',
              style: TextStyle(color: AppColors.grey.withOpacity(0.5))),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage:
                NetworkImage('https://picsum.photos/150/150?random=$index'),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.organge, width: 2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: AppColors.organge,
            ),
          ),
        );
      },
    );
  }

  Widget buildAlbums() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        // var index = index[];
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     opaque: false,
                    //     pageBuilder: (context, _, __) => const AlbumDetails(),
                    //   ),
                    // );

                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      useSafeArea: true,
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 1,
                          maxChildSize: 1.0,
                          minChildSize: 0.5,
                          builder: (context, scrollController) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: AppColors.background,
                              ),
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
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
                                    ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          height: 200,
                                          // decoration: BoxDecoration(
                                          //   image: DecorationImage(
                                          //     image: NetworkImage(
                                          //       'https://picsum.photos/150/150?random=$index',
                                          //     ),
                                          //     fit: BoxFit.fitHeight,
                                          //   ),
                                          // ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Some additional details about the image can go here.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://picsum.photos/150/150?random=$index',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "History",
                        style: TextStyle(color: AppColors.white),
                      ),
                      Text(
                        "Michael Jackson",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          _showCustomMenu(
                              context, details.globalPosition, index);
                        },
                        child: const Icon(
                          Icons.more_vert,
                          // size: 30,
                          color: AppColors.white,
                        ), // Replace with any widget
                      ),
                      const Text(
                        "10 Songs",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _showCustomMenu(BuildContext context, Offset position, int index) async {
    final selectedValue = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx, // X position
        position.dy, // Y position
        position.dx, // Right boundary
        position.dy, // Bottom boundary
      ),
      color: AppColors.background,
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

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), //
      body: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 400,
        child: const Text("Welcome"),
      ),
    );
  }
}
