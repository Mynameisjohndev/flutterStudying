class MyUser{
  String? _name;
  String? _email;
  String? _profile;
  String? _password;
  String? _idUsuario;

  MyUser();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "name" : this.name,
      "email" : this.email
    };

    return map;

  }
  String? get idUsuario => _idUsuario;
  
  set idUsuario(String? idUsuario){
    _idUsuario = idUsuario;
  }

  String? get profile => _profile;

  set profile(String? value) {
    _profile = value;
  }

  String? get password => _password;

  set password(String? value) {
    _password = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }
}