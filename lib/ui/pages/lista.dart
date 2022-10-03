import 'package:flutter/material.dart';
import 'package:login/domain/modelos/modelsclientes.dart';
import 'package:login/ui/pages/crear.dart';
import 'package:login/ui/pages/editar.dart';

class ListarClientes extends StatefulWidget {
  const ListarClientes({Key? key}) : super(key: key);

  @override
  State<ListarClientes> createState() => _ListarClientesState();
}

class _ListarClientesState extends State<ListarClientes> {

  final List _clientes = listaClientes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de clientes'),
      
      ),
      body: ListView.builder(
        itemCount: _clientes.length,
        itemBuilder: (context,index){
          return ListTile(
            onLongPress: (){
              _borrarCliente(context,_clientes[index]);
            },
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EditarlCliente(gestioncliente: _clientes[index]),//Llamar la Vista 
            )).then((resultado) //Espera por un Resultado
              {
                if(resultado != null){
                _clientes[index] = resultado[0]; //Adiciona a la lista lo que recupera de la vista TextoEjercicio
                setState(() {});
              }
              });
            },
            leading: CircleAvatar(
              child: Text(_clientes[index].nombre.substring(0,1)+_clientes[index].apellido.substring(0,1))),
            title: Text(
              _clientes[index].nombre +" "+ _clientes[index].apellido),
            subtitle:Text(_clientes[index].telefono),
            trailing: const Icon(Icons.call),
          );
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AdicionaClientes(), //Llamar la Vista 
            )).then((resultado) //Espera por un Resultado
            {
              _clientes.addAll(
              resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
              setState(() {});
            });
        },
        child: const Icon(Icons.add),
      ),
         
    );
    
  }
  _borrarCliente(context,Cliente cliente){
    showDialog(
    context: context, 
    builder: (_) => AlertDialog(
      title: const Text("Eliminar contacto"),
      content: Text("Esta seguro de eliminar a ${cliente.nombre} ${cliente.apellido} ?"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        },child: const Text("Cancelar")),
        TextButton(onPressed: (){
          setState(() {
            _clientes.remove(cliente);
          });
          Navigator.pop(context);
        },child: const Text("Borrar",style: TextStyle(color: Colors.red),))
      ],
    )
    );
  }
}

