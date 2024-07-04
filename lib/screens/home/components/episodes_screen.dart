// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/models/poster_model.dart';

import 'package:netflix_clone/models/video_model.dart';
import 'package:netflix_clone/widgets/episode_card.dart';

class EpisodesScreen extends StatefulWidget {
  final List<Season> seasons;
  const EpisodesScreen({
    Key? key,
    required this.seasons,
  }) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int seasonIndex = widget.seasons.length;
    List<String> items = [];
    for (int i = 0; i < seasonIndex; i++) {
      items.add('Season-${i + 1}');
    }
    String dropDownVal = items[0];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton(
                dropdownColor: AppColor.greyLight1,
                value: dropDownVal,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style:
                          const TextStyle(color: AppColor.white, fontSize: 12),
                    ),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  setState(() {
                    dropDownVal = newVal!;
                  });
                }),
          ),
        ),
        ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount:
                widget.seasons[items.indexOf(dropDownVal)].episodes.length,
            itemBuilder: (context, index) {
              Poster poster = widget.seasons.first.episodes[index];
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: EpisodeCard(
                  poster: poster,
                  index: index,
                ),
              );
            }),
      ],
    );
  }
}
