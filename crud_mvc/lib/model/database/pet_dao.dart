import 'package:crud_mvc/model/database/sqlite/connection.dart';
import 'package:crud_mvc/model/pet_model.dart';

class PetDao {
  Future<List<Map<String, Object?>>> listar() async {
    var banco = await Connection.get();

    List<Map<String, Object?>> pets =
        await banco!.rawQuery('SELECT * FROM pet');

    return pets;
  }

  void salvar(Pet pet) async {
    var banco = await Connection.get();
    String sql;

    if (pet.id == null) {
      sql = 'INSERT INTO pet(nome_pet, nome_tutor, especie) VALUES (?, ?, ?)';
      banco!.rawInsert(sql, [pet.nomePet, pet.nomeTutor, pet.especie]);
    } else {
      sql =
          'UPDATE pet SET nome_pet = ?, nome_tutor = ?, especie = ? WHERE id = ?';
      banco!.rawUpdate(sql, [pet.nomePet, pet.nomeTutor, pet.especie, pet.id]);
    }
  }
}
