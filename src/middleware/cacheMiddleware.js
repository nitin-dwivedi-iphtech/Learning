import { cachingData } from "../controllers/cache-controller.js";

export const cacheMiddle = async (req, res, next) => {
  try {
    const cachedData = await cachingData(); 
    req.cachedData = cachedData; 
    next(); 
    } catch (err) {
    console.error("Error in cache middleware:", err);
    res.status(500).send({ error: "Internal Server Error" });
  }
};