import 'package:projeto_pdm/models/usuario.dart';

class Review {
  final Usuario _reviewer;
  final double _rating;
  final String _textoReview;
  final DateTime _dataReview;

  Review(
      {required Usuario reviewer,
      required double rating,
      required String textoReview,
      required DateTime dataReview})
      : this._reviewer = reviewer,
        this._rating = rating,
        this._textoReview = textoReview,
        this._dataReview = dataReview;

  Usuario getReviewer() => this._reviewer;
  double getRating() => this._rating;
  String getTextoReview() => this._textoReview;
  DateTime getDataReview() => this._dataReview;
}
