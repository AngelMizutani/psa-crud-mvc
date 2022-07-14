import 'package:crud_mvc/controller/pet_controller.dart';
import 'package:crud_mvc/model/pet_model.dart';
import 'package:flutter/material.dart';

class FormPet extends StatelessWidget {
  var pet = Pet();
  var petController = PetController();

  Widget criarTextField(String label, String hintText, ValueChanged onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(label: Text(label), hintText: hintText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Pets'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              criarTextField('Nome do Pet', 'Informe o nome do Pet',
                  (value) => pet.nomePet = value),
              criarTextField('Nome do Tutor', 'Informe o nome do Tutor',
                  (value) => pet.nomeTutor = value),
              criarTextField('Espécie', 'Informe a espécie do Pet',
                  (value) => pet.especie = value),
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  petController.salvar(pet);
                  Navigator.pushNamed(context, '/');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
