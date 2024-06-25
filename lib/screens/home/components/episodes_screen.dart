// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_clone/widgets/episode_card.dart';

class EpisodesScreen extends StatefulWidget {
  EpisodesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: EpisodeCard(),
          );
        });
  }
}
