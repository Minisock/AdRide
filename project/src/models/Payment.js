import mongoose from 'mongoose';

const paymentSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  amount: { type: Number, required: true },
  method: { 
    type: String, 
    enum: ['upi', 'credit_card', 'debit_card'], 
    required: true 
  },
  transactionId: { type: String, required: true },
  status: { 
    type: String, 
    enum: ['pending', 'success', 'failed'], 
    default: 'pending' 
  },
}, { timestamps: true });

export default mongoose.model('Payment', paymentSchema);