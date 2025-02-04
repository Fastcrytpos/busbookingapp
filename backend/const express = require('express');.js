const express = require('express');
const mongoose = require('mongoose');
const app = express();
const port = 3000;

mongoose.connect('mongodb://localhost:27017/busbooking', { useNewUrlParser: true, useUnifiedTopology: true });

app.use(express.json());

app.get('/', (req, res) => {
  res.send('Welcome to the Bus Booking API');
});

// ...existing code...

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
