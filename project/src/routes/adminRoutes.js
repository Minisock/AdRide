import express from 'express';
import { authenticate, authorize } from '../middlewares/authMiddleware.js';
import { getAllUsers, deleteUser, toggleCampaignStatus } from '../controllers/adminController.js';

const router = express.Router();
router.use(authenticate, authorize(['admin']));
router.get('/users', getAllUsers);
router.delete('/users/:userId', deleteUser);
router.patch('/campaigns/:campaignId', toggleCampaignStatus);
export default router;