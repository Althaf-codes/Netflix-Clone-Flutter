// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netflix_clone/blocs/recent_movie/recent_movie_bloc.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/widgets/movie_card.dart';
import 'package:netflix_clone/widgets/movie_detail_screen.dart';

class MovieListview extends StatelessWidget {
  ScrollController scrollController;
  List<Poster> posters;
  MovieListview({
    Key? key,
    required this.scrollController,
    required this.posters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: posters.length,
          itemBuilder: (context, index) {
            Poster poster = posters[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                              videoId: poster.id,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MovieCard(
                  poster: poster,
                  // 'https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/6408f6e7b5811271dc883aa8_batman-min.png',
                  height: 150,
                  width: 150,
                  // 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411'
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
