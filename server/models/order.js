const mongoose = require('mongoose');
const { productSchema } = require('./product');

const orderSchema = mongoose.Schema({

    products: [
        {
            product: productSchema,
            quantity: {
                type: Number,
                required: true,
            },
        },
    ],
    totalPrice: {
        type: Number,
        required: true,
    },
    address: {
        type: String,
        required: true,
    },
    userId: {
        type: String,
        required: true,
    },
    orderedAt: {
        type: Number,
        required: true,
    },
    
    status: {
        type: Number,
        default: 0,
// 0 = pending - User just placed an order
// 1 = completed - product is delivered from our side
// 2 = recieved - the user has ticked marked it
// 3 = delivered - both the parties are agreed and all done
    }

});

const Order = mongoose.model('Order', orderSchema);
module.exports = Order;
