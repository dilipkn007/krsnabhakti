import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _bookmarkToggle = prefs.getBool('ff_bookmarkToggle') ?? _bookmarkToggle;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_bookMarkStatus')) {
        try {
          final serializedData = prefs.getString('ff_bookMarkStatus') ?? '{}';
          _bookMarkStatus =
              DictStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _bbdBookmarkToggle =
          prefs.getBool('ff_bbdBookmarkToggle') ?? _bbdBookmarkToggle;
    });
    _safeInit(() {
      _recentsRead = prefs.getStringList('ff_recentsRead') ?? _recentsRead;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// stores the bookmark status
  bool _bookmarkToggle = false;
  bool get bookmarkToggle => _bookmarkToggle;
  set bookmarkToggle(bool value) {
    _bookmarkToggle = value;
    prefs.setBool('ff_bookmarkToggle', value);
  }

  DictStruct _bookMarkStatus =
      DictStruct.fromSerializableMap(jsonDecode('{\"myfield\":\"true\"}'));
  DictStruct get bookMarkStatus => _bookMarkStatus;
  set bookMarkStatus(DictStruct value) {
    _bookMarkStatus = value;
    prefs.setString('ff_bookMarkStatus', value.serialize());
  }

  void updateBookMarkStatusStruct(Function(DictStruct) updateFn) {
    updateFn(_bookMarkStatus);
    prefs.setString('ff_bookMarkStatus', _bookMarkStatus.serialize());
  }

  bool _bbdBookmarkToggle = false;
  bool get bbdBookmarkToggle => _bbdBookmarkToggle;
  set bbdBookmarkToggle(bool value) {
    _bbdBookmarkToggle = value;
    prefs.setBool('ff_bbdBookmarkToggle', value);
  }

  List<String> _recentsRead = [];
  List<String> get recentsRead => _recentsRead;
  set recentsRead(List<String> value) {
    _recentsRead = value;
    prefs.setStringList('ff_recentsRead', value);
  }

  void addToRecentsRead(String value) {
    recentsRead.add(value);
    prefs.setStringList('ff_recentsRead', _recentsRead);
  }

  void removeFromRecentsRead(String value) {
    recentsRead.remove(value);
    prefs.setStringList('ff_recentsRead', _recentsRead);
  }

  void removeAtIndexFromRecentsRead(int index) {
    recentsRead.removeAt(index);
    prefs.setStringList('ff_recentsRead', _recentsRead);
  }

  void updateRecentsReadAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    recentsRead[index] = updateFn(_recentsRead[index]);
    prefs.setStringList('ff_recentsRead', _recentsRead);
  }

  void insertAtIndexInRecentsRead(int index, String value) {
    recentsRead.insert(index, value);
    prefs.setStringList('ff_recentsRead', _recentsRead);
  }

  bool _showBottomNav = true;
  bool get showBottomNav => _showBottomNav;
  set showBottomNav(bool value) {
    _showBottomNav = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
