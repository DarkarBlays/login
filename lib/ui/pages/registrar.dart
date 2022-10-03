import 'package:flutter/material.dart';
import 'package:login/domain/modelsusuario.dart';
import 'package:login/ui/pages/ingresar.dart';

class RegistrarUsuario extends StatefulWidget {
  //final Usuario gestionUsuario;
  const RegistrarUsuario({Key? key}) : super(key: key);

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {

  List<Usuario> _usuarioadd = [];
  TextEditingController controlnombre = TextEditingController();
  TextEditingController controlclave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Usuario')),
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
                controller: controlclave,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'clave',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child:const Icon(Icons.close),
                      onTap: () {
                        controlclave.clear();
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
                  controlclave.text.isNotEmpty) {
                // Agregar a la lista los valores de cada texto

                _usuarioadd.add(Usuario(
                    nombre: controlnombre.text,
                    clave: controlclave.text,));

                // Devuelvo los datos de la lista _usuarioadd

                Navigator.pop(context, _usuarioadd);
              }
            },
            child: const Text('Crear'),
            
          ),
        ],
      ),
    );
  }
}