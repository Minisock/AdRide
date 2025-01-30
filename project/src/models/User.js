import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  phone: { type: String, required: true },
  role: { 
    type: String, 
    enum: ['wallOwner', 'Autowala/HelmetWala', 'admin', 'advertiser'], 
    default: 'wallOwner' 
  },
  refreshTokens: { type: [String], default: [] }, // Initialize as an empty array
  // googleId: String,  // 🔴 Commented out Google authentication field
  // facebookId: String, // 🔴 Commented out Facebook authentication field
  // twitterId: String,  // 🔴 Commented out Twitter authentication field
});

userSchema.pre('save', async function (next) {
  if (this.isModified('password')) {
    this.password = await bcrypt.hash(this.password, 12);
  }
  next();
});

export default mongoose.model('User', userSchema);
