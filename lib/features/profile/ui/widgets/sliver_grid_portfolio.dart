import 'package:flutter/material.dart';

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
          return Image.asset(
            'assets/images/photo_person.png',
            fit: BoxFit.cover,
          );
        },
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        crossAxisSpacing: 15, // المسافة بين الأعمدة
        mainAxisSpacing: 10, // المسافة بين الصفوف
      ),
    );
  }
}
