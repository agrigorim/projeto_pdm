import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pdm/database/firestore_db.dart';
import 'package:projeto_pdm/models/livro.dart';
import 'package:projeto_pdm/repositories/livros_repository.dart';
import 'package:projeto_pdm/services/auth_service.dart';

class FavoritosRepository extends ChangeNotifier {
  final List<Livro> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;
  LivrosRepository livros;

  FavoritosRepository({required this.auth, required this.livros}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readFavoritas();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readFavoritas() async {
    if (auth.usuario != null && _lista.isEmpty) {
      try {
        final snapshot = await db
            .collection('usuarios/${auth.usuario!.uid}/favoritas')
            .get();

        for (var doc in snapshot.docs) {
          //Livro livro = livros.tabela
          // .firstWhere((livro) => livro.titulo == doc.get('titulo'));
          // _lista.add(livro);
          notifyListeners();
        }
      } catch (e) {
        debugPrint('Sem id de usuário');
      }
    }
  }

  UnmodifiableListView<Livro> get lista => UnmodifiableListView(_lista);

  saveAll(List<Livro> livros) async {
    for (var livro in livros) {
      if (!_lista.any((atual) => atual.getTitulo == livro.getTitulo)) {
        _lista.add(livro);
        try {
          await db
              .collection('usuarios/${auth.usuario!.uid}/favoritas')
              .doc(livro.getTitulo())
              .set({
            'titulo': livro.getTitulo,
            'autor': livro.getNomeAutor,
            'ano': livro.getAnoPublicacao(),
            'editora': livro.getEditora(),
          });
        } on FirebaseException catch (e) {
          debugPrint('Permissão Required no Firestore: $e');
        }
      }
    }
    notifyListeners();
  }

  remove(Livro livro) async {
    await db
        .collection('usuarios/${auth.usuario!.uid}/favoritas')
        .doc(livro.getTitulo())
        .delete();
    _lista.remove(livro);
    notifyListeners();
  }
}
