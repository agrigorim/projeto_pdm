import 'package:projeto_pdm/models/livro.dart';
import 'package:projeto_pdm/models/usuario.dart';

class Review {
  final Livro _avaliado;
  final Usuario _reviewer;
  final double _nota;
  final String _textoReview;
  final DateTime _dataReview;

  Review(
      {required Livro avaliado,
      required Usuario reviewer,
      required double nota,
      required String textoReview,
      required DateTime dataReview})
      : this._avaliado = avaliado,
        this._reviewer = reviewer,
        this._nota = nota,
        this._textoReview = textoReview,
        this._dataReview = dataReview;

  Livro getAvaliado() => this._avaliado;
  Usuario getReviewer() => this._reviewer;
  double getRating() => this._nota;
  String getTextoReview() => this._textoReview;
  DateTime getDataReview() => this._dataReview;
}
