const express = require('express');
const cors = require('cors');
const app = express();

//settings
app.set('port', process.env.PORT || 4000)

//middlewares
app.use(express.urlencoded({ extended: false }));
app.use(cors());
app.use(express.json());

//routes
app.use('/usuarios', require('./routes/usuarios'))
app.use('/producto', require('./routes/producto'))
app.use('/orden', require('./routes/orden'))
app.use('/login', require('./routes/login'))
app.use('/categoria', require('./routes/categoria'))

module.exports = app;