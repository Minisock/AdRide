import Wall from '../models/Wall.js';

export const createWall = async (ownerId, location, size) => {
  return await Wall.create({ owner: ownerId, location, size });
};

export const getUserWalls = async (ownerId) => {
  return await Wall.find({ owner: ownerId });
};