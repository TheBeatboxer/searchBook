const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const librosRouter = require('./routes/libros');

dotenv.config();

const app = express();
app.use(express.json());

// Conexión a MongoDB Atlas
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('Conectado a MongoDB'))
    .catch(err => console.error('Error conectando a MongoDB:', err));

// Rutas
app.use('/api/libros', librosRouter);

// Iniciar el servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});
