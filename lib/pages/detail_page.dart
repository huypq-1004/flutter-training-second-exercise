import 'package:flutter/material.dart';
import 'package:my_list/view_models/detail_page_view_model.dart';
import 'package:my_list/views/movie_details_banner.dart';
import 'package:my_list/views/movie_details_title_view.dart';
import 'package:my_list/views/horizontal_separator_line.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../views/movie_details_description_view.dart';
import '../views/movie_details_genre_release_view.dart';
import '../views/movie_details_reviews_trailers_view.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const double _maxVote = 10;

  void _onReviewsTapped() {}

  void _onTrailersTapped() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.detailPageTitle,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MovieDetailsBanner(
                posterURL: context.watch<DetailPageViewModel>().movie.posterURL,
                backdropURL:
                    context.watch<DetailPageViewModel>().movie.backdropURL),
            MovieDetailsTitleView(
              title: context.watch<DetailPageViewModel>().movie.title,
              voteAverage:
                  context.watch<DetailPageViewModel>().movie.voteAverage,
              maxVote: _maxVote,
            ),
            MovieDetailsReviewsTrailersView(
              onReviewsTapped: _onReviewsTapped,
              onTrailerTapped: _onTrailersTapped,
            ),
            MovieDetailsGenreReleaseView(
                genres: context
                    .watch<DetailPageViewModel>()
                    .movie
                    .getGenres(context.read<DetailPageViewModel>().movieGenres),
                releaseDate:
                    context.watch<DetailPageViewModel>().movie.releaseDate),
            const HorizontalSeparatorLine(),
            MovieDetailsDescriptionView(
              description: context.watch<DetailPageViewModel>().movie.overview,
            ),
          ],
        )));
  }
}
