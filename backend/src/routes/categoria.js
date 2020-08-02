const { Router } = require('express')
const router = Router();

const { getCategoria, createCategoria, updateCategoria, deleteCategoria } = require('../controllers/categoria.controller')

router.route('/')
    .get(getCategoria)
    .post(createCategoria)
router.route('/:id')
    .put(updateCategoria)
    .delete(deleteCategoria)


module.exports = router;