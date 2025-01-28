import Wall from '../models/Wall.js';

export const addWall = async (req, res) => {
  try {
    const { location, size } = req.body;
    const wall = await Wall.create({ owner: req.user._id, location, size });
    res.status(201).json(wall);
  } catch (err) {
    res.status(500).json({ error: 'Failed to add wall' });
  }
};

export const getMyWalls = async (req, res) => {
  try {
    const walls = await Wall.find({ owner: req.user._id });
    res.status(200).json(walls);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch walls' });
  }
};