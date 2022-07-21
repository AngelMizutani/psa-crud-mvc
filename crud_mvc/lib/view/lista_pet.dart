import 'package:crud_mvc/controller/pet_controller.dart';
import 'package:crud_mvc/model/pet_model.dart';
import 'package:flutter/material.dart';

class ListaPet extends StatelessWidget {
  var petController = PetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/formPet'),
          )
        ],
      ),
      body: FutureBuilder(
        future: petController.listar(),
        builder: (context, dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          }
          Object? pets = dados.data;
          return ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              var pet = pets[index];
              return ListTile(
                title: Text('Pet: ${pet['nome_pet'].toString()}'),
                subtitle: Text('Tutor: ${pet['nome_tutor'].toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}
