import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class AppQuillEditor {
  static Widget editor(QuillController controller) => QuillEditor.basic(
    controller: controller,
    config: const QuillEditorConfig(
      placeholder: 'Start writing your article...',
      scrollable: true,
      padding: EdgeInsets.all(8.0),
      autoFocus: true,
    ),
  );

  static Widget toolbar(QuillController controller) => QuillSimpleToolbar(
    controller: controller,
    config: QuillSimpleToolbarConfig(
      multiRowsDisplay: false,
      showBoldButton: true,
      showItalicButton: true,
      showUnderLineButton: true,
      showHeaderStyle: true,
      toolbarSize: 36, // Previously toolbarHeight
      customButtons: [
        QuillToolbarCustomButtonOptions(
          icon: const Icon(Icons.title),
          tooltip: 'Heading 1',
          onPressed: () {
            controller.formatSelection(Attribute.h1);
          },
        ),
        QuillToolbarCustomButtonOptions(
          icon: const Icon(Icons.subtitles),
          tooltip: 'Heading 2',
          onPressed: () {
            controller.formatSelection(Attribute.h2);
          },
        ),
        QuillToolbarCustomButtonOptions(
          icon: const Icon(Icons.text_fields),
          tooltip: 'Body Text',
          onPressed: () {
            controller.formatSelection(Attribute.header); // Clear header
            controller.formatSelection(
              Attribute.fromKeyValue('font', 'Roboto'),
            );
            controller.formatSelection(Attribute.fromKeyValue('size', 16));
          },
        ),
      ],
    ),
  );
}
