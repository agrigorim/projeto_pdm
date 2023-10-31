import 'package:flutter/material.dart';
import 'package:projeto_pdm/pages/home_page.dart';
import 'package:projeto_pdm/pages/login_page.dart';
import 'package:projeto_pdm/services/auth_service.dart';
import 'package:provider/provider.dart';

class MeuAplicativo extends StatefulWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  State<MeuAplicativo> createState() => _MeuAplicativoState();
}

class _MeuAplicativoState extends State<MeuAplicativo> {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  checkAuth() {
    final auth = context.watch<AuthService>();
    if (_navigator.currentState != null) {
      if (auth.usuario == null) {
        _navigator.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        );
      } else if (auth.usuario != null) {
        _navigator.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      } else {
        _navigator.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateInitialRoutes: (initialRoute) {
        checkAuth();
        return [
          MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ];
      },
    );
  }
}
