const express = require('express');
const router = express.Router();
const Libro = require('../models/libro');

// Ruta para obtener todos los libros
router.get('/', async (req, res) => {
    try {
        const libros = await Libro.find();
        res.json(libros);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

// Ruta para buscar libros por título o autor
router.get('/buscar', async (req, res) => {
    try {
        const { query } = req.query;
        const libros = await Libro.find({
            $or: [
                { titulo: { $regex: query, $options: 'i' } },
                { autor: { $regex: query, $options: 'i' } }
            ]
        });
        res.json(libros);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

// Ruta para crear un libro
router.post('/', async (req, res) => {
    const libro = new Libro({
        titulo: req.body.titulo,
        autor: req.body.autor,
        categoria: req.body.categoria,
        publicacion: req.body.publicacion
    });
    
    try {
        const nuevoLibro = await libro.save();
        res.status(201).json(nuevoLibro);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});

module.exports = router;
