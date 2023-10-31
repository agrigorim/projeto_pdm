import 'package:flutter/material.dart';
import 'package:projeto_pdm/pages/cadastro_page.dart';
import 'package:projeto_pdm/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:projeto_pdm/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  bool loading = false;
  bool logged = false;

  @override
  void initState() {
    super.initState();
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
    if (loading) {
      setState(() => logged = true);
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarTextStyle: TextStyle(fontFamily: 'EduTASBeginner'),
        backgroundColor: Color.fromARGB(255, 122, 61, 179),
        centerTitle: true,
        title: const Text('LitCritique'),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 50, 15, 110),
          fontSize: 64,
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          color: Color.fromARGB(255, 173, 101, 240),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    fontFamily: 'Exo2',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o email corretamente!';
                  }
                  return null;
                },
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    fontFamily: 'Exo2',
                    color: Colors.black,
                    //fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informa sua senha!';
                  } else if (value.length < 8) {
                    return 'Sua senha deve ter no mínimo 8 caracteres';
                  }
                  return null;
                },
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 50, 15, 110),
                    onPrimary: Color.fromARGB(255, 173, 101, 240),
                  ),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    login();
                    if (logged) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Usuário ou senha incorreto!')));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 50, 15, 110),
                    onPrimary: Color.fromARGB(255, 173, 101, 240),
                  ),
                  child: Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CadastroPage()));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
