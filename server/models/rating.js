const mongoos = require('mongoose');

const ratingSchema = mongoos.Schema({
    userId: {
        type: String,
        required: true,
    },
    rating: {
        type: Number,
        required: true,
    }
});

module.exports = ratingSchema;
