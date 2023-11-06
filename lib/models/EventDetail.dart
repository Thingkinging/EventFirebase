import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetail {
  late String id;
  late String _description;
  late String _date;
  late String _startTime;
  late String _endTime;
  late String _speaker;
  late bool _isFavorite;

  EventDetail(
    this.id,
    this._description,
    this._date,
    this._startTime,
    this._endTime,
    this._speaker,
    this._isFavorite,
  );

  String get date => _date;

  String get startTime => _startTime;

  String get endTime => _endTime;

  String get speaker => _speaker;

  bool get isFavorite => _isFavorite;

  String get description => _description;

  EventDetail.fromMap(dynamic obj) {
    id = (obj as QueryDocumentSnapshot).id; // obj['id'];
    _description = obj['description'];
    _date = obj['data'];
    _startTime = obj['start_time'];
    _endTime = obj['end_time'];
    _speaker = obj['speaker'];
    _isFavorite = obj['is_favorite'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['description'] = _description;
    map['data'] = _date;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['speaker'] = _speaker;
    map['is_favorite'] = _isFavorite;

    return map;
  }
}
