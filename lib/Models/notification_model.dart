
class NotificationModel {
  NotificationModel({
      List<Data> data,}){
    _data = data;
}

  NotificationModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }
  List<Data> _data;

  List<Data> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class Data {
  Data({
      String id, 
      String title, 
      String message, 
      String expiry, 
      String branch, 
      String createdAt, 
      String updatedAt, 
      int v,}){
    _id = id;
    _title = title;
    _message = message;
    _expiry = expiry;
    _branch = branch;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _message = json['message'];
    _expiry = json['expiry'];
    _branch = json['branch'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String _id;
  String _title;
  String _message;
  String _expiry;
  String _branch;
  String _createdAt;
  String _updatedAt;
  int _v;

  String get id => _id;
  String get title => _title;
  String get message => _message;
  String get expiry => _expiry;
  String get branch => _branch;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['message'] = _message;
    map['expiry'] = _expiry;
    map['branch'] = _branch;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}