import 'package:flutter/material.dart';
import 'package:netflix_clone/models/poster_model.dart';

import 'package:netflix_clone/widgets/episode_card.dart';

class RelatedVideosScreen extends StatefulWidget {
  final List<Poster> relatedVideos;
  const RelatedVideosScreen({
    Key? key,
    required this.relatedVideos,
  }) : super(key: key);

  @override
  State<RelatedVideosScreen> createState() => _RelatedVideosScreenState();
}

class _RelatedVideosScreenState extends State<RelatedVideosScreen> {
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
    return Column(
      children: [
        ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: widget.relatedVideos.length,
            itemBuilder: (context, index) {
              Poster poster = widget.relatedVideos[index];
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
