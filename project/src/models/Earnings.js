import mongoose from 'mongoose';

const earningsSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  totalEarnings: {
    type: Number,
    default: 0
  },
  availableBalance: {
    type: Number,
    default: 0
  },
  paymentHistory: [
    {
      date: {
        type: Date,
        default: Date.now
      },
      amount: {
        type: Number,
        required: true
      },
      status: {
        type: String,
        enum: ['pending', 'paid', 'failed'],
        default: 'pending'
      }
    }
  ],
  lastPaid: {
    type: Date,
    default: null
  }
}, {
  timestamps: true
});

const Earnings = mongoose.model('Earnings', earningsSchema);

export default Earnings;
