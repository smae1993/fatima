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
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';

    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }
    return SizedBox(
        width: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .width,
        child: Row(
          children: [
            Expanded(
                child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              clipBehavior: Clip.antiAlias,
              child: HighlightView(
                tabSize: 4,
                // The original code to be highlighted
                element.textContent,

                // Specify language
                // It is recommended to give it a value for performance
                language: language,

                // Specify highlight theme
                // All available themes are listed in `themes` folder
                theme: Fatima.isDarkMode ? darkTheme : githubTheme,
                // theme: Fatima.isDarkMode ? githubTheme : atomOneLightTheme,
                // Specify padding
                padding: const EdgeInsets.all(8),

                // Specify text style
                textStyle: GoogleFonts.robotoMono(),
              ),
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
                  // copied successfully
                },
                shape: const CircleBorder(),
                child: const Icon(Icons.copy)),
          ],
        ));
  }
}
