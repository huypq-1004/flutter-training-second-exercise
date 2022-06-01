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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: 170,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(children: [
              Image.network(
                imageURL,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    overview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: const TextStyle(fontSize: 13),
                  )
                ],
              ))
            ]),
          )),
    );
  }
}
