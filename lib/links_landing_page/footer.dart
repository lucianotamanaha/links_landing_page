import 'package:flutter/material.dart';
import 'package:links_landing_page/constants.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Made in Flutter',
          style: TextStyle(fontSize: 19),
        ),
        SizedBox(width: 8),
        Image.network(
          flutterIcon,
          width: 25,
        )
      ],
    );
  }
}
