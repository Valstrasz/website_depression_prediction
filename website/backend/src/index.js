const bodyParser = require("body-parser");
const cors = require("cors");
const express = require("express");
const { Pool } = require("pg");



// PostgreSQL connection pool configuration using environment variables
const pool = new Pool({
    user: process.env.DATABASE_USERNAME,
    host: process.env.DATABASE_HOST,
    database: process.env.DATABASE_NAME,
    password: process.env.DATABASE_PASSWORD,
    port: Number(process.env.DATABASE_PORT),
});



const app_backend = express();

app_backend.use(cors());
app_backend.use(bodyParser.json());



// // // CRUD operations
// // // CRUD operations
// // // CRUD operations

// CREATE
app_backend.post(
    "/db_prediction",
    async (req, res) => {
        const req_body = req.body;
        const req_body_key = Object.keys(req_body);
        const req_body_val = Object.values(req_body);

        const req_body_key_str = req_body_key.join(", ").replace("\'", "");
        const req_body_val_str = req_body_val.map((e) => `'${e}'`).join(", ");


        // const result = await pool.query(
        //     "INSERT INTO prediction ($1) VALUES ($2) RETURNING *",
        //     [req_body_key_str, req_body_val_str],
        // );

        const pool_query = `
            INSERT INTO
                prediction (${req_body_key_str})
            VALUES
                (${req_body_val_str})
            RETURNING
                *
        `;
        

        const result = await pool.query(pool_query);

        res.json(result.rows[0]);
    }
);



// READ
app_backend.get(
    "/db_prediction/:id",
    async (req, res) => {
        const { id } = req.params;

        // const result = await pool.query(
        //     "SELECT * FROM prediction AS pred WHERE pred.id=$1",
        //     [id],
        // );

        const pool_query = `
            SELECT
                *
            FROM
                prediction AS pred
            WHERE
                pred.id=${id}
        `;

        const result = await pool.query(pool_query);


        res.json(result.rows[0]);
    }
);



// // UPDATE
// app_backend.put(
//     "/db_prediction/:id",
//     async (req, res) => {
//         const { id } = req.params;
//         const { name } = req.body;

//         const result = await pool.query(
//             "UPDATE items SET name = $1 WHERE id = $2 RETURNING *",
//             [name, id]
//         );

//         res.json(result.rows[0]);
//     }
// );



// // DELETE
// app_backend.delete(
//     "/db_prediction/:id",
//     async (req, res) => {
//         const { id } = req.params;

//         await pool.query(
//             "DELETE FROM items WHERE id = $1",
//             [id]
//         );

//         res.json({ message: "Item deleted" });
//     }
// );



app_backend.listen(
    5000,
    () => { console.log("Server running on port 5000"); }
);
