import 'package:flutter/material.dart';
import 'package:login/domain/modelos/modelsclientes.dart';

import 'widget.dart';

class AdicionaClientes extends StatefulWidget {
  const AdicionaClientes({Key? key}) : super(key: key);

  @override
  State<AdicionaClientes> createState() => _AdicionaClientesState();
}

class _AdicionaClientesState extends State<AdicionaClientes> {
  List<Cliente> _clientesadd = [];
  TextEditingController controlnombre = TextEditingController();
  TextEditingController controlapellido = TextEditingController();
  TextEditingController controltelefono = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Clientes')),
      body: Column(
        children: [
          Textos(controlarTextos: controlnombre , etiqueta: 'Nombres'),
          Textos(controlarTextos: controlapellido, etiqueta: 'Apellidos'),
          Textos(controlarTextos: controltelefono, etiqueta: 'Telefono'),
          
            // Boton
          ElevatedButton(
            //Paso # 3
            //En el Boton Enviar Datos

            onPressed: () {
              if (controlnombre.text.isNotEmpty &&
                  controlapellido.text.isNotEmpty &&
                  controltelefono.text.isNotEmpty) {
                // Agregar a la lista los valores de cada texto

                _clientesadd.add(Cliente(
                    nombre: controlnombre.text,
                    apellido: controlapellido.text,
                    telefono: controltelefono.text));

                // Devuelvo los datos de la lista _clientesadd

                Navigator.pop(context, _clientesadd);
              }
            },
            child: const Text('Guardar Datos'),
            
          ),
        ],
      ),
    );
  }
}

