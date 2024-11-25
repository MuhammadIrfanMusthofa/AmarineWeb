const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());

// Konfigurasi koneksi database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'amarine'
});

// Cek koneksi database
db.connect((err) => {
    if (err) {
        console.error('Koneksi gagal:', err.message);
    } else {
        console.log('Berhasil terhubung ke database MySQL');
    }
});

// Endpoint untuk mendapatkan data dari tabel akun
app.get("/api/akun", (req, res) => {
  const query = "SELECT * FROM akun";
  db.query(query, (err, results) => {
      if (err) {
          console.error("Error fetching data:", err);
          res.status(500).send("Error fetching data");
          return;
      }
      res.json(results);
  });
});

// Endpoint untuk mendapatkan data dari tabel detail_stok
app.get("/api/detail_stok", (req, res) => {
  const query = "SELECT * FROM detail_stok";
  db.query(query, (err, results) => {
      if (err) {
          console.error("Error fetching data:", err);
          res.status(500).send("Error fetching data");
          return;
      }
      res.json(results);
  });
});

// Endpoint untuk mendapatkan data dari tabel nelayan
app.get("/api/nelayan", (req, res) => {
  const query = "SELECT * FROM nelayan";
  db.query(query, (err, results) => {
      if (err) {
          console.error("Error fetching data:", err);
          res.status(500).send("Error fetching data");
          return;
      }
      console.log("Results from database:", results); // Log hasil query
      res.json(results);
  });
});

// Endpoint untuk mendapatkan data dari tabel pencatatan
app.get("/api/pencatatan", (req, res) => {
  const query = "SELECT * FROM pencatatan";
  db.query(query, (err, results) => {
      if (err) {
          console.error("Error fetching data:", err);
          res.status(500).send("Error fetching data");
          return;
      }
      console.log("Results from database:", results); // Log hasil query
      res.json(results);
  });
});

// Endpoint untuk mendapatkan data dari tabel pengepul
app.get("/api/pengepul", (req, res) => {
  const query = "SELECT * FROM pengepul";
  db.query(query, (err, results) => {
      if (err) {
          console.error("Error fetching data:", err);
          res.status(500).send("Error fetching data");
          return;
      }
      console.log("Results from database:", results); // Log hasil query
      res.json(results);
  });
});

// Endpoint untuk mendapatkan data dari tabel pengepul
app.get("/api/pengepul", (req, res) => {
  const query = "SELECT * FROM pengepul";
  db.query(query, (err, results) => {
      if (err) {
          console.error("Error fetching data:", err);
          res.status(500).send("Error fetching data");
          return;
      }
      console.log("Results from database:", results); // Log hasil query
      res.json(results);
  });
});

// Jalankan server
app.listen(3000, () => {
    console.log('Server berjalan di http://localhost:3000');
});
