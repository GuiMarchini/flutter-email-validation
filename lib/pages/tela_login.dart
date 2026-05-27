import 'package:flutter/material.dart';

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
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Insira seu email',
                    ),
                    validator: (valor){
                      if (valor == null || valor.isEmpty){
                        return 'Insira seu email';
                      }

                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                      if(!emailRegex.hasMatch(valor)){
                        return 'Insira um email válido';
                      }

                      return null;
                    },
                  ),
              ],),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Verificando dados')),
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
