import 'package:crud_mvc/model/pet_model.dart';
import 'package:crud_mvc/model/service/pet_service.dart';

class PetController {
  var service = PetService();

  void salvar(Pet pet) {
    service.salvar(pet);
  }

  void deletar(int id) {
    service.deletar(id);
  }

  Future<List<Pet>> listar() {
    return service.listar();
  }
}
