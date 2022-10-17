import 'package:example/views/widgets/markdown_view.dart';
import 'package:example/views/layouts/app_layout.dart';
import 'package:fatima/ui/buttons/src/styles/filled_button_style.dart';
import 'package:fatima/ui/buttons/src/styles/outline_button_style.dart';
import 'package:fatima/ui/buttons/src/styles/text_button_style.dart';
import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        selected: "Overview",
        body: Row(children: tests(context)
            // [
            //   MarkdownView("overview_en.md"),
            // ],
            ));
  }

  List<Widget> tests(BuildContext context) {
    return [
      Button.outlined(
        style: OutlinedButtonStyle(foregroundColor: Colors.green),
        child: Text("outlined button"),
        onPressed: () {},
      ),
      SizedBox(
        width: 10,
      ),
      Button.text(
        style: TextButtonStyle(foregroundColor: Colors.green),
        child: Text("text button"),
        onPressed: () {},
      ),
      SizedBox(
        width: 10,
      ),
      Button.filled(
        style: FilledButtonStyle(backgroundColor: Colors.green),
        onPressed: () {},
        child: Text("filled button"),
        // style: FilledButtonStyle,
        // ui.Button.filled(
        //     // onPressed: () {},
      ),
      SizedBox(
        width: 10,
      ),
      Button(
        type: ButtonType.text,
        onPressed: () {},
        child: Text("txt button"),
        // style: FilledButtonStyle,
        // ui.Button.filled(
        //     // onPressed: () {},
      ),
    ];
  }
}
