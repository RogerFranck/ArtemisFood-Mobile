class Producto {
  int cantidad;
  String id;
  String nombre;
  int precio;
  String foto;
  String descripcion;
  String categoria;

  Producto(
    this.cantidad,
    this.id,
    this.nombre,
    this.precio,
    this.foto,
    this.descripcion,
    this.categoria,
  );

  Producto.fromJson(Map<String, dynamic> json) {
    cantidad = json["cantidad"];
    id = json["_id"];
    nombre = json["nombre"];
    precio = json["precio"];
    foto = json["foto"];
    descripcion = json["descripcion"];
    categoria = json["categoria"];
  }
  
}