import { createClient } from 'redis';
const redis = createClient({
  url: 'redis://localhost:6379'
});

redis.on('error',(err)=> console.error(err));

const connectRediserver = async ()=>{
  await redis.connect();
  console.log("Conected to Redis")
}

export {connectRediserver, redis};