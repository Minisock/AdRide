import dotenv from "dotenv";
import pkg from "cloudinary";

dotenv.config();

const cloudinary = pkg.v2; 

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_NAME,
  api_key: process.env.CLOUDINARY_KEY,
  api_secret: process.env.CLOUDINARY_SECRET_KEY,
});

export default cloudinary;
