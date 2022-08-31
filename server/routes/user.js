const { json } = require('express');
const express = require('express');
const userRouter = express.Router();
const auth = require('../middlewares/auth');
const { Product } = require('../models/product');
const User = require('../models/user');

userRouter.post('/api/add-to-cart', auth, async (req, res) => {
    try {
        const { id } = req.body;
        const product = await Product.findById(id);
        let user = await User.findById(req.user);

        if(user.cart.length == 0) {
            user.cart.push({ product, quantity: 1 });
        } else {
            let isProductFound = false;
            for(let i = 0; i < user.cart.length; i++) {
// if(user.cart[i].product._id.equals(id)) { ----- FALSE we can't use id because the id we get from route is string and the id which provide by mongoos is an object so this is the false condition even if both are same
// if(user.cart[i].product._id.toString().equals(id)) { -----TRUE we can perform the above condition in this way ..by converting product id in a string then compare it with the id we get from route
// if(user.cart[i].product._id == product.id) { ----- FALSE as similar the first
                if(user.cart[i].product._id.equals(product.id)) {
                    isProductFound = true;
                    // user.cart[i].quatity++;
                    break;
                }
            }    
            if(isProductFound) {
                let editableProduct = user.cart.find((e) => 
                    e.product._id.equals(product.id)
                );
                editableProduct.quantity += 1;
            } else {
                user.cart.push({product, quantity: 1});
            }
        }
        user = await user.save();
        res.json(user);
    } catch(e) {
        res.status(500).json({ error: e.message });
    }
});


userRouter.delete('/api/remove-from-cart/:id', auth, async (req, res) => {
    try {
        const { id } = req.params;
        const product = await Product.findById(id);
        let user = await User.findById(req.user);

        for(let i = 0; i < user.cart.length; i++) {
            if(user.cart[i].product._id.equals(product._id)) {
                if(user.cart[i].quantity == 1) {
                    user.cart.splice(i, 1);
                } else {
                    user.cart[i].quantity -= 1;
                }
            }
        }    

        user = await user.save();
        res.json(user);
    } catch(e) {
        res.status(500).json({ error: e.message });
    }
});


module.exports = userRouter;
