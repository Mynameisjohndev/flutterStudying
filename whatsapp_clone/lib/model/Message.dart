class Message {
  String? _idUsuario;
  String? _message;
  String? _urlImage;
  String? _type;
  DateTime? _date;

  Message(
      {String? idUsuario,
      String? message,
      String? urlImage,
      String? type,
      DateTime? date}) {
    if (idUsuario != null) {
      this._idUsuario = idUsuario;
    }
    if (message != null) {
      this._message = message;
    }
    if (urlImage != null) {
      this._urlImage = urlImage;
    }
    if (type != null) {
      this._type = type;
    }
    if (type != null) {
      this._date = date;
    }
  }

  DateTime? get date => _date;
  set date(DateTime? date) => _date = date;
  String? get idUsuario => _idUsuario;
  set idUsuario(String? idUsuario) => _idUsuario = idUsuario;
  String? get message => _message;
  set message(String? message) => _message = message;
  String? get urlImage => _urlImage;
  set urlImage(String? urlImage) => _urlImage = urlImage;
  String? get type => _type;
  set type(String? type) => _type = type;

  Message.fromJson(Map<String, dynamic> json) {
    _idUsuario = json['idUsuario'];
    _message = json['message'];
    _urlImage = json['urlImage'];
    _type = json['type'];
    _date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this._idUsuario;
    data['message'] = this._message;
    data['urlImage'] = this._urlImage;
    data['type'] = this._type;
    data['date'] = this._date;
    return data;
  }
}
