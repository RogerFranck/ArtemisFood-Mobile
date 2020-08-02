const { Schema, model } = require('mongoose');

const categoriaSchema = new Schema({
    categoria: {
        type: String,
        required: true
    }

})

module.exports = model('categoriaModel', categoriaSchema)