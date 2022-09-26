import 'package:example/views/widgets/markdown_view.dart';
import 'package:example/views/layouts/app_layout.dart';
import 'package:flutter/material.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Overview", body: MarkdownView("overview_en.md"));
  }
}
