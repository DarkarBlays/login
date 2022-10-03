import 'package:flutter/material.dart';
import 'package:login/domain/modelos/modelsclientes.dart';

class EditarlCliente extends StatefulWidget {
  final Cliente gestioncliente;
  const EditarlCliente({Key? key, required this.gestioncliente}) : super(key: key);

  @override
  State<EditarlCliente> createState() => _EditarlClienteState();
}

class _EditarlClienteState extends State<EditarlCliente> {
  List<Cliente> _clientesadd = [];
  TextEditingController controlnombre = TextEditingController();
  TextEditingController controlapellido = TextEditingController();
  TextEditingController controltelefono = TextEditingController();

  @override
  void initState() {
    controlnombre.text = widget.gestioncliente.nombre;
    controlapellido.text = widget.gestioncliente.apellido;
    controltelefono.text = widget.gestioncliente.telefono;
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actualizar Clientes')),
      body: Column(
        children: [
          Padding(
              padding:const EdgeInsets.all(15.0),
              child: TextField(
                controller: controlnombre,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Nombres',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child:const Icon(Icons.close),
                      onTap: () {
                        controlnombre.clear();
                      },
                    )
                    //probar suffix
                    ),
              ),
            ),
          Padding(
              padding:const EdgeInsets.all(15.0),
              child: TextField(
                controller: controlapellido,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Apellidos',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child:const Icon(Icons.close),
                      onTap: () {
                        controlapellido.clear();
                      },
                    )
                    //probar suffix
                    ),
              ),
            ),
          Padding(
              padding:const EdgeInsets.all(15.0),
              child: TextField(
                controller: controltelefono,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Telefono',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child:const Icon(Icons.close),
                      onTap: () {
                        controltelefono.clear();
                      },
                    )
                    //probar suffix
                    ),
              ),
            ),
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
            child: const Text('Actualizar Datos'),
            
          ),
        ],
      ),
    );
  }
}