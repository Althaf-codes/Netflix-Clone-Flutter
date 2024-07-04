// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_clone/constant/assets.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/models/poster_model.dart';

class SearchResultMovieCard extends StatelessWidget {
  final double height;
  final double width;

  // String url;
  Poster poster;

  SearchResultMovieCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.poster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(12))
            // image:
            //     DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
            ),
        child: Stack(clipBehavior: Clip.none, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              poster.thumbnail,
              width: 150,
              alignment: Alignment.center,
              fit: BoxFit.fill,
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
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                Assets.netflixLogo,
                height: 18,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          poster.isTop10
              ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
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
                )
              : const SizedBox.shrink(),
          poster.hasNewEpisodes
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 15,
                    width: 80,
                    color: AppColor.redDark1,
                    child: Center(
                      child: Text(
                        'NEW EPISODES',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ]));
  }
}
