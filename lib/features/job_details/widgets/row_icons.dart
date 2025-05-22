import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobizz/core/theming/colors.dart';

class RowIcons extends StatelessWidget {
  const RowIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
        ),
        // Bookmark button
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_add),
          color: ColorsApp.whiteColor,
        ),
      ],
    );
  }
}
