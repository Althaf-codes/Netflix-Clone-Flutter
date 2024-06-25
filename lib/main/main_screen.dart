import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/constant/my_flutter_app_icons.dart';
import 'package:netflix_clone/screens/home/home_screen.dart';
import 'package:netflix_clone/screens/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    Center(
      child: Text('New & Hot'),
    ),
    Center(
      child: Text('Fast Laughs'),
    ),
    SearchScreen(),
    Center(
      child: Text('Downloads'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 40,
          type: BottomNavigationBarType.fixed,
          // fixedColor: Colors.black,
          backgroundColor: AppColor.black,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // selectedIconTheme: const IconThemeData(color: Colors.white, size: 18),
          selectedItemColor: AppColor.white,
          unselectedItemColor: AppColor.grey,
          // selectedIconTheme: const IconThemeData(color: Colors.white),
          selectedLabelStyle:
              const TextStyle(color: AppColor.white, fontSize: 12),
          unselectedLabelStyle:
              const TextStyle(color: Colors.transparent, fontSize: 11),
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  MyFlutterApp.home,
                  size: 18,
                )),
            BottomNavigationBarItem(
                label: 'New & Hot',
                icon: Icon(
                  MyFlutterApp.video_library,
                  size: 18,
                )),
            BottomNavigationBarItem(
                label: 'Fast Laughs',
                icon: Icon(
                  MyFlutterApp.smile_beam,
                  size: 18,
                )),
            BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  MyFlutterApp.search,
                  size: 18,
                )),
            BottomNavigationBarItem(
                label: 'Downloads',
                icon: Icon(
                  MyFlutterApp.down_circled,
                  size: 18,
                ))
          ]),
    );
  }
}
