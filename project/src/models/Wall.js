import mongoose from 'mongoose';

const wallSchema = new mongoose.Schema({
  owner: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  images: [{ type: String , required: true}], 
  wallName: { type: String, required: true },
  location: {
    address: { type: String, required: true },
    coordinates: {
      lat: Number,
      lng: Number
    }
  },
  dimensions: {
    height: { type: Number, required: true }, // in feet
    width: { type: Number, required: true }  // in feet
  },
  monthlyPrice: { type: Number, required: true },
  availability: {
    from: { type: Date, required: true },
    to: { type: Date, required: true }
  },
  status: {
    type: String,
    enum: ['pending', 'available', 'booked'],
    default: 'pending'
  },
  earnings: { type: Number, default: 0 },
  createdAt: { type: Date, default: Date.now }
});

export default mongoose.model('Wall', wallSchema);