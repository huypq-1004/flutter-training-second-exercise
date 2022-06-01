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
          _TextBox(title: AppStrings.genre, subtitle: genres),
          Container(width: 1, height: 1, color: Colors.transparent),
          _TextBox(title: AppStrings.release, subtitle: releaseDate),
        ],
      ),
    );
  }
}

class _TextBox extends StatelessWidget {
  const _TextBox({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  static const double _itemWidth = 150;
  static const double _titleFontSize = 18;
  static const double _subtitleFontSize = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _itemWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: _titleFontSize),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: _subtitleFontSize),
          )
        ],
      ),
    );
  }
}
