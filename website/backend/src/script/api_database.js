const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

import { pool } from "./creation_app_backend";



export const app_backend = express();

app_backend.use(cors());
app_backend.use(bodyParser.json());



// // // CRUD operations
// // // CRUD operations
// // // CRUD operations

// CREATE
app_backend.post(
  "/items",
  async (req, res) => {
    const { name } = req.body;
    const result = await pool.query(
      "INSERT INTO items (name) VALUES ($1) RETURNING *",
      [name]
    );
    res.json(result.rows[0]);
  }
);



// READ
app_backend.get(
  "/items",
  async (req, res) => {
    const result = await pool.query(
      "SELECT * FROM items"
    );
    res.json(result.rows);
  }
);



// UPDATE
app_backend.put(
  "/items/:id", 
  async (req, res) => {
    const { id } = req.params;
    const { name } = req.body;
    const result = await pool.query(
      "UPDATE items SET name = $1 WHERE id = $2 RETURNING *",
      [name, id]
    );
    res.json(result.rows[0]);
  }
);



// DELETE
app_backend.delete(
  "/items/:id",
  async (req, res) => {
    const { id } = req.params;
    await pool.query(
      "DELETE FROM items WHERE id = $1",
      [id]
    );
    res.json({ message: "Item deleted" });
  }
);



app_backend.listen(5000, () => {
  console.log("Server running on port 5000");
});