class Anotation{
  int? id;
  String? title;
  String? description;
  String? data;

  Anotation(this.title, this.description, this.data);

  Map toMap(){
    Map<String, dynamic> dataAnotation = {
      "title": this.title,
      "description": this.description,
      "data": this.data,
    };

    if(this.id != null){
      dataAnotation["id"] = this.id;
    }

    return dataAnotation;
  }

} 