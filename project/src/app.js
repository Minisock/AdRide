import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import { connectDB } from './config/database.js';
import authRoutes from './routes/authRoutes.js';
import wallRoutes from './routes/wallRoutes.js';
import adCampaignRoutes from './routes/adCampaignRoutes.js';
import vehicleRoutes from './routes/vehicleRoutes.js';
import adminRoutes from './routes/adminRoutes.js';
import paymentRoutes from './routes/paymentRoutes.js';
import { notFound, errorHandler } from './middlewares/errorHandler.js';

const app = express();
app.use(express.json());
app.use(cors());
app.use(morgan('dev'));

app.use('/api/auth', authRoutes);
app.use('/api/wall-owner', wallRoutes);
app.use('/api/advertiser', adCampaignRoutes);
app.use('/api/operator', vehicleRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/payments', paymentRoutes);

app.use(notFound);
app.use(errorHandler);

connectDB();

export default app;