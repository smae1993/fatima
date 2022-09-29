import 'package:example/controllers/code_element_builder.dart';
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownView extends StatelessWidget {
  const MarkdownView(this.fileName, {this.widgets, super.key});
  final String fileName;

  final Map<String, Widget>? widgets;

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
          return Markdown(
            data: snapshot.data!,
            onTapLink: (text, href, title) {
              try {
                Fatima.offNamed(href!);
              } catch (e) {
                Fatima.log(
                  e.toString(),
                  isError: true,
                );
              }
            },
            builders: {
              'code': CodeElementBuilder(widgets: widgets),
            },
          );
        }
      },
    );
  }
}
