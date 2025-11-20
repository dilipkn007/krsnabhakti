import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chapters_widget.dart' show ChaptersWidget;
import 'package:flutter/material.dart';

class ChaptersModel extends FlutterFlowModel<ChaptersWidget> {
  ///  Local state fields for this page.

  List<FetchSubChaptersRow> chapterlist = [];
  void addToChapterlist(FetchSubChaptersRow item) => chapterlist.add(item);
  void removeFromChapterlist(FetchSubChaptersRow item) =>
      chapterlist.remove(item);
  void removeAtIndexFromChapterlist(int index) => chapterlist.removeAt(index);
  void insertAtIndexInChapterlist(int index, FetchSubChaptersRow item) =>
      chapterlist.insert(index, item);
  void updateChapterlistAtIndex(
          int index, Function(FetchSubChaptersRow) updateFn) =>
      chapterlist[index] = updateFn(chapterlist[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (fetchSubChapters)] action in Row widget.
  List<FetchSubChaptersRow>? subChapters;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
