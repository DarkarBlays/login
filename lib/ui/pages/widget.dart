import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  const Textos({
    Key? key,
    required this.controlarTextos,
    required this.etiqueta,
  }) : super(key: key);

  final TextEditingController controlarTextos;
  final String etiqueta;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(15.0),
        child: TextField(
          controller: controlarTextos,
          decoration: InputDecoration(
              filled: true,
              labelText: etiqueta,
              // suffix: Icon(Icons.access_alarm),
              suffix: GestureDetector(
                child:const Icon(Icons.close),
                onTap: () {
                  controlarTextos.clear();
                },
              )
              //probar suffix
              ),
        ),
      );
  }
}