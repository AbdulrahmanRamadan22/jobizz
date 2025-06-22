import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/core/theming/colors.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.imageKey,
    this.withoutHeight = false,
    this.withoutWidth = false,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.maxSizeMB = 2, // Add max size parameter (not enforced here)
  });

  final String imageUrl;
  final String imageKey;
  final bool withoutHeight;
  final bool withoutWidth;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double maxSizeMB;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheKey: imageKey,
      fit: fit,
      height: withoutHeight ? null : height,
      width: withoutWidth ? null : width,
      memCacheWidth: (width != null ? (width! * 2).toInt() : null),
      memCacheHeight: (height != null ? (height! * 2).toInt() : null),
      placeholder: (context, url) => 
          placeholder ?? const CircularProgressIndicator(
            color: ColorsApp.mainBlue,
          ),
      errorWidget: (context, url, error) => errorWidget ?? Container(
        color: Colors.grey[300],
        child: const Icon(
          Icons.person,
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }
}