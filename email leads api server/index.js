import express, { json } from "express";
import { Pool } from "pg";
import cors from "cors";
require("dotenv").config();

const app = express();
app.use(cors());
app.use(json());

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false } // required for Neon
});

// Route to add email
app.post("/subscribe", async (req, res) => {
  const { email } = req.body;
  if (!email) return res.status(400).json({ error: "Email is required" });

  try {
    const result = await pool.query(
      "INSERT INTO subscribers (email) VALUES ($1) ON CONFLICT (email) DO NOTHING RETURNING *",
      [email]
    );
    return res.status(200).json({
      message: "Subscription successful",
      data: result.rows[0] || { email }
    });
  } catch (error) {
    return res.status(500).json({ error: "Database error", details: error });
  }
});

app.listen(process.env.PORT, () => {
  console.log(`Server running at http://localhost:${process.env.PORT}`);
});
