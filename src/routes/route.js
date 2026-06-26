import { Router } from 'express';
import { cacheMiddle } from "../middleware/cacheMiddleware.js";

const router = Router();

router.route("/api/login").get(cacheMiddle, async (req, res, next) => {   
    try {
        console.log("Data cached complete login successfull:",);
        res.json({ message: "Login successful", cachedData: req.cachedData });
    } catch (err) {
        console.error(err);
        res.status(500).send({ error: "Internal Server Error" });
    }
}); 

router.route("/api/register").get(cacheMiddle, async (req, res, next) => {  
    try {
        console.log("Data cached complete register successfull:",);
        res.json({ message: "Register successful", cachedData: req.cachedData });
    } catch (err) {
        console.error(err);
        res.status(500).send({ error: "Internal Server Error" });
    }
});

export default router;   