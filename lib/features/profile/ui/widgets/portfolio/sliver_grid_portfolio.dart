import 'package:flutter/material.dart';

import '../../../data/models/profile_response_model.dart';
import 'portfolio_item_image.dart';

class SliverGridPortfolioImages extends StatelessWidget {
  const SliverGridPortfolioImages({
    super.key,
    this.images,
  });

  final List<PortfolioImageItem>? images;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: images!.length >= 6? 6 : images!.length,
        
        (context, index) {
          return PortfolioItemImage(
            portfolioImageItem: images?[index],
          );
        },
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
      ),
    );
  }
}
