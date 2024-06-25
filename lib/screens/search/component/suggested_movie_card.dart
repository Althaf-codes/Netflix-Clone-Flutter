import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/assets.dart';

import 'package:netflix_clone/constant/colors.dart';

class SuggestedMovieCard extends StatelessWidget {
  String url;
  SuggestedMovieCard({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 100,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(8))
            // image:
            //     DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
            ),
        child: Stack(clipBehavior: Clip.none, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              url,
              width: 150,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                    colors: [Colors.black38, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          Container(
            height: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                    colors: [Colors.black26, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.center)),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Image.asset(
                Assets.netflixLogo,
                color: AppColor.redDark1,
                height: 12,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 18,
              width: 12,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(12)),
                  color: AppColor.redDark1),
              child: const Column(
                children: [
                  Text(
                    'Top',
                    style: TextStyle(color: Colors.white, fontSize: 6),
                  ),
                  Text(
                    '10',
                    style: TextStyle(color: Colors.white, fontSize: 6),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 10,
              width: 60,
              color: AppColor.redDark1,
              child: Center(
                child: Text(
                  'NEW EPISODES',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 6,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ]));
  }
}
