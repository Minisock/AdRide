import express from 'express';
import { authenticate } from '../middlewares/authMiddleware.js';
import { getUserProfile } from '../controllers/userController.js';

const router = express.Router();
router.use(authenticate);
router.get('/profile', getUserProfile);
export default router;
