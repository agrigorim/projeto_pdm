import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'litcritique.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_livro);
    await db.execute(_administrador);
    await db.execute(_genero);
    await db.execute(_idioma);
    await db.execute(_tag);
    await db.execute(_usuario);
    await db.execute(_review);
    await db.execute(_favorito);
    await db.execute(_idiomaLivro);
    await db.execute(_tagLivro);
    await db.execute(_generoLivro);
  }

  String get _livro => '''
    CREATE TABLE livro (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT,
      nome_autor TEXT,
      ano_publicacao INTEGER,
      editora TEXT,
      sinopse TEXT,
    );
  ''';

  String get _administrador => '''
    CREATE TABLE administrador (
      id INTEGER PRIMARY KEY,
      nome TEXT,
      sobrenome TEXT,
      email TEXT,
      idade INTEGER,
      codigo_convite TEXT
    );
  ''';

  String get _genero => '''
    CREATE TABLE genero (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT
    );
  ''';

  String get _idioma => '''
    CREATE TABLE idioma (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT
    );
  ''';

  String get _tag => '''
    CREATE TABLE tag (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT
    );
  ''';

  String get _review => '''
    CREATE TABLE review (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      livro_avaliado FOREIGN KEY REFERENCES livro(id),
      reviewer FOREIGN KEY REFERENCES usuario(id),
      nota DOUBLE,
      texto_review TEXT,
      data_review DATETIME
    );
  ''';

  String get _usuario => '''
    CREATE TABLE usuario (
      id INTEGER PRIMARY KEY,
      nome TEXT,
      sobrenome TEXT,
      email TEXT,
      idade INTEGER,
    );
  ''';

  String get _favorito => '''
    CREATE TABLE favorito (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      livro FOREIGN KEY REFERENCES livro(id),
      usuario FOREIGN KEY REFERENCES usuario(id)
    );
  ''';

  String get _idiomaLivro => '''
    CREATE TABLE idiomaLivro (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      livro FOREIGN KEY REFERENCES livro(id),
      idioma FOREIGN KEY REFERENCES idioma(id)
    );
  ''';

  String get _tagLivro => '''
    CREATE TABLE tagLivro (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tag FOREIGN KEY REFERENCES tag(id),
      livro FOREIGN KEY REFERENCES livro(id)
    );
  ''';

  String get _generoLivro => '''
    CREATE TABLE generoLivro (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      livro FOREIGN KEY REFERENCES livro(id),
      genero FOREIGN KEY REFERENCES genero(id)
    );
  ''';
}
