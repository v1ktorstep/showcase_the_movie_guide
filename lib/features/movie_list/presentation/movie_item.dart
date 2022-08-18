import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class MovieItem extends StatelessWidget {
  final String posterUrl;
  final String title;

  const MovieItem({
    Key? key,
    required this.posterUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2 / 3,
          child: CachedNetworkImage(
            imageUrl: posterUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            title,
            overflow: TextOverflow.clip,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
