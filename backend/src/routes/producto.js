const { Router } = require('express')
const router = Router();

const { getProducts, createProduct, getProduct, updateProduct, deleteProduct, searchProducto, categoryProducto} = require('../controllers/producto.controller')

router.route('/') // producto
    .get(getProducts)
    .post(createProduct)
router.route('/:id') // producto/:id
    .get(getProduct)
    .put(updateProduct)
    .delete(deleteProduct)
router.route('/find/:nombre')
    .get(searchProducto)
router.route("/categoria/:categoria")
    .get(categoryProducto)


module.exports = router;