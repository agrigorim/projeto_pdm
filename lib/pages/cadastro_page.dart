import 'package:flutter/material.dart';
import 'package:projeto_pdm/services/auth_service.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _sobrenomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _conviteController = TextEditingController();
  bool loading = false;

  /*registrar(String email, String senha) async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null) return 'Informe seu nome';
                  return null;
                },
              ),
              TextFormField(
                controller: _sobrenomeController,
                decoration: InputDecoration(labelText: 'Sobrenome'),
                validator: (value) {
                  if (value == null) return 'Informe seu sobrenome';
                  return null;
                },
              ),
              TextFormField(
                controller: _idadeController,
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null) return 'Informe sua idade';
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null) return 'Informe seu email';
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null) return 'Informe sua senha';
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _conviteController,
                decoration: InputDecoration(labelText: 'Código de Convite'),
                validator: (value) {
                  if (value == null) return 'Informe um código de convite';
                  // Valide o código de convite, se necessário
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //_registro();
                  }
                },
                child: Text('Cadastrar'),
              ),
              //if (_error != null)
              //Text(_error!, style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
