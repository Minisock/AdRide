const Ad = require("../models/adModel");

const getAllAds = async (req, res) => {
  try {
    const ads = await Ad.find().populate("advertiser wall");
    res.status(200).json(ads);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const getAdsByWall = async (req, res) => {
  try {
    const { wallId } = req.params;
    const ads = await Ad.find({ wall: wallId }).populate("advertiser wall");
    res.status(200).json(ads);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = { getAllAds, getAdsByWall };