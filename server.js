const express = require("express");
const React = require("react");
const { renderToString } = require("react-dom/server");

const app = express();

app.get("*", (_req, res) => {
  const markup = renderToString(<h1>Hello from SSR React</h1>);
  res.send(markup);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Listen on: ${PORT}`);
});
