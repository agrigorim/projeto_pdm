import 'pessoa.dart';

class Administrador extends Pessoa {
  Administrador(
      {required int id,
      required String nome,
      required String sobrenome,
      required String email,
      required int idade})
      : super(
            id: id,
            nome: nome,
            sobrenome: sobrenome,
            email: email,
            idade: idade);
}
