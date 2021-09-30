import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class ItemBox extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final Function onTap;

  const ItemBox(
      {Key? key,
      this.width = 300,
      this.height = 150,
      required this.image,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: OctoImage(
                      image: CachedNetworkImageProvider(image),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                          'LAI#u-9XM[D\$GdIU4oIA-sWFxwRl'),
                      errorBuilder: OctoError.icon(color: Colors.grey[400]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () => onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
