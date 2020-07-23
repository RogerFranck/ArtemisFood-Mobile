class Comidas{
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;

  Comidas(
  { this.nombre, 
    this.precio, 
    this.imagen,
    this.descripcion,
    }
  );
}

List<Comidas> listaComidas = [
  Comidas(
    nombre: 'Spaghetti a la bolognesa',
    precio: 150.0,
    imagen: 'https://us.123rf.com/450wm/gdolgikh/gdolgikh1606/gdolgikh160600093/58235314-espaguetis-a-la-bolo%C3%B1esa-pasta-italiana-tradicional.jpg?ver=6',
    descripcion: 'Rico spaghetti a la bolognesa con salsa de tomate y fideos hechos por ArtemisFood',
  ),
  Comidas(
    nombre: 'Cheeseburguer',
    precio: 120.0,
    imagen: 'https://s2.best-wallpaper.net/wallpaper/2880x1800/1808/Hamburger-meat-French-fries-fast-food_2880x1800.jpg',
    descripcion: 'Rico spaghetti a la bolognesa con salsa de tomate y fideos hechos por ArtemisFood',
  ),
  Comidas(
    nombre: 'Chicken bake',
    precio: 75.0,
    imagen: 'https://cdn.momsdish.com/wp-content/uploads/2018/09/1429074010_7-scaled.jpg',
    descripcion: 'Rico spaghetti a la bolognesa con salsa de tomate y fideos hechos por ArtemisFood',
  ),
  Comidas(
    nombre: 'Pizza de pepperoni',
    precio: 110.0,
    imagen: 'https://placeralplato.com/files/2016/01/Pizza-con-pepperoni.jpg',
    descripcion: 'Rico spaghetti a la bolognesa con salsa de tomate y fideos hechos por ArtemisFood',
  ),
  Comidas(
    nombre: 'Chilaquiles rojos',
    precio: 90.0,
    imagen: 'https://www.cocinavital.mx/wp-content/uploads/2017/11/chilaquiles-rojos-paso-a-paso.jpg',
    descripcion: 'Rico spaghetti a la bolognesa con salsa de tomate y fideos hechos por ArtemisFood',
  ),
  Comidas(
    nombre: 'Relleno negro',
    precio: 60.0,
    imagen: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/a6/67/6b/recado-negro.jpg',
    descripcion: 'Rico spaghetti a la bolognesa con salsa de tomate y fideos hechos por ArtemisFood',
  ),
];