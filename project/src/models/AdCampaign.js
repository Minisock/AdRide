import mongoose from 'mongoose';

const adCampaignSchema = new mongoose.Schema({
  advertiser: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  wall: { type: mongoose.Schema.Types.ObjectId, ref: 'Wall', required: true },
  title: { type: String, required: true },
  description: { type: String },
  startDate: { type: Date, required: true },
  endDate: { type: Date, required: true },
  status: { type: String, enum: ['active', 'pending', 'completed'], default: 'pending' },
  budget: { type: Number, required: true }
});

export default mongoose.model('AdCampaign', adCampaignSchema);
