import 'package:flutter/material.dart';

class HadethContentWidget extends StatelessWidget {
  String content;

  HadethContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: SingleChildScrollView(
          child: Text(
        content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 18,
            ),
      )),
    );
  }
}
