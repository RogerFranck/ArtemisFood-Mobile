const usuariosCtrl = {};

const usuarioModel = require('../models/modelUsuario')
const bcrypt = require('bcryptjs');

usuariosCtrl.getUsers = async (req, res) => {
  const usuarios = await usuarioModel.find()
  res.json(usuarios)
};

usuariosCtrl.createUser = async (req, res) => {
  const { tipo, usuario, password } = req.body
  const nuevoUsuario = new usuarioModel({
    tipo: tipo,
    usuario: usuario,
    password: password,
  });
  nuevoUsuario.password = await nuevoUsuario.encryptPassword(password);
  await nuevoUsuario.save();
  res.json({ message: 'Usuario guardado' })
}


usuariosCtrl.getUser = async (req, res) => {
  const usuario = await usuarioModel.findById(req.params.id)
  res.json(usuario)
};

usuariosCtrl.updateUser = async (req, res) => {
  const { tipo, usuario, password, favoritos} = req.body
  const nuevoUsuario = {
    tipo: tipo,
    usuario: usuario,
    password: password,
    favoritos: favoritos,
  }
  const salt = await bcrypt.genSalt(10);
  nuevoUsuario.password = await bcrypt.hash(password, salt);
  await usuarioModel.findOneAndUpdate({ _id: req.params.id }, nuevoUsuario)
  res.json({ message: "Usuario Actualizado" })
};


usuariosCtrl.deleteUser = async (req, res) => {
  await usuarioModel.findOneAndDelete({ _id: req.params.id })
  res.json({ message: 'Usuario borrado' })
};


//Trabajando en favoritos
usuariosCtrl.updateFavoritos = async(req, res) => {
  const idUser = req.body.user
  const id_Producto = req.body.producto
  const { favoritos } = await usuarioModel.findOne({_id: idUser})

  const nuevoFavorito = {
    favoritos: favoritos, id_Producto
  
  }
  console.log(nuevoFavorito)

  //await usuarioModel.findOneAndUpdate( {_id: idUser}, nuevoFavorito )
  res.json( { message: "Nuevo producto agregado a favoritos" } )
}


module.exports = usuariosCtrl;