import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pdm/pages/favoritos_page.dart';
import 'package:projeto_pdm/pages/minhas_reviews_page.dart';
import 'package:projeto_pdm/pages/perfil_page.dart';
import 'package:projeto_pdm/pages/pesquisa_page.dart';

class LivrosPage extends StatefulWidget {
  const LivrosPage({super.key});

  @override
  State<LivrosPage> createState() => _LivrosPageState();
}

class _LivrosPageState extends State<LivrosPage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          FavoritosPage(),
          PesquisaPage(),
          PerfilPage(),
          MinhasReviewsPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Livros'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisa'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Conta'),
          BottomNavigationBarItem(
              icon: Icon(Icons.reviews), label: 'Minhas Reviews'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
