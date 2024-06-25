import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/assets.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/constant/my_flutter_app_icons.dart';
import 'package:netflix_clone/screens/home/components/episodes_screen.dart';
import 'package:netflix_clone/widgets/episode_card.dart';
import 'package:netflix_clone/widgets/horizontal_full_icon_button.dart';
import 'package:netflix_clone/widgets/vertical_icon_button.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late ScrollController _scrollController;
  int _selectedIndex = 0;
  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: AppColor.grey,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: AppColor.greyDark1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.netflixLogo,
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'SERIES',
                        style: TextStyle(
                            color: AppColor.greyLight2,
                            letterSpacing: 3,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Selling Sunset',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '2022',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        // height: 10,
                        // width: 15,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: AppColor.greyDark1,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Text(
                          'TV-MA',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '5 Seasons',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.hd_outlined,
                        size: 18,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  horizontalFullIconButton(
                      context: context,
                      iconData: Icons.play_arrow,
                      label: 'Play',
                      bgColor: AppColor.white,
                      labelColor: AppColor.black,
                      iconColor: AppColor.black,
                      ontap: () {},
                      fontweight: FontWeight.w700),
                  const SizedBox(
                    height: 10,
                  ),
                  horizontalFullIconButton(
                      context: context,
                      iconData: Icons.file_download_outlined,
                      label: 'Download',
                      bgColor: AppColor.greyDark1,
                      labelColor: AppColor.grey,
                      iconColor: AppColor.grey,
                      ontap: () {},
                      fontweight: FontWeight.w600),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'S5:E10 Nothing Remains The Same',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Hearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions.',
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      VerticalIconButton(
                        icon: Icons.add,
                        title: 'My List',
                        tap: () {},
                        titleColor: AppColor.grey,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      VerticalIconButton(
                        icon: MyFlutterApp.thumbs_up,
                        title: 'Rate',
                        tap: () {},
                        titleColor: AppColor.grey,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      VerticalIconButton(
                        icon: Icons.send_outlined,
                        title: 'Share',
                        tap: () {},
                        titleColor: AppColor.grey,
                      ),
                      Spacer()
                    ],
                  ),
                  // TabBar(
                  //     onTap: (int index) {
                  //       _selectedIndex = index;
                  //     },
                  //     controller: _controller,
                  //     indicator: BoxDecoration(boxShadow: [
                  //       BoxShadow(color: AppColor.red, offset: Offset(0, -1)),
                  //     ]),
                  //     // indicatorColor: AppColor.red,
                  //     tabs: [
                  //       Text(
                  //         'Episodes',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       Text(
                  //         'Collection',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       Text(
                  //         'More Like This',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       Text(
                  //         'Trailers & More',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ])
                  const SizedBox(
                    height: 10,
                  ),

                  _buildTabBar(), _buildTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.,
      children: [
        _buildTabItem(0, 'Episodes'),
        _buildTabItem(1, 'Collection'),
        _buildTabItem(2, 'More Like This'),
        _buildTabItem(3, 'Trailers & More'),
      ],
    );
  }

  Widget _buildTabItem(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.only(top: 8),
          // color: index == _selectedIndex ? Colors.blue : Colors.transparent,
          height: 30,
          // width: 60,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 3,
                      style: BorderStyle.solid,
                      color: _selectedIndex == index
                          ? AppColor.red
                          : Colors.transparent),
                  bottom: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none)),
          child: Text(
            label,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color:
                    index == _selectedIndex ? AppColor.white : AppColor.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        EpisodesScreen(),
        Center(
          child: Text(
            'Collection',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Text(
            'More Like This',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Text(
            'Trailers & More',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
