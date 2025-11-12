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

class CenteredVerse extends StatelessWidget {
  const CenteredVerse({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'dehī nityam avadhyo ‘yaṁ\n'
        'dehe sarvasya bhārata\n'
        'tasmāt sarvāṇi bhūtāni\n'
        'na tvaṁ śocitum arhasi',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
