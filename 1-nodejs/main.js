const express = require('express');

const app = express();
const port = 8081;

const UNKNOWN_USER = 'unknown user';

function greet(name, res) {
  res.send(`Hello ${name}`);
}

app.get('/api/v1/hello', (_, res) => {
  greet(UNKNOWN_USER, res);
});

app.get('/api/v1/hello/:name', (req, res) => {
  const name = req.params.name || UNKNOWN_USER;
  greet(name, res);
});

app.get('/', (_, res) => {
  res.sendFile('./index.html', {
    root: process.cwd(),
  });
});

// eslint-disable-next-line no-console
console.log(`Listening on port ${port}`);
app.listen(port);
