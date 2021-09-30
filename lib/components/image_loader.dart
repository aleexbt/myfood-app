import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class ImageLoader extends StatelessWidget {
  final String src;
  final double width;
  final double height;

  const ImageLoader(
      {Key? key, required this.src, this.width = 100, this.height = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      width: width,
      height: height,
      image: CachedNetworkImageProvider(src),
      placeholderBuilder:
          OctoPlaceholder.blurHash('LAI#u-9XM[D\$GdIU4oIA-sWFxwRl'),
      errorBuilder: OctoError.icon(color: Colors.grey[400]),
      fit: BoxFit.cover,
    );
  }
}
