import 'package:flutter/material.dart';
import 'package:my_list/view_models/detail_page_view_model.dart';
import 'package:my_list/views/backdrop_clipper.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Movie Detail',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: BackdropClipper(),
                  child: Image.network(
                    context.watch<DetailPageViewModel>().movie.backdropURL,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    width: 100,
                    height: 150,
                    bottom: 0,
                    left: 20,
                    child: Image.network(
                        context.watch<DetailPageViewModel>().movie.posterURL))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      context.watch<DetailPageViewModel>().movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 34,
                    width: 34,
                    child: Stack(
                      children: [
                        CircularProgressIndicator(
                          color: Colors.black,
                          backgroundColor: Colors.black26,
                          value: context
                                  .watch<DetailPageViewModel>()
                                  .movie
                                  .voteAverage /
                              10.0,
                          strokeWidth: 5,
                        ),
                        Center(
                            child: Text(
                          '${context.watch<DetailPageViewModel>().movie.voteAverage}',
                          style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(height: 1, color: Colors.black12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    child: SizedBox(
                  width: 70,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.reviews_rounded,
                        color: Colors.cyan,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Reviews')
                    ],
                  ),
                )),
                Container(
                  width: 1,
                  height: 66,
                  color: Colors.black12,
                ),
                GestureDetector(
                    child: SizedBox(
                  width: 70,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.play_circle_fill, color: Colors.red),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Trailers')
                    ],
                  ),
                )),
              ],
            ),
            Container(height: 1, color: Colors.black12),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Genre',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          context.watch<DetailPageViewModel>().movie.getGenres(
                              context.read<DetailPageViewModel>().movieGenres),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(width: 1, height: 1, color: Colors.transparent),
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Release',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          context
                              .watch<DetailPageViewModel>()
                              .movie
                              .releaseDate,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: Colors.black12),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Text(
                context.watch<DetailPageViewModel>().movie.overview,
              ),
            )
          ],
        ));
  }
}
