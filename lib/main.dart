import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/tela_login.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 49, 145, 253),
          secondary: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      home: TelaLogin(),
    );
  }
}
