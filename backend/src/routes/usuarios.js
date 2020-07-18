const {Router} = require('express')
const router = Router();

const {getUsers, createUser, getUser, updateUser, deleteUser} = require('../controllers/usuarios.controller')

router.route('/') // usuarios
  .get(getUsers) 
  .post(createUser)
router.route('/:id') // usuarios/:id
  .get(getUser)
  .put(updateUser)
  .delete(deleteUser)

module.exports = router;