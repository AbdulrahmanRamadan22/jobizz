import 'package:flutter/material.dart';

import 'portfolio_item.dart';

class SliverGridPortfolio extends StatelessWidget {
  const SliverGridPortfolio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 4,
        (context, index) {
          return PortfolioItem();
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

