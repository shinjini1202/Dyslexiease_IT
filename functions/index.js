const functions = require("firebase-functions");
const express = require("express");
const axios = require("axios");
const cors = require("cors");

const app = express();
app.use(cors({ origin: true }));
app.use(express.json()); // Ensure JSON requests are parsed properly

const GEMINI_API_KEY = dotenv.env['GEMINI_API_KEY'] ?? '';

app.post("/gemini-process", async (req, res) => {
  try {
    const { text, mode } = req.body;

    if (!text || !mode) {
      return res.status(400).json({ error: "Missing 'text' or 'mode' parameter." });
    }

    const prompt =
      mode === "summarize"
        ? `Summarize the following text in simple words:\n\n${text}`
        : `Reword the following text for better readability for autistic & dyslexic users:\n\n${text}`;

    const requestBody = {
      contents: [{ parts: [{ text: prompt }] }], // ✅ Correct structure for Gemini API
    };

    const response = await axios.post(
      `https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${GEMINI_API_KEY}`,
      requestBody,
      { headers: { "Content-Type": "application/json" } }
    );

    // ✅ Handle response correctly
    if (
      response.data &&
      response.data.candidates &&
      response.data.candidates.length > 0 &&
      response.data.candidates[0].content &&
      response.data.candidates[0].content.parts &&
      response.data.candidates[0].content.parts.length > 0
    ) {
      res.json({ response: response.data.candidates[0].content.parts[0].text });
    } else {
      res.status(500).json({ error: "Invalid response from Gemini API." });
    }
  } catch (error) {
    console.error("Error processing Gemini request:", error.response?.data || error.message);
    res.status(500).json({
      error: "Gemini API request failed.",
      details: error.response?.data || error.message,
    });
  }
});

// ✅ Set Firebase function to correct region
exports.api = functions.region("us-central1").https.onRequest(app);
