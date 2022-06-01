import 'package:flutter/material.dart';

import '../constants.dart';

class MovieDetailsReviewsTrailersView extends StatelessWidget {
  const MovieDetailsReviewsTrailersView(
      {Key? key, this.onReviewsTapped, this.onTrailerTapped})
      : super(key: key);

  final void Function()? onReviewsTapped;
  final void Function()? onTrailerTapped;

  static const double _boxWidth = 70;
  static const double _boxHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(height: 1, color: Colors.black12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: onTrailerTapped,
              child: SizedBox(
                width: _boxWidth,
                height: _boxHeight,
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
                    Text(AppStrings.reviews)
                  ],
                ),
              )),
          Container(
            width: 1,
            height: 66,
            color: Colors.black12,
          ),
          GestureDetector(
              onTap: onTrailerTapped,
              child: SizedBox(
                width: _boxWidth,
                height: _boxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_circle_fill, color: Colors.red),
                    SizedBox(
                      height: 2,
                    ),
                    Text(AppStrings.trailers)
                  ],
                ),
              )),
        ],
      ),
      Container(height: 1, color: Colors.black12),
    ]);
  }
}
