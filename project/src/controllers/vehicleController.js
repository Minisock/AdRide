import Vehicle from '../models/Vehicle.js';
import cloudinary from '../config/cloudinary.js';

export const registerVehicle = async (req, res) => {
  try {
    if (req.user.role !== 'Autowala/HelmetWala') {
      return res.status(403).json({
        success: false,
        error: 'Only vehicle operators can register vehicles'
      });
    }

    const { registrationNo, vehicleType, dimensions } = req.body;
    
    // Upload images
    const images = [];
    if (req.files && req.files.length > 0) {
      for (const file of req.files) {
        const result = await cloudinary.uploader.upload(file.path, {
          folder: 'adride/vehicles'
        });
        images.push(result.secure_url);
      }
    }

    const vehicle = await Vehicle.create({
      owner: req.user._id,
      registrationNo,
      vehicleType,
      images,
      dimensions,
      location: req.body.location // Should be geocoded coordinates
    });

    res.status(201).json({ success: true, data: vehicle });
  } catch (err) {
    res.status(400).json({ 
      success: false, 
      error: err.message.includes('duplicate') 
        ? 'Registration number already exists' 
        : err.message 
    });
  }
};

export const getMyVehicles = async (req, res) => {
  try {
    const vehicles = await Vehicle.find({ owner: req.user._id });
    res.json({ success: true, data: vehicles });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to fetch vehicles' });
  }
};

export const updateVehicle = async (req, res) => {
  try {
    const updates = { ...req.body };
    
    if (req.files && req.files.length > 0) {
      const images = [];
      for (const file of req.files) {
        const result = await cloudinary.uploader.upload(file.path, {
          folder: 'adride/vehicles'
        });
        images.push(result.secure_url);
      }
      updates.images = images;
    }

    const vehicle = await Vehicle.findOneAndUpdate(
      { _id: req.params.id, owner: req.user._id },
      updates,
      { new: true }
    );

    if (!vehicle) {
      return res.status(404).json({ success: false, error: 'Vehicle not found' });
    }

    res.json({ success: true, data: vehicle });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to update vehicle' });
  }
};

export const deleteVehicle = async (req, res) => {
  try {
    const vehicle = await Vehicle.findOneAndDelete({
      _id: req.params.id,
      owner: req.user._id
    });

    if (!vehicle) {
      return res.status(404).json({ success: false, error: 'Vehicle not found' });
    }

    res.json({ success: true, message: 'Vehicle deleted successfully' });
  } catch (err) {
    res.status(500).json({ success: false, error: 'Failed to delete vehicle' });
  }
};