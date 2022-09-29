import 'package:example/views/layouts/app_layout.dart';
import 'package:example/views/widgets/markdown_view.dart';
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

class FatimaDialogPage extends StatelessWidget {
  const FatimaDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        selected: "Dialog",
        body: MarkdownView(
          "dialog_en.md",
          widgets: {'example': example()},
        ));
  }

  Widget example() {
    return Row(
      children: [
        ElevatedButton(onPressed: () {}, child: Text("simple dialog")),
        ElevatedButton(onPressed: () {}, child: Text("simple dialog")),
      ],
    );
  }
}
