const ordenesCtrl = {};

const ordenModel = require('../models/modelOrden')

ordenesCtrl.getOrdenes = async(req, res) => {
    const ordenes = await ordenModel.find()
    res.json(ordenes)
};

ordenesCtrl.createOrden = async(req, res) => {
    console.log(req.body);
    const { id_usuario, fecha, activa, id_producto, cantidad, lugar, tiempo } = req.body
    const nuevoOrden = new ordenModel({
        id_usuario: id_usuario, //5f137df2b2d0dd1ea0f92a4a
        fecha: fecha,
        activa: activa,
        id_producto: id_producto, //5f13884468521e4ec81df4ee
        cantidad: cantidad,
        lugar: lugar,
        tiempo: tiempo,
    });
    await nuevoOrden.save();
    res.json({ message: 'Orden guardada' })
}


ordenesCtrl.getOrden = async(req, res) => {
    const orden = await ordenModel.findById(req.params.id)
    res.json(orden)
};

ordenesCtrl.updateOrden = async(req, res) => {
    const { id_usuario, fecha, activa, id_producto, cantidad, lugar, tiempo } = req.body
    const nuevoOrden = {
        id_usuario: id_usuario,
        fecha: fecha,
        activa: activa,
        id_producto: id_producto,
        cantidad: cantidad,
        lugar: lugar,
        tiempo: tiempo,
    }
    await ordenModel.findOneAndUpdate({ _id: req.params.id }, nuevoOrden)
    res.json({ message: "Orden Actualizada" })
};


ordenesCtrl.deleteOrden = async(req, res) => {
    await ordenModel.findOneAndDelete({ _id: req.params.id })
    res.json({ message: 'Orden borrada' })
};


module.exports = ordenesCtrl;