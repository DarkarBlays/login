import 'package:flutter/material.dart';
import 'package:login/ui/pages/ingresar.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const IngresarUsuario(),
      debugShowCheckedModeBanner: false,
    );
  }
}