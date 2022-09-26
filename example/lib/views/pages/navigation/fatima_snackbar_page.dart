import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class FatimaSnackbarPage extends StatelessWidget {
  const FatimaSnackbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Snackbar", body: MarkdownView("overview_en.md"));
  }
}
