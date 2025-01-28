import express from 'express';
import { authenticate, authorize } from '../middlewares/authMiddleware.js';
import { addWall, getMyWalls } from '../controllers/wallController.js';

const router = express.Router();
router.use(authenticate, authorize(['owner']));
router.post('/', addWall);
router.get('/', getMyWalls);
export default router;