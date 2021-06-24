let movieModel = require('../models/movie_model');
let categoryModel = require('../models/category_model');

exports.getApiMovieByID = async(req, res) => {
    if (typeof req.query.id_status !== 'undefined') {
        if (req.query.id_status == 0) {
            var page = Math.max(0, req.query.page);
            var perPage = 3;
            movieModel
            .find()
            .sort({views: -1})
            .skip((perPage * page) - perPage)
            .limit(perPage)
            .exec(function(err, movie) {
                if (err) res.status(400).json(err);
                res.status(200).json(movie);
            });
        }
        else if (req.query.id_status == 1) {
            var page = Math.max(0, req.query.page);
            var perPage = 3;
            await movieModel.findRandom({}, {}, {limit: perPage}, function(err, results) {
                if (err) throw err;
                else res.status(200).json(results);
            }).skip((perPage * page) - perPage).countDocuments();
        }
        else {
            var page = Math.max(0, req.query.page);
            var perPage = 3;
            movieModel
            .find()
            .skip((perPage * page) - perPage)
            .limit(perPage)
            .exec(function(err, movie) {
                if (err) res.status(400).json(err);
                res.status(200).json(movie);
            });
        }
    } else {
        movieModel
        .findById(req.query.id_movie)
        .exec(function(err, movie) {
            if (err) res.status(400).json(err);
            res.status(200).json(movie);
        });
    }
}

exports.getApiMovieTop = async(req, res) => {
    var page = Math.max(0, req.query.page);
    var perPage = 3;
    movieModel
    .find()
    .sort({views: -1})
    .skip((perPage * page) - perPage)
    .limit(perPage)
    .exec(function(err, movie) {
        if (err) res.status(400).json(err);
        res.status(200).json(movie);
    });
}

exports.getMetadata = async(req, res) => {
    var featuredMovie = await movieModel.find().sort({views: -1}).limit(4);
    var allMovie = await movieModel.find().limit(10);
    var bannerMovie = await movieModel.find().sort('-date').limit(5);
    await movieModel.findRandom({}, {}, {limit: 4}, function(err, results) {
        if (err) throw err;
        else res.status(200).json({
            "status": "success",
            "data": {
                "result": [
                    {
                        "id_status": 0,
                        "title": "Anime đặc sắc",
                        "movies": featuredMovie
                    },
                    {
                        "id_status": 1,
                        "title": "Hôm nay xem gì",
                        "movies": results
                    },
                    {
                        "id_status": 2,
                        "title": "Tất cả anime",
                        "movies": allMovie
                    }
                ],
                "banner": {
                    "id_category": "6062916048c2545cede942a6",
                    "title": "Tất cả anime",
                    "movies": bannerMovie
                },
            }
        });
      }).countDocuments();
    
}

exports.putIsFavoriteMovie = async(req, res) => {
    movieModel.findOne({"id_movie": req.body.id_movie}).then(result => {
        result.is_favorite ? result.is_favorite = false : result.is_favorite = true;
        return result.save();
    }).then(() => {
        res.status(200).json({
            "status": "success",
            "message": "success"
        });
    }).catch(err => {res.json(err)});
};

exports.findMovieByName = async(req, res) => {
    const name = req.query.name;
    
    let filter = {title: {$regex: '.*' + name + '.*', $options: 'i'}};

    if (!name) {
        filter = {};
    }
    movieModel.find(filter)
            .exec(function(err, movies) {
                if (movies) {
                    res.status(200).json(movies);
                } else {
                    res.status(400).send(JSON.stringify({
                        error : err,
                    }));
                }
            });
};