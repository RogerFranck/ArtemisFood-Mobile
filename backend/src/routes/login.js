const { Router } = require('express')
const router = Router();

const User = require('../models/modelUsuario')
const jwt = require('jsonwebtoken');

async function verifyToken(req, res, next) {
    const token = req.headers['x-jwt'];
    if (!token) {
        return res.json({ auth: false, message: 'No token provided' });
    }
    const decoded = await jwt.verify(token, process.env.SECRET);
    req.userId = decoded.id;
    next();
}

router.post('/', async (req, res) => {
    const user = await User.findOne({ usuario: req.body.usuario })
    if (!user) {
        return res.json({ status: "The user doesn't exists" })
    }
    const validPassword = await user.comparePassword(req.body.password);
    if (!validPassword) {
        return res.json({ status: "Invalid Password" });
    }
    const token = jwt.sign({ id: user._id }, process.env.SECRET, {
        //expiresIn: 60 * 60 * 24
    });
    res.json({ auth: true, token, user });
});

router.get('/validar', verifyToken, async (req, res) => {
    const user = await User.findById(req.userId, { password: 0 });
    if (!user) {
        return res.json({status:"No user found."});
    }
    res.json(user);
});

module.exports = router;