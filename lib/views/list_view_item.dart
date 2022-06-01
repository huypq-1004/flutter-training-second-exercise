import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(
      {Key? key,
      required this.title,
      required this.overview,
      required this.imageURL,
      this.onTap})
      : super(key: key);

  final String title;
  final String overview;
  final String imageURL;
  final void Function()? onTap;

  static const _titleMaxLines = 2;
  static const _descriptionMaxLines = 5;
  static const double _descriptionFontSize = 13;
  static const double _titleFontSize = 22;
  static const double _itemHeight = 170;
  static const EdgeInsets _contentPadding = EdgeInsets.fromLTRB(20, 10, 20, 10);
  static const double _imageHeight = 150;
  static const double _imageWidth = 100;
  static const double _imageAndTextSpacing = 12;
  static const double _titleAndDescriptionSpacing = 8;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: _itemHeight,
          child: Padding(
            padding: _contentPadding,
            child: Row(children: [
              Image.network(
                imageURL,
                width: _imageWidth,
                height: _imageHeight,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: _imageAndTextSpacing,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: _titleMaxLines,
                    style: const TextStyle(fontSize: _titleFontSize),
                  ),
                  const SizedBox(
                    height: _titleAndDescriptionSpacing,
                  ),
                  Text(
                    overview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: _descriptionMaxLines,
                    style: const TextStyle(fontSize: _descriptionFontSize),
                  )
                ],
              ))
            ]),
          )),
    );
  }
}
