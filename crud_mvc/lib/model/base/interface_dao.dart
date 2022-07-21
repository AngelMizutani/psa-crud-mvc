import 'package:crud_mvc/model/base/base_model.dart';

abstract class InterfaceDao<T extends BaseModel> {
  void salvar(T model);
  void deletar(dynamic id);
  Future<List<T>> listar();
}
