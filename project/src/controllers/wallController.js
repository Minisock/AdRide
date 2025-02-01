import Wall from '../models/Wall.js';
import { geocodeAddress } from '../services/geocodingService.js';
import cloudinary from '../config/cloudinary.js';

/**
 * @desc   Create a new wall
 * @route  POST /api/walls
 * @access Protected
 */
export const createWall = async (req, res) => {
  try {
    const { wallName, address, height, width, monthlyPrice, availableFrom, availableTo } = req.body;

    // Geocode address to get coordinates
    const location = await geocodeAddress(address);

    // Upload images to Cloudinary
    const images = [];
    if (req.files && req.files.length > 0) {
      for (const file of req.files) {
        const result = await cloudinary.uploader.upload(file.path);
        images.push(result.secure_url);
      }
    }

    const wall = await Wall.create({
      owner: req.user._id,
      images,
      wallName,
      location: {
        type: 'Point',
        coordinates: [location.lng, location.lat],
        address: location.formattedAddress
      },
      height,
      width,
      monthlyPrice,
      availableFrom,
      availableTo
    });

    res.status(201).json({ success: true, data: wall });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
};

/**
 * @desc   Get all walls owned by the logged-in user
 * @route  GET /api/walls
 * @access Protected
 */
export const getMyWalls = async (req, res) => {
  try {
    const walls = await Wall.find({ owner: req.user._id });
    res.json({ success: true, data: walls });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to fetch walls' });
  }
};

/**
 * @desc   Get wall statistics (e.g., total walls, average price)
 * @route  GET /api/walls/stats
 * @access Protected
 */
export const getWallStats = async (req, res) => {
  try {
    const totalWalls = await Wall.countDocuments({ owner: req.user._id });
    const avgPrice = await Wall.aggregate([
      { $match: { owner: req.user._id } },
      { $group: { _id: null, averagePrice: { $avg: '$monthlyPrice' } } }
    ]);

    res.json({
      success: true,
      totalWalls,
      averagePrice: avgPrice.length > 0 ? avgPrice[0].averagePrice : 0
    });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to fetch stats' });
  }
};

/**
 * @desc   Update an existing wall
 * @route  PUT /api/walls/:id
 * @access Protected
 */
export const updateWall = async (req, res) => {
  try {
    const updatedData = { ...req.body };

    if (req.files && req.files.length > 0) {
      const images = [];
      for (const file of req.files) {
        const result = await cloudinary.uploader.upload(file.path);
        images.push(result.secure_url);
      }
      updatedData.images = images;
    }

    const wall = await Wall.findOneAndUpdate(
      { _id: req.params.id, owner: req.user._id },
      updatedData,
      { new: true }
    );

    if (!wall) {
      return res.status(404).json({ success: false, error: 'Wall not found' });
    }

    res.json({ success: true, data: wall });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to update wall' });
  }
};

/**
 * @desc   Delete a wall
 * @route  DELETE /api/walls/:id
 * @access Protected
 */
export const deleteWall = async (req, res) => {
  try {
    const wall = await Wall.findOneAndDelete({ _id: req.params.id, owner: req.user._id });

    if (!wall) {
      return res.status(404).json({ success: false, error: 'Wall not found' });
    }

    res.json({ success: true, message: 'Wall deleted successfully' });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to delete wall' });
  }
};

/**
 * @desc   Search walls by name
 * @route  GET /api/walls/search
 * @access Protected
 */
export const searchWalls = async (req, res) => {
  try {
    const { query } = req.query;
    const walls = await Wall.find({
      owner: req.user._id,
      wallName: { $regex: query, $options: 'i' }
    });

    res.json({ success: true, data: walls });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Search failed' });
  }
};

/**
 * @desc   Get a single wall by ID
 * @route  GET /api/walls/:id
 * @access Protected
 */
export const getWallById = async (req, res) => {
  try {
    const wall = await Wall.findOne({ _id: req.params.id, owner: req.user._id });

    if (!wall) {
      return res.status(404).json({ success: false, error: 'Wall not found' });
    }

    res.json({ success: true, data: wall });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to fetch wall details' });
  }
};
