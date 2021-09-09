import 'package:flutter/material.dart';
import 'package:imdb_movie_application/provider/imdb_movie_provider.dart';
import 'package:imdb_movie_application/screen/imdb_screen/widgets/imdb_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      body: ChangeNotifierProvider(
        create: (context) => ImdbMovieProvider(),
        builder: (context, child) => Consumer<ImdbMovieProvider>(
          builder: (context, state, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _editingController,
                  onFieldSubmitted: (val) {
                    state.getDataForThisMovie(movieTitle: val);
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    hintText: "Search For Movies",
                    suffixIcon: IconButton(
                        onPressed: () {
                          state.getDataForThisMovie(
                              movieTitle: _editingController.text);
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        icon: Icon(Icons.search)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              if (state.isLoadingData) ...[
                Center(child: CircularProgressIndicator())
              ],
              if (state.movieData?.search == null &&
                  !state.isLoadingData &&
                  !state.isIntial &&
                  !state.hasSuccessfullyLoadedData) ...[
                Center(
                  child: Text(
                    "Try again with different movie name",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
              if (state.movieData?.search != null) ...[
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
                      itemCount: state.movieData?.search?.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: ImdbCard(
                          title: state.movieData!.search![i].title,
                          type: state.movieData!.search![i].type,
                          year: state.movieData!.search![i].year,
                          poster: state.movieData!.search![i].poster,
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
    );
  }
}
