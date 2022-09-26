import 'package:example/controllers/code_element_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownView extends StatelessWidget {
  const MarkdownView(this.fileName, {super.key});
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString('assets/docs/$fileName'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Markdown(data: snapshot.data!, builders: {
            'code': CodeElementBuilder(),
          });
        }
      },
    );
  }
}
