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

// Endpoint untuk mendapatkan data nelayan
app.get("/api/nelayan", (req, res) => {
  const query = "SELECT id, id_akun, nama, no_hp, email, tanggal_lahir, alamat FROM akun";
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching data:", err);
      res.status(500).send("Error fetching data");
      return;
    }
    res.json(results);
  });
});

// Jalankan server
app.listen(3000, () => {
    console.log('Server berjalan di http://localhost:3000');
});
