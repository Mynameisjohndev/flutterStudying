class Chat {
  String? _name;
  String? _message;
  String? _pathPhoto;

  Chat(this._name, this._message, this._pathPhoto);

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get message => _message;
  set message(String? message) => _message = message;
  String? get pathPhoto => _pathPhoto;
  set pathPhoto(String? pathPhoto) => _pathPhoto = pathPhoto;

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "_name": this._name,
      "_message": this._message,
      "_pathPhoto": this._pathPhoto,
    };
    return map;
  }

}