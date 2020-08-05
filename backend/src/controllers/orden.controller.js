const ordenesCtrl = {};

const ordenModel = require('../models/modelOrden')
const productoModel = require('../models/modelUsuario')

ordenesCtrl.getOrdenes = async(req, res) => {
    const ordenes = await ordenModel.find()
    res.json(ordenes)
};

function validador(data){
    return true;
}

ordenesCtrl.createOrden = async(req, res) => {
    
    const { id_usuario, fecha, activa, productos, lugar, tiempo, precio_final } = req.body
    const bandera = validador(productos);

    //for(var x = 0; x < 7;x++){
    console.log(bandera)
    
    if (bandera == false){

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