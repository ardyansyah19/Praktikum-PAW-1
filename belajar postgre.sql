CREATE TABLE IF NOT EXISTS kategori (
  id   SERIAL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS buku (
  id      SERIAL PRIMARY KEY,
  judul   VARCHAR(255) NOT NULL,
  penulis VARCHAR(150) NOT NULL,
  isbn    VARCHAR(20)  NOT NULL UNIQUE,
  stok    INTEGER
);

CREATE TABLE IF NOT EXISTS buku_kategori (
  buku_id     INTEGER REFERENCES buku(id) ON DELETE CASCADE,
  kategori_id INTEGER REFERENCES kategori(id) ON DELETE CASCADE,
  PRIMARY KEY (buku_id, kategori_id)
);

CREATE TABLE IF NOT EXISTS anggota (
  id     SERIAL PRIMARY KEY,
  nama   VARCHAR(100) NOT NULL,
  email  VARCHAR(150) NOT NULL UNIQUE,
  alamat TEXT
);

INSERT INTO kategori (nama) VALUES ('Teknologi'), ('Fiksi');

INSERT INTO buku (judul, penulis, isbn, stok) VALUES
  ('Pemrograman Web', 'Budi', '978-123', 5),
  ('Belajar TypeScript', 'Rina', '978-456', NULL);

INSERT INTO buku_kategori (buku_id, kategori_id) VALUES
  (1, 1),
  (2, 1),
  (2, 2);

INSERT INTO anggota (nama, email, alamat) VALUES
  ('Sari', 'sari@mail.com', NULL),
  ('Andi', 'andi@mail.com', 'Surabaya');

  SELECT * FROM kategori;
SELECT * FROM buku;
SELECT * FROM anggota;

SELECT b.judul, b.stok, k.nama AS kategori
FROM buku b
JOIN buku_kategori bk ON bk.buku_id = b.id
JOIN kategori k ON k.id = bk.kategori_id
ORDER BY b.judul;