const productosCtrl = {};

const productoModel = require('../models/modelProducto')

productosCtrl.getProducts = async(req, res) => {
    const productos = await productoModel.find()
    res.json({Producto:productos})
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


function Organizar(data1, data2){
    var bandera = 0;
    const data = data1;
    for(let i = 0; data2.length > i; i++){
        bandera = 0;
        for (let j = 0; data1.length > j; j++){
            if (data2[i].id == data1[j].id){
                bandera = bandera + 1;
            }
        }
        if (bandera == 0){
            data.push(data2[i])
        }
    }
    return data;
};

productosCtrl.searchProducto = async(req, res) => {
    const data1 = await productoModel.find( { "nombre": new RegExp( `^${req.params.nombre}`, 'i') } );
    const data2 = await productoModel.find( {"nombre": new RegExp( `${req.params.nombre}` , 'gi' ) } );
    const data = Organizar(data1, data2);
    res.json( data )
}

productosCtrl.categoryProducto = async(req, res) => {
    const data_by_category = await productoModel.find( {"categoria" : req.params.categoria});
    res.json(data_by_category)
}


module.exports = productosCtrl;