import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:flutter/material.dart';

class RoutingSystemPage extends StatelessWidget {
  const RoutingSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        selected: "Routing System", body: MarkdownView("overview_en.md"));
  }
}
