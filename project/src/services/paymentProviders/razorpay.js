import Razorpay from 'razorpay';
import { RAZORPAY_KEY_ID, RAZORPAY_SECRET } from '../../config/env.js';

export const razorpay = new Razorpay({
  key_id: RAZORPAY_KEY_ID,
  key_secret: RAZORPAY_SECRET
});