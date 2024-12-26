import 'package:flutter/material.dart';
import 'package:music_app/src/features/home/homePage.dart';
import 'package:music_app/src/features/settings/settings.dart';
import 'package:music_app/src/features/songs/songs.dart';
import 'package:music_app/src/theme/color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  bool isVisble = true;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      Homepage(
        afterScrollResult: afterScrollResult,
      ),
      const SongsPage(),
      const SettingsPage(),
    ];
  }

  afterScrollResult(bool value) {
    setState(() {
      isVisble = value;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 70 + MediaQuery.of(context).padding.bottom,
        child: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.pink,
          iconSize: 30,
          // fixedColor: Colors.black,
          backgroundColor: AppColors.lightDarkV1,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Songs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
