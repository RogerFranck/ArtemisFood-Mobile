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
    productos: {
        type: Array,
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
    precio_final: {
        type: Number,
        required: true,
    }

})

module.exports = model('ordenModel', ordenSchema)