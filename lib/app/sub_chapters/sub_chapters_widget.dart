import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sub_chapters_model.dart';
export 'sub_chapters_model.dart';

class SubChaptersWidget extends StatefulWidget {
  const SubChaptersWidget({
    super.key,
    required this.chapterId,
  });

  final int? chapterId;

  static String routeName = 'subChapters';
  static String routePath = '/subChapters';

  @override
  State<SubChaptersWidget> createState() => _SubChaptersWidgetState();
}

class _SubChaptersWidgetState extends State<SubChaptersWidget> {
  late SubChaptersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubChaptersModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FutureBuilder<List<FetchSubChaptersRow>>(
                    future: SQLiteManager.instance.fetchSubChapters(
                      chapterId: widget.chapterId!,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).tertiary,
                              ),
                            ),
                          ),
                        );
                      }
                      final listViewFetchSubChaptersRowList = snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewFetchSubChaptersRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewFetchSubChaptersRow =
                              listViewFetchSubChaptersRowList[listViewIndex];
                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.subChapters = await SQLiteManager
                                          .instance
                                          .fetchSubChapters(
                                        chapterId:
                                            listViewFetchSubChaptersRow.id,
                                      );
                                      if (_model.subChapters!.length > 0
                                          ? true
                                          : false) {
                                        context.pushNamed(
                                          SubChaptersWidget.routeName,
                                          queryParameters: {
                                            'chapterId': serializeParam(
                                              listViewFetchSubChaptersRow.id,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        context.pushNamed(
                                          ContentsWidget.routeName,
                                          queryParameters: {
                                            'content': serializeParam(
                                              listViewFetchSubChaptersRow
                                                  .content,
                                              ParamType.String,
                                            ),
                                            'title': serializeParam(
                                              listViewFetchSubChaptersRow.title,
                                              ParamType.String,
                                            ),
                                            'bookId': serializeParam(
                                              listViewFetchSubChaptersRow
                                                  .bookId,
                                              ParamType.int,
                                            ),
                                            'chapterNumber': serializeParam(
                                              listViewFetchSubChaptersRow
                                                  .number,
                                              ParamType.int,
                                            ),
                                            'parentId': serializeParam(
                                              listViewFetchSubChaptersRow
                                                  .parentId,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            formatNumber(
                                              listViewFetchSubChaptersRow
                                                  .number,
                                              formatType: FormatType.custom,
                                              format: '##\'.\'',
                                              locale: 'en_US',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            listViewFetchSubChaptersRow.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x1514181B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
