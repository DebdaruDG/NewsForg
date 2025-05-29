import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'helper_widget.dart';

class ArticleEditor extends StatefulWidget {
  const ArticleEditor({super.key});

  @override
  ArticleEditorState createState() => ArticleEditorState();
}

class ArticleEditorState extends State<ArticleEditor> {
  final QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppQuillEditor.toolbar(_controller),
        AppQuillEditor.editor(_controller),
      ],
    );

    // Column(
    //   children: [
    //     // Customizable Toolbar
    //     QuillSimpleToolbar(
    //       controller: _controller,
    //       config: QuillSimpleToolbarConfig(
    //         multiRowsDisplay: false,
    //         showBoldButton: true,
    //         showItalicButton: true,
    //         showUnderLineButton: true,
    //         showHeaderStyle: true,
    //         // Define custom styles for heading, subheading, and body
    //         customButtons: [
    //           QuillToolbarCustomButtonOptions(
    //             icon: Icon(Icons.title),
    //             onPressed: () {
    //               _controller.formatSelection(Attribute.h1); // Heading 1
    //             },
    //           ),
    //           QuillToolbarCustomButtonOptions(
    //             icon: Icon(Icons.subtitles),
    //             onPressed: () {
    //               _controller.formatSelection(Attribute.h2); // Heading 2
    //             },
    //           ),
    //           QuillToolbarCustomButtonOptions(
    //             icon: Icon(Icons.text_fields),
    //             onPressed: () {
    //               _controller.formatSelection(Attribute.header); // Clear header
    //               _controller.formatSelection(
    //                 Attribute.fromKeyValue('font', 'Roboto'),
    //               ); // Set font
    //               _controller.formatSelection(
    //                 Attribute.fromKeyValue('size', 16),
    //               ); // Set size
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //     // Editor
    //     Expanded(
    //       child: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: QuillEditor(
    //           controller: _controller,
    //           focusNode: _focusNode,
    //           config: QuillEditorConfig(
    //             placeholder: 'Start writing your article...',
    //             // Enforce default body style for pasted content
    //             scrollable: true,
    //             padding: const EdgeInsets.all(8.0),
    //             autoFocus: true,
    //             expands: true,
    //             readOnlyMouseCursor: SystemMouseCursors.text,
    //             // readOnly: false,
    //             // onPaste: (delta) {
    //             //   // Convert pasted content to body style (e.g., Roboto, size 16)
    //             //   final newDelta =
    //             //       Delta()..insert(delta.toPlainText(), {
    //             //         'font': 'Roboto',
    //             //         'size': 16,
    //             //       });
    //             //   return newDelta;
    //             // },
    //           ),
    //           scrollController: ScrollController(),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
