import 'package:flutter/material.dart';

class MovieDetailsTitleView extends StatelessWidget {
  const MovieDetailsTitleView(
      {Key? key,
      required this.title,
      required this.voteAverage,
      required this.maxVote})
      : super(key: key);

  final String title;
  final double voteAverage;
  final double maxVote;

  static const _itemPadding = EdgeInsets.fromLTRB(20, 10, 20, 10);
  static const _itemTitleMaxLines = 2;
  static const double _itemTitleFontSize = 20;
  static const double _circularProgressViewSize = 34;
  static const double _circularProgressViewStrokeWidth = 5;
  static const double _voteFontSize = 12;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _itemPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: _itemTitleMaxLines,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: _itemTitleFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: _circularProgressViewSize,
            width: _circularProgressViewSize,
            child: Stack(
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.black26,
                  value: voteAverage / maxVote,
                  strokeWidth: _circularProgressViewStrokeWidth,
                ),
                Center(
                    child: Text(
                  '$voteAverage',
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: _voteFontSize,
                      fontWeight: FontWeight.bold),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
