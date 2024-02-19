// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetWorkImage extends StatelessWidget {
  const CustomNetWorkImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.contain,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
