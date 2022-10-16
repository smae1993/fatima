import 'package:example/views/widgets/markdown_view.dart';
import 'package:example/views/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        selected: "Overview",
        body: Column(children: tests()
            // [
            //   MarkdownView("overview_en.md"),
            // ],
            ));
  }

  List<Widget> tests() {
    return [
      Button(
        type: ButtonType.text,
        onPressed: () {},
        child: Text("Hi"),
        // style: FilledButtonStyle,
        // ui.Button.filled(
        //     // onPressed: () {},
      ),
    ];
  }
}
