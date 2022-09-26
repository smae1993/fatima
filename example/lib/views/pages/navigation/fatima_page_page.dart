import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class FatimaPagePage extends StatelessWidget {
  const FatimaPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Page", body: MarkdownView("overview_en.md"));
  }
}
