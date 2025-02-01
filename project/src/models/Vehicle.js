import mongoose from 'mongoose';

const vehicleSchema = new mongoose.Schema({
  owner: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: 'User', 
    required: true 
  },
  registrationNo: { 
    type: String, 
    required: true, 
    unique: true 
  },
  images: [{ 
    type: String, 
    required: true 
  }],
  vehicleType: {
    type: String,
    enum: ['Auto', 'Helmet', 'Bike', 'Car', 'Other'],
    required: true
  },
  availability: {
    type: Boolean,
    default: true
  },
  status: {
    type: String,
    enum: ['pending', 'approved', 'rejected'],
    default: 'pending'
  },
  location: {
    type: { type: String, default: 'Point' },
    coordinates: [Number]
  },
  dimensions: {
    height: Number,
    width: Number
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});

vehicleSchema.index({ location: '2dsphere' });

export default mongoose.model('Vehicle', vehicleSchema);