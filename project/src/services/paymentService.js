import Payment from '../models/Payment.js';
import { stripe, razorpay } from './paymentProviders/index.js';

export const processPayment = async (userId, amount, method) => {
  let paymentResult;
  
  switch(method) {
    case 'card':
      paymentResult = await stripe.paymentIntents.create({
        amount: amount * 100,
        currency: 'usd'
      });
      break;
      
    case 'upi':
      paymentResult = await razorpay.orders.create({
        amount: amount * 100,
        currency: 'INR'
      });
      break;
      
    default:
      throw new Error('Invalid payment method');
  }

  return await Payment.create({
    user: userId,
    amount,
    method,
    transactionId: paymentResult.id,
    status: 'pending'
  });
};