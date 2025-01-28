import AdCampaign from '../models/AdCampaign.js';

export const createCampaign = async (req, res) => {
  try {
    const { wallId, title, budget, startDate, endDate } = req.body;
    const campaign = await AdCampaign.create({
      advertiser: req.user._id,
      wall: wallId,
      title,
      budget,
      startDate,
      endDate,
    });
    res.status(201).json(campaign);
  } catch (err) {
    res.status(500).json({ error: 'Failed to create campaign' });
  }
};

export const getCampaignAnalytics = async (req, res) => {
  try {
    const campaigns = await AdCampaign.find({ advertiser: req.user._id })
      .populate('wall');
    res.status(200).json(campaigns);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch analytics' });
  }
};