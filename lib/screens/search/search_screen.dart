import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/constant/my_flutter_app_icons.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/screens/search/component/suggested_movie_card.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _textEditingController;
  late ScrollController _scrollController;
  late ScrollController _suggestedScrollController;
  late ScrollController _searchScrollController;

  bool isTapped = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _suggestedScrollController = ScrollController();
    _searchScrollController = ScrollController();
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: isTapped
                        ? MediaQuery.of(context).size.width * 0.75
                        : MediaQuery.of(context).size.width * 0.9,
                    // padding: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: AppColor.greyDark1,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextField(
                      // showCursor: true,
                      style: TextStyle(
                        color: AppColor.white,
                      ),
                      onTap: () {
                        setState(() {
                          isTapped = true;
                        });
                      },
                      textAlign: isTapped ? TextAlign.start : TextAlign.center,
                      textAlignVertical: TextAlignVertical.top,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          focusColor: Colors.transparent,
                          alignLabelWithHint: true,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: AppColor.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          suffixIcon: isTapped
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _textEditingController.text = '';
                                      isTapped = false;
                                    });
                                  },
                                  icon: const Icon(
                                    MyFlutterApp.cross,
                                    color: AppColor.white,
                                    size: 15,
                                  ),
                                )
                              : SizedBox.shrink(),
                          prefixIcon: Icon(
                            MyFlutterApp.search,
                            size: 14,
                            color: AppColor.grey,
                          )),
                    ),
                  ),
                  isTapped
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isTapped = false;
                                });
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1),
                              )),
                        )
                      : SizedBox.shrink()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Movies & TV',
                style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              !isTapped
                  ? ListView.builder(
                      shrinkWrap: true,
                      controller: _suggestedScrollController,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            // color: Colors.deepPurple,
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SuggestedMovieCard(
                                  url:
                                      'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
                                ),
                                // MovieCard(
                                //     height: 60,
                                //     width: 120,
                                //     url:
                                //         'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg'),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'The Black Panther',
                                  style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_circle_outline_outlined,
                                      size: 40,
                                      color: AppColor.white,
                                    ))
                              ],
                            ),
                          ),
                        );
                      })
                  : SizedBox.shrink(),
              isTapped
                  ? GridView.builder(
                      shrinkWrap: true,
                      controller: _searchScrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          height: 150,
                          width: 150,
                          poster: Poster(
                              id: '',
                              title: "Mystery at the Manor",
                              description:
                                  "A detective solves a mystery at a secluded manor.",
                              genre: ["Mystery", "Drama"],
                              videoType: "Movie",
                              hasNewEpisodes: false,
                              isTop10: true,
                              duration: 105,
                              rating: 4.5,
                              views: 83400,
                              thumbnail:
                                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411'),
                        );
                      })
                  : SizedBox.shrink()
            ]),
          )),
    );
  }
}
