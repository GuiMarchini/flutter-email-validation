import 'package:flutter/material.dart';
import 'home.dart';

class TelaLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 175, 34, 64),
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 2.0),
                      ),
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(1),
                          child: Icon(
                            Icons.email,
                            color: Colors.grey,
                          )),
                      labelText: 'Email',
                      hintText: 'Insira seu email',
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Insira seu email';
                      }

                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                      if (!emailRegex.hasMatch(valor)) {
                        return 'Insira um email válido';
                      }

                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 2.0),
                      ),
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(1),
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          )),
                      labelText: 'Senha',
                      hintText: 'Insira sua senha',
                    ),
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Insira sua senha';
                      }

                      return null;
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 175, 34, 64),
                foregroundColor: Colors.white,   
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('“Login realizado com sucesso!”')),
                  );
                }
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
