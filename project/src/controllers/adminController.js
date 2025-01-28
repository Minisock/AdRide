import User from '../models/User.js';
import AdCampaign from '../models/AdCampaign.js';

export const getAllUsers = async (req, res) => {
  try {
    const users = await User.find().select('-password -refreshTokens');
    res.status(200).json(users);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch users' });
  }
};

export const deleteUser = async (req, res) => {
  try {
    await User.findByIdAndDelete(req.params.userId);
    res.status(200).json({ message: 'User deleted' });
  } catch (err) {
    res.status(500).json({ error: 'Failed to delete user' });
  }
};

export const toggleCampaignStatus = async (req, res) => {
  try {
    const campaign = await AdCampaign.findById(req.params.campaignId);
    campaign.status = campaign.status === 'active' ? 'paused' : 'active';
    await campaign.save();
    res.status(200).json(campaign);
  } catch (err) {
    res.status(500).json({ error: 'Failed to update campaign' });
  }
};