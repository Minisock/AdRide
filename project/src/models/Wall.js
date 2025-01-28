import mongoose from 'mongoose';

const wallSchema = new mongoose.Schema({
  owner: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  location: { type: String, required: true },
  size: { type: String },
  earnings: { type: Number, default: 0 },
});

export default mongoose.model('Wall', wallSchema);