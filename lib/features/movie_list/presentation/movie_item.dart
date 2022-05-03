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

  final _posterSize = const Size(120, 120 * 1.5);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: posterUrl,
          fit: BoxFit.cover,
          width: _posterSize.width,
          height: _posterSize.height,
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
