import express from 'express';
import { authenticate, authorize } from '../middlewares/authMiddleware.js';
import { createCampaign, getCampaignAnalytics } from '../controllers/adCampaignController.js';

const router = express.Router();
router.use(authenticate, authorize(['advertiser']));
router.post('/campaigns', createCampaign);
router.get('/campaigns/analytics', getCampaignAnalytics);
export default router;