import { redis } from "../config/redisConnect.js";

const getCacheData = async () => {
  try {
    const cacheData = await redis.get("cache-data");
    if (!cacheData) {
      let data = "nitin creds";
      await redis.set("cache-data", data, { EX: 3600 });
      console.log("data saved in cache");
      return data;
    } else {  
      console.log("Data found");
      return cacheData;
    }
  } catch (err) {
    console.log(err);
  }
};

const cachingData = async () => {
  try {
    const dataToCache = await getCacheData(); 
    return dataToCache;
  } catch (err) {
    console.log(err);
  }
};

export { cachingData };