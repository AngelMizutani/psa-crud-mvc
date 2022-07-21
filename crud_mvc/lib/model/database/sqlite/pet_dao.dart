import 'package:crud_mvc/model/pet_model.dart';

import '../../interface_dao_pet.dart';
import 'connection.dart';

class PetDao implements InterfaceDaoPet {
  @override
  void deletar(dynamic id) async {
    var banco = await Connection.get();
    String sql = 'DELETE FROM pet WHERE id = ?';
    await banco.rawDelete(sql, [id]);
  }

  @override
  Future<List<Pet>> listar() async {
    var banco = await Connection.get();

    List<Map<String, dynamic>> resultado =
        await banco.rawQuery('SELECT * FROM pet');
    List<Pet> pets = List.generate(resultado.length, (index) {
      var pet = resultado[index];
      return Pet(
          id: pet['id'],
          nomePet: pet['nome_pet'],
          nomeTutor: pet['nome_tutor'],
          especie: pet['especie']);
    });

    return pets;
  }

  @override
  void salvar(Pet pet) async {
    var banco = await Connection.get();
    String sql;

    if (pet.id == null) {
      sql = 'INSERT INTO pet(nome_pet, nome_tutor, especie) VALUES (?, ?, ?)';
      banco.rawInsert(sql, [pet.nomePet, pet.nomeTutor, pet.especie]);
    } else {
      sql =
          'UPDATE pet SET nome_pet = ?, nome_tutor = ?, especie = ? WHERE id = ?';
      banco.rawUpdate(sql, [pet.nomePet, pet.nomeTutor, pet.especie, pet.id]);
    }
  }
}
