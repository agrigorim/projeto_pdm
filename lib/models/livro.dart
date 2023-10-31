class Livro {
  final int _id;
  final String _titulo;
  final String _nomeAutor;
  final int _anoPublicacao;
  final String _editora;
  String _sinopse = '';
  List<String> _generos = [];
  List<String> _idiomas = [];
  List<String> _tags = [];

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
  String getSinopse() => this._sinopse;
  List<String> getGeneros() => this._generos;
  List<String> getIdiomas() => this._idiomas;
  List<String> getTags() => this._tags;
  void setSinopse(String sinopse) => this._sinopse = sinopse;
  void setGeneros(List<String> generos) => this._generos = generos;
  void setIdiomas(List<String> idiomas) => this._idiomas = idiomas;
  void setTags(List<String> tags) => this._tags = tags;
}
