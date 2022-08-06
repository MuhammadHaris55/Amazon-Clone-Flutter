const express = require('express');
const productRouter = express.Router();

const auth = require('../middlewares/auth');
const Product = require('../models/product');

// /api/products?category=Essential --------- req.query.category
// /api/products:category=Apliance  --------- req.params.category
productRouter.get('/api/category-products', auth, async (req, res) => {

    try {
        const products = await Product.find({ category: req.query.category });
        res.json(products);
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});
//api/products/search/i
// api/products/search/:name
//api/products/search/iphone/mobiles    ---- req.params.name = iphone
// api/products/search/:name/:category  ---- req.params.category = mobiles

productRouter.get('/api/products/search/:name', auth, async (req, res) => {
    try {
        const products = await Product.find({
            name: { $regex: req.params.name, $options: 'i'},
        },);
        res.json(products);

    } catch(e) {
        res.status(500).json({error: e.message});
    }
})

productRouter.post('/api/rate-product', auth, async (req, res) => {
    try {
        const {id, rating} = req.body;
        let product = await Product.findById(id);

        for(let i = 0; i < product.ratings.length; i++) {
            if(product.ratings[i].userId == req.user) {
                product.ratings.splice(i, 1);
                break;
            }
        }
        const ratingSchema = {
            userId: req.user,
            rating,
        };
        product.ratings.push(ratingSchema);
        product = await product.save();
        res.json(product);
    } catch(e) {
        res.status(500).json({error: e.message});
    }
})

module.exports = productRouter;