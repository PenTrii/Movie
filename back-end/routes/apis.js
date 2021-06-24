let express = require("express");
let movieController = require("../apps/controllers/movie_controller");

const router = express.Router();

// router.get("/metadata",  metadataController.getApiMetadata);
router.get("/metadata",  movieController.getMetadata);
router.get("/movie",  movieController.getApiMovieByID);
router.get("/movie/find",  movieController.findMovieByName);
router.get("/movie/top",  movieController.getApiMovieTop);
router.put("/movie/favorite",  movieController.putIsFavoriteMovie);

module.exports = router;