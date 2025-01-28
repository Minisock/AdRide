import Vehicle from '../models/Vehicle.js';
import AdCampaign from '../models/AdCampaign.js';

export const registerVehicle = async (req, res) => {
  try {
    const { vehicleType, licensePlate } = req.body;
    const vehicle = await Vehicle.create({
      operator: req.user._id,
      vehicleType,
      licensePlate,
    });
    res.status(201).json(vehicle);
  } catch (err) {
    res.status(500).json({ error: 'Failed to register vehicle' });
  }
};

export const getAvailableCampaigns = async (req, res) => {
  try {
    const campaigns = await AdCampaign.find({ status: 'active' }).populate('wall');
    res.status(200).json(campaigns);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch campaigns' });
  }
};