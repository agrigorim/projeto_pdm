import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_pdm/pages/login_page.dart';
import 'package:projeto_pdm/repositories/favoritos_repository.dart';
import 'package:projeto_pdm/repositories/livros_repository.dart';
import 'package:projeto_pdm/repositories/reviews_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'meu_aplicativo.dart';

import 'package:projeto_pdm/services/auth_service.dart';
//import 'package:projeto_pdm/models/livro.dart';
//import 'package:projeto_pdm/repositories/livros_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(
          create: (context) => LivrosRepository(),
          lazy: false,
        ),
        ChangeNotifierProvider(
            create: (context) => ReviewsRepository(
                // livros: context.read<LivrosRepository>(),
                )),
        //ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(
          create: (context) => FavoritosRepository(
            auth: context.read<AuthService>(),
            livros: context.read<LivrosRepository>(),
          ),
        ),
      ],
      child: const MeuAplicativo(),
    ),
  );
}
