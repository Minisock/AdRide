const AdWall = require('../models/adWallModel');

exports.getAdWalls = async (req, res) => {
  try {
    const adWalls = await AdWall.find();
    res.status(200).json(adWalls);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
