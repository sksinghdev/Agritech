const express = require("express");
const fs = require("fs");
const path = require("path");

const app = express();
const STUB_DIR = path.join(__dirname, "stubs");

// Load all stub files
fs.readdirSync(STUB_DIR).forEach(file => {
  if (file.endsWith(".ejs") || file.endsWith(".json")) {
    const filePath = path.join(STUB_DIR, file);
    const stub = JSON.parse(fs.readFileSync(filePath, "utf-8"));

    const method = stub.request.method.toLowerCase();
    const url = stub.request.urlPath;

    console.log(`✅ Loaded stub: [${method.toUpperCase()}] ${url}`);

    app[method](url, (req, res) => {
      res.status(stub.response.status)
         .set(stub.response.headers)
         .json(stub.response.jsonBody);
    });
  }
});

// Use port from first stub (or fallback 3000)
const PORT = 4545;
app.listen(PORT, () => {
  console.log(`🚀 Mock server running at http://localhost:${PORT}`);
});
