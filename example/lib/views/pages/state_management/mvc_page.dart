import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class MVCPage extends StatelessWidget {
  const MVCPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "MVC Structure", body: MarkdownView("usage_en.md"));
  }
}
