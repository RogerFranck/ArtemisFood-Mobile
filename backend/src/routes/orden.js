const { Router } = require('express')
const router = Router();

const { getOrdenes, createOrden, getOrden, updateOrden, deleteOrden, getEntregas } = require('../controllers/orden.controller')

router.route('/') // Ordeno
    .get(getOrdenes)
    .post(createOrden)
router.route('/:id') // Ordeno/:id
    .get(getOrden)
    .put(updateOrden)
    .delete(deleteOrden)
router.route('/historial/:activa')
    .get(getEntregas)

module.exports = router;