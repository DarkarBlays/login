import 'package:flutter/material.dart';
import 'package:login/domain/modelsusuario.dart';
import 'package:login/ui/pages/lista.dart';
import 'package:login/ui/pages/registrar.dart';

class IngresarUsuario extends StatefulWidget {
  //final Usuario gestionUsuario;
  const IngresarUsuario({super.key});

  @override
  State<IngresarUsuario> createState() => _IngresarUsuarioState();
}

class _IngresarUsuarioState extends State<IngresarUsuario> {
  final List _usuario = listaUsuarios;
  TextEditingController controlnombre = TextEditingController();
  TextEditingController controlclave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingresar Usuario')),
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
             _login(context);
            },
            child: const Text('Login'),
            
          ),
        ],
        
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const RegistrarUsuario(), //Llamar la Vista 
            )).then((resultado) //Espera por un Resultado
            {
              _usuario.addAll(resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
              setState(() {});
            });
        },
        child: const Text('Registrar'),
      ),
    );
  }
  
  _login(context){

    var valid = _usuario.firstWhere(
            (u) => u.nombre == controlnombre.text
             && u.clave == controlclave.text, orElse: ()=> Usuario()) ;

    if(valid.nombre != null){
      Navigator.push(context,
          MaterialPageRoute( builder: (context) => ListarClientes()));
      return;
    }

    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Invalido'),
            content:const  Text(
                'Usuario o contraseña incorrectas'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.green),
                  )),
            ],
          );
        });
  }

}