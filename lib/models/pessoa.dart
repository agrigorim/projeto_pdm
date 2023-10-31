class Pessoa {
  final int _id;
  String _nome;
  String _sobrenome;
  String _email;
  int _idade;

  Pessoa(
      {required int id,
      required String nome,
      required String sobrenome,
      required String email,
      required int idade})
      : this._id = id,
        this._nome = nome,
        this._sobrenome = sobrenome,
        this._email = email,
        this._idade = idade;

  int getId() => this._id;
  String getNome() => this._nome;
  String getSobrenome() => this._sobrenome;
  String getNomeCompleto() => this._nome + this._sobrenome;
  String getEmail() => this._email;
  int getIdade() => this._idade;
  void setNome(String nome) => this._nome = nome;
  void setSobrenome(String sobrenome) => this._sobrenome = sobrenome;
  void setEmail(String email) => this._email = email;
  void setIdade(int idade) => this._idade = idade;
}
