import 'package:flutter/material.dart';
import 'package:imdb_movie_application/colors.dart';
import 'package:imdb_movie_application/images.dart';
import 'package:imdb_movie_application/provider/imdb_movie_provider.dart';
import 'package:imdb_movie_application/screen/imdb_screen/widgets/imdb_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'imdb_detailed_screen.dart';

class ImdbMovieScreen extends StatefulWidget {
  const ImdbMovieScreen({Key? key}) : super(key: key);

  @override
  _ImdbMovieScreenState createState() => _ImdbMovieScreenState();
}

class _ImdbMovieScreenState extends State<ImdbMovieScreen> {
  late RefreshController _controller;
  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _controller = RefreshController();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 100),
              Image(
                image: Pngs.bgBloop,
              ),
            ],
          ),
          ChangeNotifierProvider(
            create: (context) => ImdbMovieProvider(),
            builder: (context, child) => Consumer<ImdbMovieProvider>(
              builder: (context, state, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: _editingController,
                      style: TextStyle(color: Colors.white70),
                      onFieldSubmitted: (val) {
                        state.getDataForThisMovie(movieTitle: val);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        hintText: "Search For Movies",
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        prefixIcon: IconButton(
                          onPressed: () {
                            state.getDataForThisMovie(
                                movieTitle: _editingController.text);
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          icon: Image(
                            image: Pngs.search,
                            color: Colors.grey,
                            height: 22,
                            width: 22,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _editingController.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          icon: Image(
                            image: Pngs.cross,
                            color: Colors.grey,
                            height: 22,
                            width: 22,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: kDarkBlue)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: kDarkBlue)),
                      ),
                    ),
                  ),
                  if (state.isLoadingData) ...[
                    Center(child: CircularProgressIndicator())
                  ],
                  if (state.imdbData.isEmpty &&
                      !state.isLoadingData &&
                      !state.isIntial &&
                      !state.hasSuccessfullyLoadedData) ...[
                    Center(
                      child: Text(
                        "Try again with different movie name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                  if (state.imdbData.isNotEmpty) ...[
                    SizedBox(height: 40),
                    Expanded(
                      child: SmartRefresher(
                        controller: _controller,
                        physics: BouncingScrollPhysics(),
                        enablePullUp: true,
                        enablePullDown: false,
                        onLoading: () async {
                          _controller..requestLoading();
                          await state.loadMoreData();
                          _controller.loadComplete();
                        },
                        child: ListView.builder(
                          itemCount: state.imdbData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  maintainState: true,
                                  builder: (context) => ImdbDetailedScreen(
                                    data: state.imdbData[i],
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: ImdbCard(
                                  indexOfData: i,
                                  duration: state.imdbData[i].runtime,
                                  title: state.imdbData[i].title,
                                  poster: state.imdbData[i].poster,
                                  imdbRating: state.imdbData[i].imdbRating,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
