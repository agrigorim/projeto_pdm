import 'package:flutter/material.dart';
import 'package:projeto_pdm/models/livro.dart';

class LivroDetalhesPage extends StatefulWidget {
  final Livro livro;

  const LivroDetalhesPage({Key? key, required this.livro}) : super(key: key);

  @override
  State<LivroDetalhesPage> createState() => _LivroDetalhesPageState();
}

class _LivroDetalhesPageState extends State<LivroDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
