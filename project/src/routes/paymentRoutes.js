import express from 'express';
import { authenticate } from '../middlewares/authMiddleware.js';
import { createPaymentIntent } from '../controllers/paymentController.js';

const router = express.Router();
router.use(authenticate);
router.post('/create-intent', createPaymentIntent);
export default router;