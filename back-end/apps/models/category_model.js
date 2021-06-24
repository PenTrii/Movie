let mongoose = require('mongoose');
let Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId;

const categorySchema = new mongoose.Schema({
    _id: ObjectId,
    title: String,
}, { versionKey: false });

const category = mongoose.model('categories', categorySchema);

module.exports = category;