import 'pessoa.dart';

class Administrador extends Pessoa {
  final String _codigoConvite;

  Administrador(
      {required int id,
      required String nome,
      required String sobrenome,
      required String email,
      required int idade,
      required String codigoConvite})
      : this._codigoConvite = codigoConvite,
        super(
          id: id,
          nome: nome,
          sobrenome: sobrenome,
          email: email,
          idade: idade,
        );

  String getCodigoConvite() => this._codigoConvite;
}
