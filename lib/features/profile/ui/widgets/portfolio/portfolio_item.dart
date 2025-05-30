import 'package:flutter/material.dart';

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8),
       ),
      child: Image.asset(
        'assets/images/test_proftolio.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
