import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'book_reading_copy_widget.dart' show BookReadingCopyWidget;
import 'package:flutter/material.dart';

class BookReadingCopyModel extends FlutterFlowModel<BookReadingCopyWidget> {
  ///  Local state fields for this page.

  int chapterNumber = 1;

  String content = '';

  String bookId = '1';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
