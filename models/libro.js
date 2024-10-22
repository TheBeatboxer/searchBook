const mongoose = require('mongoose');

const LibroSchema = new mongoose.Schema({
    titulo: { type: String, required: true },
    autor: { type: String, required: true },
    categoria: String,
    publicacion: Date
});

module.exports = mongoose.model('Libro', LibroSchema);
