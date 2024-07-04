// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/models/poster_model.dart';

class EpisodeCard extends StatelessWidget {
  final Poster poster;
  final int index;
  const EpisodeCard({
    Key? key,
    required this.poster,
    required this.index,
  }) : super(key: key);

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
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.37, //140,
                    decoration: BoxDecoration(
                        color: AppColor.greyDark1,
                        image: DecorationImage(
                            image: NetworkImage(poster.thumbnail),
                            fit: BoxFit.cover)),
                  ),
                  // const SizedBox(
                  //   width: 5,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$index. ${poster.title}',
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColor.white,
                              fontWeight: FontWeight.w200,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          '${poster.duration}m',
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
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  poster.description,
                  maxLines: 3,
                  style: const TextStyle(
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
