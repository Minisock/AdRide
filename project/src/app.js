import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import passport from 'passport';
import session from 'express-session';
import './config/passport.js';
import { connectDB } from './config/database.js';
import authRoutes from './routes/authRoutes.js';
import wallRoutes from './routes/wallRoutes.js';
import profileRoutes from './routes/profileRoutes.js';
import { notFound, errorHandler } from './middlewares/errorHandler.js';
import adCampaignRoutes from './routes/adCampaignRoutes.js';
import vehicleRoutes from './routes/vehicleRoutes.js';
import adminRoutes from './routes/adminRoutes.js';
import paymentRoutes from './routes/paymentRoutes.js';


const app = express();

connectDB();

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(session({
  secret: process.env.SESSION_SECRET || 'your_secret_key',
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: process.env.NODE_ENV === 'production',
    maxAge: 7 * 24 * 60 * 60 * 1000 // 7 days
  }
}));

// Passport initialization
app.use(passport.initialize());
app.use(passport.session());

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/profile', profileRoutes);
app.use('/api/walls', wallRoutes);
app.use('/api/advertiser', adCampaignRoutes);
app.use('/api/operator', vehicleRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/payments', paymentRoutes);

// To check Base API is running or not
app.get('/', (req, res) => {
  res.send({ message: "API is running..." });
});

// Error handling
app.use(notFound);
app.use(errorHandler);

export default app;