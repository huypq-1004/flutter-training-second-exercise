import 'package:flutter/material.dart';

import '../constants.dart';

class MovieDetailsGenreReleaseView extends StatelessWidget {
  const MovieDetailsGenreReleaseView(
      {Key? key, required this.genres, required this.releaseDate})
      : super(key: key);

  final String genres;
  final String releaseDate;

  static const _itemPadding = EdgeInsets.fromLTRB(0, 10, 0, 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _itemPadding,
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
                  AppStrings.genre,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  genres,
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
                  AppStrings.release,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  releaseDate,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
