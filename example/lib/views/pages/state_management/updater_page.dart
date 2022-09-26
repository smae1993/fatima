import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class UpdaterPage extends StatelessWidget {
  const UpdaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Updater", body: MarkdownView("usage_en.md"));
  }
}
