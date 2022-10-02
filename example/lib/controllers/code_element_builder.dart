// ignore_for_file: depend_on_referenced_packages
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/dark.dart';
import 'package:flutter_highlighter/themes/github.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:google_fonts/google_fonts.dart';

class CodeElementBuilder extends MarkdownElementBuilder {
  CodeElementBuilder({this.widgets});
  final Map<String, Widget>? widgets;

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';

    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }

    if (widgets != null && widgets!.containsKey(language)) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: widgets![language],
      );
    } else {
      return SizedBox(
          width: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .size
              .width,
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              Expanded(
                  child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                clipBehavior: Clip.antiAlias,
                child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: HighlightView(
                      tabSize: 4,
                      element.textContent,
                      language: language,
                      theme: Fatima.isDarkMode ? darkTheme : githubTheme,
                      padding: const EdgeInsets.all(8),
                      textStyle: GoogleFonts.robotoMono(),
                    )),
              )),
              MaterialButton(
                  padding: const EdgeInsets.all(15),
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: element.textContent));
                    Fatima.snackbar("", "Code Copied To Clipboard Successful",
                        snackPosition: SnackPosition.bottom,
                        borderRadius: 5,
                        margin: const EdgeInsets.all(10));
                  },
                  shape: const CircleBorder(),
                  child: const Icon(Icons.copy)),
            ],
          ));
    }
  }
}
