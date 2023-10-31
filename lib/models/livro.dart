class Livro {
  final int _id;
  String _titulo;
  String _nomeAutor;
  int _anoPublicacao;
  String _editora;

  Livro(
      {required int id,
      required String titulo,
      required String nomeAutor,
      required int anoPublicacao,
      required String editora})
      : this._id = id,
        this._titulo = titulo,
        this._nomeAutor = nomeAutor,
        this._anoPublicacao = anoPublicacao,
        this._editora = editora;

  int getId() => this._id;
  String getTitulo() => this._titulo;
  String getNomeAutor() => this._nomeAutor;
  int getAnoPublicacao() => this._anoPublicacao;
  String getEditora() => this._editora;
  void setTitulo(String titulo) => this._titulo = titulo;
  void setNomeAutor(String nomeAutor) => this._nomeAutor = nomeAutor;
  void setAnoPublicacao(int anoPublicacao) =>
      this._anoPublicacao = anoPublicacao;
  void setEditora(String editora) => this._editora = editora;
}
