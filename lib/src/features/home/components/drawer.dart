import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:music_app/src/features/home/data/drawer_data.dart';
import 'package:music_app/src/features/home/model/drawer_model.dart';
import 'package:music_app/src/theme/color.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: drawerItem.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? buildHeader()
                : buildDrawerItem(
                    drawerModel: drawerItem[index - 1],
                  );
          }),
    );
  }

  Widget buildHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Logo.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildMusicList(title: "320", subTitle: "Songs"),
              buildMusicList(title: "52", subTitle: "Albums"),
              buildMusicList(title: "87", subTitle: "Artists"),
            ],
          ),
          const SizedBox(height: 30),
        ],
      );

  Column buildMusicList({String? title, String? subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title!,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          subTitle!,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget buildDrawerItem({DrawerModel? drawerModel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: 20),
      child: GestureDetector(
        onTap: () {
          Logger().i(drawerModel?.title);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(drawerModel?.icon ?? "", width: 30, height: 30),
            const SizedBox(width: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(drawerModel?.title ?? "",
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 5),
                SizedBox(
                    width: 200,
                    child: Divider(color: AppColors.grey.withAlpha(50))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
