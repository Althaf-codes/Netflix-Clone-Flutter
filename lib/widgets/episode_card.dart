import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/colors.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 170,
      // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      // color: Colors.blue,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(height: 80, width: 140, color: AppColor.greyDark1),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Game Changer',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColor.white,
                              fontWeight: FontWeight.w200),
                        ),
                        Text(
                          '37m',
                          style: TextStyle(
                              fontSize: 11,
                              color: AppColor.greyLight1,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return.',
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColor.white,
                      fontWeight: FontWeight.w200,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
