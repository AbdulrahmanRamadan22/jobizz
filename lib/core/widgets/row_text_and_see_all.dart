// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RowTextAndSeeAll extends StatelessWidget {
  const RowTextAndSeeAll({
    super.key,
    required this.text,
    required this.seeAllText,
    required this.textStyle,
    required this.seeAllTextStyle,
    required this.onPressed,
  });
  final String text;
  final String seeAllText;
  final TextStyle textStyle;
  final TextStyle seeAllTextStyle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Text(
            text,
            style: textStyle,
          ),
          Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              seeAllText,
              style: seeAllTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}