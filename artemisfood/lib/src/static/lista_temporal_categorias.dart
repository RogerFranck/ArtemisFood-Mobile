class Comidas {
  final String nombre;
  final double precio;
  final String imagen;
  final String categoria;

  Comidas(
      {
    this.nombre, 
    this.precio, 
    this.imagen,
    this.categoria,
    }
  );
}

List<Comidas> listaCategorias = [
  Comidas(
    nombre: 'Hamburguesa con queso',
    precio: 110.0,
    imagen: 'https://s2.best-wallpaper.net/wallpaper/2880x1800/1808/Hamburger-meat-French-fries-fast-food_2880x1800.jpg',
    categoria: 'Hamburguesa',
  ),
  Comidas(
    nombre: 'Spaghetti a la bolognesa',
    precio: 110.0,
    imagen: 'https://us.123rf.com/450wm/gdolgikh/gdolgikh1606/gdolgikh160600093/58235314-espaguetis-a-la-bolo%C3%B1esa-pasta-italiana-tradicional.jpg?ver=6',
    categoria: 'Spaghettis',
  ),
  Comidas(
    nombre: 'Chicken bakes',
    precio: 110.0,
    imagen: 'https://cdn.momsdish.com/wp-content/uploads/2018/09/1429074010_7-scaled.jpg',
    categoria: 'Chicken Bakes',
  ),
  Comidas(
    nombre: 'Pizza de pepperoni',
    precio: 110.0,
    imagen: 'https://placeralplato.com/files/2016/01/Pizza-con-pepperoni.jpg',
    categoria: 'Pizzas',
  ),
  Comidas(
    nombre: 'Chilaquiles Rojos',
    precio: 110.0,
    imagen: 'https://www.cocinavital.mx/wp-content/uploads/2017/11/chilaquiles-rojos-paso-a-paso.jpg',
    categoria: 'Chilaquiles',
  ),
  Comidas(
    nombre: 'Relleno negro',
    precio: 110.0,
    imagen: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/a6/67/6b/recado-negro.jpg',
    categoria: 'Local',
  ),
  Comidas(
    nombre: 'Big dicks',
    precio: 110.0,
    imagen: 'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fwp-content%2Fblogs.dir%2F6%2Ffiles%2F2019%2F06%2Fdick-worldwide-interview-instagram-penis-art-0.jpg?w=960&cbr=1&q=90&fit=max',
    categoria: 'Nepes',
  ),
];