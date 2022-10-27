class Message {
  String? _idUsuario;
  String? _message;
  String? _urlImage;
  String? _type;

  Message(
      {String? idUsuario, String? message, String? urlImage, String? type}) {
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
  }

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this._idUsuario;
    data['message'] = this._message;
    data['urlImage'] = this._urlImage;
    data['type'] = this._type;
    return data;
  }
}