const express = require("express");
const { getAllAds, getAdsByWall } = require("../controllers/adController");

const router = express.Router();

router.get("/", getAllAds);

router.get("/wall/:wallId", getAdsByWall);

module.exports = router;