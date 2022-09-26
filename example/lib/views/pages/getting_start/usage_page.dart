import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class UsagePage extends StatelessWidget {
  const UsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Usage", body: MarkdownView("usage_en.md"));
  }
}
