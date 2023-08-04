import 'package:flutter/material.dart';

class PostcodeText extends StatelessWidget {
  const PostcodeText({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.31,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromRGBO(195, 195, 195, 1)),
            )),
        Text(
          content,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
