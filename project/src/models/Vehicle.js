import mongoose from 'mongoose';

const vehicleSchema = new mongoose.Schema({
  operator: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  vehicleType: { 
    type: String, 
    enum: ['car', 'bus', 'truck'], 
    required: true 
  },
  licensePlate: { type: String, required: true, unique: true },
  isAvailable: { type: Boolean, default: true },
});

export default mongoose.model('Vehicle', vehicleSchema);