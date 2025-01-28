import Payment from '../models/Payment.js';
import { stripe, razorpay } from '../config/paymentConfig.js';

export const createPaymentIntent = async (req, res) => {
  try {
    const { amount, currency, method } = req.body;

    let paymentResult;
    switch (method) {
      case 'card':
        const paymentIntent = await stripe.paymentIntents.create({
          amount: amount * 100, // Convert to cents
          currency,
        });
        paymentResult = { clientSecret: paymentIntent.client_secret };
        break;

      case 'upi':
        const order = await razorpay.orders.create({
          amount: amount * 100, // Convert to paise
          currency: 'INR',
          payment_capture: 1,
        });
        paymentResult = { orderId: order.id };
        break;

      default:
        return res.status(400).json({ error: 'Invalid payment method' });
    }

    // Save payment record
    await Payment.create({
      user: req.user._id,
      amount,
      method,
      status: 'pending',
    });

    res.status(200).json(paymentResult);
  } catch (err) {
    res.status(500).json({ error: 'Payment failed' });
  }
};