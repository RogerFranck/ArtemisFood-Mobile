const { Router } = require('express')
const router = Router();

const { getOrdenes, createOrden, getOrden, updateOrden, deleteOrden } = require('../controllers/orden.controller')

router.route('/') // Ordeno
    .get(getOrdenes)
    .post(createOrden)
router.route('/:id') // Ordeno/:id
    .get(getOrden)
    .put(updateOrden)
    .delete(deleteOrden)

module.exports = router;