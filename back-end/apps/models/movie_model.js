let mongoose = require('mongoose');
var random = require('mongoose-simple-random');
let Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId;

const movieSchema = new mongoose.Schema({
    _id: ObjectId,
    id_category: [String],
    title: String,
    description: String,
    image: String,
    banner: String,
    is_favorite: Boolean,
    episode_number: Number,
    views: Number,
    videos: [{
        number: Number,
        url: String
    }]
}, { versionKey: false }).plugin(random, { path: 'r' });

const movie = mongoose.model('movies', movieSchema);

module.exports = movie;