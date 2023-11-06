import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite{
  late String _id;
  late String _eventId;
  late String _userId;

  Favorite(this._id, this._eventId, this._userId);

  String get id => _id;
  String get eventId => _eventId;

  Favorite.map(DocumentSnapshot document){
    _id = document.id;
    _eventId = document['eventId'];
    _userId = document['userId'];
  }

  Map <String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_id != null){
      map['id'] = _id;
    }
    map['eventId'] = _eventId;
    map['userId'] = _userId;

    return map;
  }


}