import 'package:crud_mvc/model/base/base_model.dart';

class Pet extends BaseModel {
  String? nomePet;
  String? nomeTutor;
  String? especie;

  Pet({id, this.nomePet, this.nomeTutor, this.especie}) : super(id: id);
}
