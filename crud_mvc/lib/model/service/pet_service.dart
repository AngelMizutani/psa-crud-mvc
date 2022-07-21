import 'package:crud_mvc/model/database/sqlite/pet_dao.dart';
import 'package:crud_mvc/model/pet_model.dart';

class PetService {
  var dao = PetDao();

  void salvar(Pet pet) {
    bool nomePetValido = validarNomePet(pet.nomePet);
    bool nomeTutorValido = validarNomeTutor(pet.nomeTutor);
    bool especieValida = validarEspecie(pet.especie);

    if (nomePetValido && nomeTutorValido && especieValida) {
      dao.salvar(pet);
    }
  }

  Future<List<Pet>> listar() {
    return dao.listar();
  }

  void deletar(int id) {
    dao.deletar(id);
  }

  bool validarNomePet(String? nomePet) {
    if (nomePet != null && nomePet != '') {
      return true;
    }
    return false;
  }

  bool validarNomeTutor(String? nomeTutor) {
    if (nomeTutor != null && nomeTutor != '') {
      return true;
    }
    return false;
  }

  bool validarEspecie(String? especie) {
    if (especie != null && especie != '') {
      return true;
    }
    return false;
  }
}
