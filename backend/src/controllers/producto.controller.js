const productosCtrl = {};

const productoModel = require('../models/modelProducto')

productosCtrl.getProducts = async(req, res) => {
    const productos = await productoModel.find()
    res.json(productos)
};

productosCtrl.createProduct = async(req, res) => {
    console.log(req.body);
    const { nombre, cantidad, precio, foto, descripcion, categoria } = req.body
    const nuevoProducto = new productoModel({
        nombre: nombre,
        cantidad: cantidad,
        precio: precio,
        foto: foto,
        descripcion:descripcion,
        categoria:categoria
    });
    await nuevoProducto.save();
    res.json({ message: 'Producto guardado' })
}


productosCtrl.getProduct = async(req, res) => {
    const producto = await productoModel.findById(req.params.id)
    res.json(producto)
};

productosCtrl.updateProduct = async(req, res) => {
    const { nombre, cantidad, precio, foto,descripcion, categoria} = req.body
    const nuevoProducto = {
        nombre: nombre,
        cantidad: cantidad,
        precio: precio,
        foto: foto,
        descripcion:descripcion,
        categoria:categoria
    }
    await productoModel.findOneAndUpdate({ _id: req.params.id }, nuevoProducto)
    res.json({ message: "Producto Actualizado" })
};


productosCtrl.deleteProduct = async(req, res) => {
    await productoModel.findOneAndDelete({ _id: req.params.id })
    res.json({ message: 'Producto borrado' })
};


productosCtrl.searchProducto = async(req, res) => {
    const data = await productoModel.find( {"nombre": new RegExp( `${req.params.nombre}` , 'gi' ) } );
    res.json( data )
}

productosCtrl.categoryProducto = async(req, res) => {
    const data_by_category = await productoModel.find( {"categoria" : req.params.categoria});
    res.json(data_by_category)
}


module.exports = productosCtrl;