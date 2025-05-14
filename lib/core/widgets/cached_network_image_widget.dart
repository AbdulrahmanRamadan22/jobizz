import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget(
      {super.key,
      required this.imageUrl,
      required this.imageKey,
      this.withoutHeight = false,
      this.withoutWidth = false,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.placeholder,
      this.errorWidget});

  final String imageUrl;
  final String imageKey;
  final bool withoutHeight;
  final bool withoutWidth;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      cacheKey: imageKey,
      height: withoutHeight ? null : height,
      width: withoutWidth ? null : width,
      placeholder: (context, url) =>
          placeholder ??
          const CircularProgressIndicator(
            color: ColorsApp.mainBlue,
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 25,
          ),
    );
  }
}
