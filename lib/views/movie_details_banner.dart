import 'package:flutter/material.dart';
import 'backdrop_clipper.dart';

class MovieDetailsBanner extends StatelessWidget {
  const MovieDetailsBanner(
      {Key? key, required this.posterURL, required this.backdropURL})
      : super(key: key);

  final String posterURL;
  final String backdropURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: BackdropClipper(),
          child: Image.network(
            backdropURL,
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
            child: Image.network(posterURL))
      ],
    );
  }
}
