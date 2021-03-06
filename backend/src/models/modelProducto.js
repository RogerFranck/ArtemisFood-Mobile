const { Schema, model } = require('mongoose');

const productoSchema = new Schema({
    nombre: {
        type: String,
        required: true,
    },
    descripcion:{
        type: String
    },
    cantidad: {
        type: Number,
        required: true,
        default: 0,
    },
    precio: {
        type: Number,
        required: true,
    },
    foto: {
        type: String,
        required: true,
    },
    categoria: {
        type: String,
        required: true,
    },

})

module.exports = model('productoModel', productoSchema)