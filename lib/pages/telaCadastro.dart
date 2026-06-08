import 'package:flutter/material.dart';
import 'package:validacao/pages/telaLogin.dart';
import 'telaHome.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();

  @override
  void dispose() {
    _senhaController.dispose();
    _confirmaSenhaController.dispose();
    super.dispose();
  }

  InputDecoration _buildDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
      ),
      prefixIcon: Icon(icon, color: Colors.grey),
      labelText: label,
      hintText: hint,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 121, 121, 121)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 175, 34, 64),
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Crie sua conta!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: _buildDecoration(
                      label: 'Nome',
                      hint: 'Insira seu nome',
                      icon: Icons.person,
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Digite seu nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: _buildDecoration(
                      label: 'Email',
                      hint: 'Insira seu email',
                      icon: Icons.email,
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Digite seu email';
                      }
                      if (!valor.contains('@')) {
                        return 'Digite um email válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: _buildDecoration(
                      label: 'Senha',
                      hint: 'Insira sua senha',
                      icon: Icons.lock,
                    ),
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Digite sua senha';
                      }
                      if (senha.length < 6) {
                        return 'A senha precisa ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmaSenhaController,
                    obscureText: true,
                    decoration: _buildDecoration(
                      label: 'Confirmar Senha',
                      hint: 'Confirme sua senha',
                      icon: Icons.lock,
                    ),
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Confirme sua senha';
                      }
                      if (senha != _senhaController.text) {
                        return 'As senhas não são iguais';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 175, 34, 64),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(14)
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaLogin()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                      ),
                    );
                  }
                },
                child: const Text('Cadastrar'),
              ),
          ],
        ),
      ),
    );
  }
}
