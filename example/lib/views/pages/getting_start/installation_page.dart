import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Installation", body: MarkdownView("installation_en.md"));
  }
}
