const { Schema, model } = require('mongoose');

const ordenSchema = new Schema({
    id_usuario: {
        type: String,
        required: true,
    },
    fecha: {
        type: Date,
        required: true,
    },
    activa: {
        type: Boolean,
        required: true,
    },
    id_producto: {
        type: String,
        required: true,
    },
    cantidad: {
        type: Number,
        required: true,
    },
    lugar: {
        type: String,
        required: true,
    },
    tiempo: {
        type: Date,
        required: true,
        default: Date.now(),
    },

})

module.exports = model('ordenModel', ordenSchema)