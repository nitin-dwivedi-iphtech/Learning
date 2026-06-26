import express from 'express';
import { connectRediserver } from './config/redisConnect.js';
import router from './routes/route.js'; 

const app = express();
const PORT = 3000;

connectRediserver();

app.use(express.json());

app.use(router);

app.use((req, res) => {
  res.status(404).send({ error: "Route not found" });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});