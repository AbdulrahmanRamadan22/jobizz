import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/cached_network_image_widget.dart';
import '../../../data/models/profile_response_model.dart';

class PortfolioItemImage extends StatelessWidget {
  const PortfolioItemImage({super.key, this.portfolioImageItem});

  final PortfolioImageItem? portfolioImageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(12.r),
      ),
      child: CachedNetworkImageWidget(
        imageKey: "${portfolioImageItem?.path}",
        imageUrl: "${portfolioImageItem?.path}",

        // "${portfolioImageItem?.path}",
        fit: BoxFit.cover,
      ),
    );
  }
}
