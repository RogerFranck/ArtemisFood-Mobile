categoriaCtrl = {}

const categoriaModel = require('../models/modelCategoria');

categoriaCtrl.getCategoria = async(req, res) => {
    const categoria = await categoriaModel.find()
    res.json(categoria)
};

categoriaCtrl.createCategoria = async(req, res) => {
    const {categoria} = req.body
    const nuevaCategoria = new categoriaModel({
        categoria: categoria
    })
    await nuevaCategoria.save()
    res.json( { message: "Categoria Creada" } )
};

categoriaCtrl.updateCategoria = async(req,res) => {
    const {categoria} = req.body
    const nuevaCategoria = {
        categoria: categoria
    }
    await categoriaModel.findOneAndUpdate( {_id: req.params.id}, nuevaCategoria)
    res.json( {message: "Categoria Actualizada"} )
};

categoriaCtrl.deleteCategoria = async(req, res) => {
    await categoriaModel.findOneAndDelete( {_id: req.params.id} )
    res.json( {message: "Categoria Borrada"} )
};

module.exports = categoriaCtrl;