import 'package:crud_mvc/model/database/pet_dao.dart';
import 'package:crud_mvc/model/pet_model.dart';

class PetController {
  var dao = PetDao();

  void salvar(Pet pet) {
    dao.salvar(pet);
  }

  Future<List<Map<String, Object?>>> listar() {
    return dao.listar();
  }
}
