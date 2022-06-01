import 'package:flutter/material.dart';

class MovieDetailsDescriptionView extends StatelessWidget {
  const MovieDetailsDescriptionView({Key? key, required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Text(
        description,
      ),
    );
  }
}
