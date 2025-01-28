import express from 'express';
import { authenticate, authorize } from '../middlewares/authMiddleware.js';
import { registerVehicle, getAvailableCampaigns } from '../controllers/vehicleController.js';

const router = express.Router();
router.use(authenticate, authorize(['operator']));
router.post('/vehicles', registerVehicle);
router.get('/campaigns/available', getAvailableCampaigns);
export default router;