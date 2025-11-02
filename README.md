# Moovr Sportswear

## 🌳 1. Apa itu Widget Tree pada Flutter?

**Widget tree** adalah struktur hierarki yang menggambarkan bagaimana widget disusun dan saling berhubungan dalam aplikasi Flutter.
Setiap elemen dalam aplikasi Flutter adalah sebuah **widget**, mulai dari tampilan terkecil seperti teks atau ikon, hingga layout besar seperti kolom dan baris.

Struktur ini menyerupai **pohon (tree)**:

* **Root widget** berada di puncak.
* Setiap widget dapat memiliki satu atau beberapa **child widget**.
* Hubungan ini membentuk **parent–child relationship** (induk–anak).

Contoh sederhana:

```dart
Scaffold(
  appBar: AppBar(title: Text('Hello')),
  body: Center(
    child: Text('Welcome to Flutter!'),
  ),
)
```

Pada contoh di atas:

* `Scaffold` adalah **parent** dari `AppBar` dan `Center`.
* `Center` adalah **parent** dari `Text`.
* `Text` tidak memiliki child, sehingga menjadi **leaf node** dalam tree.

---

## 🧩 2. Widget yang Digunakan dalam Proyek dan Fungsinya

Berikut daftar widget yang digunakan dalam proyek ini beserta penjelasannya:

| Widget           | Fungsi                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------- |
| `MaterialApp`    | Sebagai root aplikasi. Menyediakan konfigurasi global seperti tema, navigasi, dan title.    |
| `Scaffold`       | Struktur dasar halaman yang menyediakan area untuk AppBar, Body, FloatingActionButton, dsb. |
| `AppBar`         | Menampilkan bilah aplikasi di bagian atas (biasanya berisi judul dan tombol aksi).          |
| `Center`         | Menempatkan child di tengah layar.                                                          |
| `Column`         | Menyusun widget secara vertikal.                                                            |
| `Row`            | Menyusun widget secara horizontal.                                                          |
| `Text`           | Menampilkan teks.                                                                           |
| `ElevatedButton` | Tombol dengan gaya material design dan efek elevasi.                                        |
| `Container`      | Widget serbaguna untuk menata layout, memberi warna, margin, padding, atau border.          |
| `Padding`        | Memberi jarak di sekitar child widget.                                                      |
| `Image`          | Menampilkan gambar dari asset atau URL.                                                     |

---

## 🏗️ 3. Fungsi dari Widget `MaterialApp`

`MaterialApp` adalah **widget utama (root)** dalam sebagian besar aplikasi Flutter berbasis Material Design.
Fungsinya antara lain:

* Mengatur **tema global** (warna, font, dan gaya tombol).
* Mengatur **navigasi antar halaman** (melalui `routes` dan `Navigator`).
* Menentukan **judul aplikasi** (`title`).
* Menentukan **home widget** atau halaman awal.

Widget ini sering digunakan sebagai widget root karena menyediakan kerangka kerja utama agar aplikasi Flutter mengikuti **prinsip Material Design** dari Google.

---

## ⚖️ 4. Perbedaan antara `StatelessWidget` dan `StatefulWidget`

| Aspek               | StatelessWidget                                              | StatefulWidget                                                          |
| ------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------------- |
| **Perubahan Data**  | Tidak dapat berubah (immutable).                             | Dapat berubah (mutable) selama runtime.                                 |
| **State Internal**  | Tidak memiliki state.                                        | Memiliki state yang dikelola oleh `State` object.                       |
| **Digunakan untuk** | Tampilan statis (seperti teks, ikon, atau tombol sederhana). | Tampilan dinamis yang bisa berubah karena interaksi pengguna atau data. |
| **Contoh**          | `Text`, `Icon`, `RaisedButton`                               | `TextField`, `Checkbox`, `Slider`                                       |

🔹 **Gunakan `StatelessWidget`** jika UI tidak bergantung pada data yang berubah.
🔹 **Gunakan `StatefulWidget`** jika UI perlu diperbarui (misalnya ketika pengguna menekan tombol atau memasukkan input).

---

## 🧠 5. Apa itu BuildContext dan Mengapa Penting?

`BuildContext` adalah **objek yang merepresentasikan lokasi suatu widget dalam widget tree**.
Objek ini memberi akses ke:

* Widget parent dan child di tree.
* Fungsi seperti `Theme.of(context)` atau `Navigator.of(context)`.

Contoh penggunaan:

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Contoh BuildContext'),
    ),
    body: Center(
      child: Text(
        'Hello, ${Theme.of(context).primaryColor}',
      ),
    ),
  );
}
```

`BuildContext` penting karena memungkinkan widget **berinteraksi dengan widget lain** di dalam tree, seperti mengambil tema atau melakukan navigasi ke halaman lain.

---

## 🔄 6. Konsep "Hot Reload" dan Perbedaannya dengan "Hot Restart"

| Fitur                       | Hot Reload                                     | Hot Restart                                                           |
| --------------------------- | ---------------------------------------------- | --------------------------------------------------------------------- |
| **Waktu Eksekusi**          | Cepat (hanya beberapa detik).                  | Lebih lama karena aplikasi dijalankan ulang dari awal.                |
| **State Aplikasi**          | **Dipertahankan** (state widget tidak hilang). | **Dihapus** (state di-reset seperti menjalankan aplikasi dari awal).  |
| **Perubahan yang Didukung** | Perubahan pada UI, layout, dan logika build.   | Semua perubahan kode, termasuk variabel global dan inisialisasi awal. |

🧩 **Kesimpulan:**

* Gunakan **Hot Reload** saat mengubah tampilan atau logika kecil agar cepat melihat hasilnya.
* Gunakan **Hot Restart** saat perubahan memengaruhi struktur atau inisialisasi aplikasi.
