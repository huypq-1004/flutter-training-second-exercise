import 'package:flutter/material.dart';

class MovieDetailsDescriptionView extends StatelessWidget {
  const MovieDetailsDescriptionView({Key? key, required this.description})
      : super(key: key);

  final String description;

  static const _itemPadding = EdgeInsets.fromLTRB(20, 15, 20, 15);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _itemPadding,
      child: Text(
        description,
      ),
    );
  }
}
