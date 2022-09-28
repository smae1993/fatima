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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                // height: 500,
                child: const MarkdownView("overview_en.md"),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Fatima.dialog(SizedBox(
                          width: 100,
                          height: 100,
                          child: Container(color: Colors.amberAccent),
                        ));
                      },
                      child: Text("SimpleDialog"))
                ],
              )
            ],
          ),
        ));
  }
}
