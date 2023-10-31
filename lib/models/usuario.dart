import 'pessoa.dart';
import 'livro.dart';

class Usuario extends Pessoa {
  List<Livro>? _favoritos;

  Usuario(
      {required int id,
      required String nome,
      required String sobrenome,
      required String email,
      required int idade})
      : this._favoritos = null,
        super(
            id: id,
            nome: nome,
            sobrenome: sobrenome,
            email: email,
            idade: idade);

  void adicionarFavorito(Livro livro) {
    if (this._favoritos == null) {
      this._favoritos = [];
    }
    this._favoritos!.add(livro);
  }

  void removerFavorito(Livro livro) {
    if (this._favoritos != null) {
      this._favoritos!.remove(livro);
    }
  }

  List<Livro>? getFavoritos() => this._favoritos;
}
