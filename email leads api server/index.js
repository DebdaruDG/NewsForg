const express = require("express");
const { Pool } = require("pg");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false } // required for Neon
});

app.post("/subscribe", async (req, res) => {
  const { email } = req.body;
  if (!email) {
    return res.status(400).json({
      subscribe_successful: false,
      message: "Email is required"
    });
  }

  try {
    const result = await pool.query(
      "INSERT INTO subscribers (email) VALUES ($1) ON CONFLICT (email) DO NOTHING RETURNING *",
      [email]
    );

    if (result.rows.length > 0) {
      // New subscription
      return res.status(200).json({
        subscribe_successful: true,
        message: "Subscription successful",
        data: result.rows[0]
      });
    } else {
      // Email already exists due to ON CONFLICT (email) DO NOTHING
      return res.status(200).json({
        subscribe_successful: false,
        message: "Email is already subscribed",
        data: { email: email } // Return the email that was attempted to subscribe
      });
    }
  } catch (error) {
    console.error("Database error during subscription:", error); // Log the full error for debugging
    return res.status(500).json({
      subscribe_successful: false,
      message: "An unexpected error occurred during subscription.",
      details: error.message // Provide a less verbose error to the client, but log full error on server
    });
  }
});

app.listen(process.env.PORT, () => {
  console.log(`Server running at http://localhost:${process.env.PORT}`);
});