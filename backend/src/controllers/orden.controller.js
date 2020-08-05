const ordenesCtrl = {};

const ordenModel = require('../models/modelOrden')
const productoModel = require('../models/modelProducto')


ordenesCtrl.getOrdenes = async(req, res) => {
    const ordenes = await ordenModel.find()
    res.json(ordenes)
};

async function validador(data){
    var tamaño = data.length;
    for (let x = 0; tamaño > x; x++ ){
        var { id_producto, cantidad_producto } = data[x]
        var  {cantidad}  = await productoModel.findOne({"_id" : id_producto})
        //console.log(cantidad)
        if (cantidad < cantidad_producto){
            return false;
        }
    }
    return true;
};

async function actualizarProductos(data){
    var tamaño = data.length;
    
    for (let x = 0; tamaño > x; x++ ){
        var { id_producto, cantidad_producto } = data[x]
        const { nombre, cantidad, precio, foto,descripcion, categoria} = await productoModel.findOne({"_id" : id_producto})
        
        const nuevoProducto = {
            nombre: nombre,
            cantidad: cantidad - cantidad_producto,
            precio: precio,
            foto: foto,
            descripcion:descripcion,
            categoria:categoria
        }
        await productoModel.findOneAndUpdate({"_id" : id_producto}, nuevoProducto)
}
}

ordenesCtrl.createOrden = async(req, res) => {
    
    const { id_usuario, fecha, activa, productos, lugar, tiempo, precio_final } = req.body
    //console.log(id_usuario)
    const bandera = await validador(productos);
    console.log(bandera)
    if (bandera == true){

        const nuevoOrden = new ordenModel({
            id_usuario: id_usuario, 
            fecha: fecha,
            activa: activa,
            productos: productos, 
            lugar: lugar,
            tiempo: tiempo,
            precio_final: precio_final
        });

        await nuevoOrden.save();
        await actualizarProductos(productos);
        res.json({ message: 'Orden guardada' })
    }
    else{
        res.json({message: "Orden rechazada" })
    }
}


ordenesCtrl.getOrden = async(req, res) => {
    const orden = await ordenModel.findById(req.params.id)
    res.json(orden)
};

ordenesCtrl.updateOrden = async(req, res) => {
    const { id_usuario, fecha, activa, productos, lugar, tiempo, precio_final } = req.body
    const nuevoOrden = {
        id_usuario: id_usuario, 
        fecha: fecha,
        activa: activa,
        productos: productos, 
        lugar: lugar,
        tiempo: tiempo,
        precio_final: precio_final
    }
    await ordenModel.findOneAndUpdate({ _id: req.params.id }, nuevoOrden)
    res.json({ message: "Orden Actualizada" })
};


ordenesCtrl.deleteOrden = async(req, res) => {
    await ordenModel.findOneAndDelete({ _id: req.params.id })
    res.json({ message: 'Orden borrada' })
};


// Historial de Entregas
ordenesCtrl.getEntregas = async(req, res) => {
    const data = await ordenModel.find({ 'activa': `${req.params.activa}` })
    res.json(data);
};



module.exports = ordenesCtrl;