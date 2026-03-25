const express = require("express");

const app = express();
const port = process.env.PORT || 5000;

app.get("/", (req, res) => {
  res.status(200).json({
    message: "Hello from ECS Fargate CI/CD pipeline!",
    version: process.env.APP_VERSION || "local",
    time: new Date().toISOString()
  });
});

app.get("/health", (req, res) => {
  res.status(200).send("OK");
});

app.listen(port, "0.0.0.0", () => {
  console.log(`App listening on port ${port}`);
});