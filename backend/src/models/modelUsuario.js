const {Schema, model} = require('mongoose');
const bcrypt = require('bcryptjs');

const usuarioSchema = new Schema({
  usuario: {
    type: String,
    required: true,
  },
  password:{
    type: String,
    required: true
  },
  tipo:{
    type: Number,
    required: true,
    default: 1,
  },
  favoritos: {
    type: Array,
    required: false
  }
}
)

usuarioSchema.methods.encryptPassword = async (password) => {
  const salt = await bcrypt.genSalt(10);
  return bcrypt.hash(password, salt);
};

usuarioSchema.methods.comparePassword = function (password) {
  return bcrypt.compare(password, this.password);
};

module.exports = model('usuarioModel', usuarioSchema)