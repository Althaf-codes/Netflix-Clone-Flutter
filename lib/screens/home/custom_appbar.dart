// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/assets.dart';
import 'package:netflix_clone/constant/colors.dart';

class CustomAppbar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppbar({
    Key? key,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Assets.netflixLogo,
                fit: BoxFit.cover,
                height: 30,
                width: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              _AppBarButton("TV Shows", () {}),
              const Spacer(),
              _AppBarButton("Movies", () {}),
              const Spacer(),
              _AppBarButton('My List', () async {
                // await showDialog(
                //     context: context,
                //     builder: (context) => const WatchlistScreen());
              }),
            ],
          ))
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function function;

  const _AppBarButton(this.title, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
