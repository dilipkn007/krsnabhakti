// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// this is a key value pairs
class DictStruct extends BaseStruct {
  DictStruct({
    bool? myfield,
  }) : _myfield = myfield;

  // "myfield" field.
  bool? _myfield;
  bool get myfield => _myfield ?? false;
  set myfield(bool? val) => _myfield = val;

  bool hasMyfield() => _myfield != null;

  static DictStruct fromMap(Map<String, dynamic> data) => DictStruct(
        myfield: data['myfield'] as bool?,
      );

  static DictStruct? maybeFromMap(dynamic data) =>
      data is Map ? DictStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'myfield': _myfield,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'myfield': serializeParam(
          _myfield,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DictStruct fromSerializableMap(Map<String, dynamic> data) =>
      DictStruct(
        myfield: deserializeParam(
          data['myfield'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DictStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DictStruct && myfield == other.myfield;
  }

  @override
  int get hashCode => const ListEquality().hash([myfield]);
}

DictStruct createDictStruct({
  bool? myfield,
}) =>
    DictStruct(
      myfield: myfield,
    );
