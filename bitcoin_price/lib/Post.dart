class Post{

  late int _userId;

  late int _id;
  late String _title;
  late String _body;

  Post(this._userId, this._id, this._title, this._body);

  int get userId => _userId;

  set userId(int userId) {
    _userId = userId;
  }

  int get id => _id;

  set id(int _id) {
    _id = id;
  }

  String get title => _title;

  set title(String _title) {
    _title = title;
  }
  
  String get body => _body;

  set body(String _body) {
    _body = body;
  }

}