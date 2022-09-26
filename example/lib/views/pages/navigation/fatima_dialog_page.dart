import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class FatimaDialogPage extends StatelessWidget {
  const FatimaDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Dialog", body: MarkdownView("overview_en.md"));
  }
}
