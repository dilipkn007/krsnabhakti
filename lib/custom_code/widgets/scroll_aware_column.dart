// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// Set your widget name, define your parameter, and then add the boilerplate
/// code using the green button on the right!

import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';

class ScrollAwareColumn extends StatefulWidget {
  const ScrollAwareColumn({
    Key? key,
    this.width,
    this.height,
    required this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget child;

  @override
  _ScrollAwareColumnState createState() => _ScrollAwareColumnState();
}

class _ScrollAwareColumnState extends State<ScrollAwareColumn> {
  late ScrollController _scrollController;
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        final currentOffset = _scrollController.offset;

        if (currentOffset > _lastOffset + 10) {
          // scrolling down
          FFAppState().update(() {
            FFAppState().showBottomNav = false;
          });
        } else if (currentOffset < _lastOffset - 10) {
          // scrolling up
          FFAppState().update(() {
            FFAppState().showBottomNav = true;
          });
        }

        _lastOffset = currentOffset;
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }
}
