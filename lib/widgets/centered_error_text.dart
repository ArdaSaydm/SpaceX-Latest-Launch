import 'package:flutter/material.dart';

// Vertically and Horizontally centered Error Text
class CenteredErrorText extends StatelessWidget {
  final String? text;

  CenteredErrorText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text ?? "There are some issues!",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
