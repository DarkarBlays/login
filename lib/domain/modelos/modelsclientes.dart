class Cliente{
  var nombre,apellido,telefono;

  Cliente({this.nombre,this.apellido,this.telefono});

}

List<Cliente> listaClientes = [
  Cliente(nombre: 'Alex',apellido: 'Vaca',telefono: '3122345543'),
  Cliente(nombre: 'Pedro',apellido: 'Perez',telefono: '3022345543'),
  Cliente(nombre: 'Maria',apellido: 'Diaz',telefono: '3042455543'),
];