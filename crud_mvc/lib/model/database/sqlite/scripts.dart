const criarTabelaPet = '''
  CREATE TABLE pet(
            id INTEGER PRIMARY KEY
            , nome_pet TEXT NOT NULL
            , nome_tutor TEXT NOT NULL
            , especie
          )
''';

const inserirPet1 = '''
  INSERT INTO pet (nome_pet, nome_tutor, especie) VALUES ("Zelda", "Angelica", "Gato")
''';

const inserirPet2 = '''
  INSERT INTO pet (nome_pet, nome_tutor, especie) VALUES ("Fiona", "Angelica", "Gato")
''';
