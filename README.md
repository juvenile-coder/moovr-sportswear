# Moovr Sportswear

## Tugas Individu 7
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

## 🧾 Tugas Individu 8

### 🧭 1. Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`

Kedua metode ini digunakan untuk **navigasi antar halaman (routing)** di Flutter, namun memiliki perbedaan dalam **pengelolaan stack halaman**.

| Metode                        | Penjelasan                                                                                                                                                    |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Navigator.push()`            | Menambahkan halaman baru di atas halaman saat ini pada stack. Halaman sebelumnya tetap disimpan, sehingga pengguna dapat kembali menggunakan tombol **Back**. |
| `Navigator.pushReplacement()` | Mengganti halaman saat ini dengan halaman baru dan **menghapus halaman sebelumnya** dari stack, sehingga pengguna tidak dapat kembali ke halaman lama.        |

📱 **Contoh penggunaan dalam aplikasi Moovr Sportswear:**

```dart
// Menambahkan halaman baru tanpa menghapus halaman lama
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProductListPage()),
);
```

Digunakan ketika pengguna **masih perlu bisa kembali** ke halaman sebelumnya, seperti dari **Home Page → Daftar Produk**.

```dart
// Mengganti halaman lama dengan halaman baru
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage()),
);
```

Digunakan ketika pengguna **tidak perlu kembali** ke halaman sebelumnya, seperti setelah menambahkan produk baru atau login.

---

### 🧱 2. Pemanfaatan `Scaffold`, `AppBar`, dan `Drawer`

Ketiga widget ini berperan penting dalam menjaga **konsistensi struktur halaman** di seluruh aplikasi.

| Widget     | Fungsi                                                                                             |
| ---------- | -------------------------------------------------------------------------------------------------- |
| `Scaffold` | Menyediakan kerangka dasar halaman seperti `AppBar`, `Body`, `Drawer`, dan `FloatingActionButton`. |
| `AppBar`   | Menampilkan judul aplikasi dan tombol navigasi di bagian atas.                                     |
| `Drawer`   | Menyediakan menu navigasi samping untuk berpindah antar halaman aplikasi.                          |

🧩 **Contoh penerapan dalam Moovr Sportswear:**

```dart
return Scaffold(
  appBar: AppBar(
    title: const Text('Moovr Sportswear'),
    backgroundColor: Theme.of(context).colorScheme.primary,
  ),
  drawer: const LeftDrawer(),
  body: const ProductListPage(),
);
```

Dengan menggunakan struktur ini di setiap halaman, tampilan aplikasi menjadi **seragam, mudah digunakan, dan profesional**.

---

### 🧩 3. Kelebihan Menggunakan `Padding`, `SingleChildScrollView`, dan `ListView`

Dalam perancangan antarmuka, widget layout ini membantu menampilkan form dan daftar elemen agar **lebih rapi, fleksibel, dan mudah dibaca** di berbagai ukuran layar.

| Widget                  | Fungsi                                                                  | Contoh Penggunaan                                               |
| ----------------------- | ----------------------------------------------------------------------- | --------------------------------------------------------------- |
| `Padding`               | Memberikan jarak di sekitar widget agar tampilan tidak terlalu padat.   | `Padding(padding: EdgeInsets.all(16.0), child: TextField(...))` |
| `SingleChildScrollView` | Membuat halaman bisa digulir saat kontennya panjang, mencegah overflow. | Digunakan pada halaman form input produk.                       |
| `ListView`              | Menampilkan daftar elemen secara vertikal dan otomatis dapat di-scroll. | Digunakan di halaman daftar produk (`ProductListPage`).         |

📘 **Contoh penerapan:**

```dart
SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        TextField(decoration: InputDecoration(labelText: 'Nama Produk')),
        TextField(decoration: InputDecoration(labelText: 'Harga')),
        ElevatedButton(onPressed: () {}, child: Text('Simpan')),
      ],
    ),
  ),
)
```

Dengan kombinasi ini, UI tetap **nyaman dilihat dan mudah digunakan**, terutama saat form berisi banyak elemen.

---

### 🎨 4. Penyesuaian Warna Tema agar Konsisten dengan Brand

Agar aplikasi **Moovr Sportswear** memiliki identitas visual yang konsisten, pengaturan warna dilakukan melalui `ThemeData` pada widget `MaterialApp`.

```dart
return MaterialApp(
  title: 'Moovr Sportswear',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green, // warna utama brand
    ),
    useMaterial3: true,
  ),
  home: const MyHomePage(),
);
```

💡 **Penjelasan:**

* `seedColor` menentukan warna dasar yang digunakan di seluruh aplikasi (misalnya hijau untuk melambangkan energi dan sportivitas).
* Warna ini secara otomatis diterapkan ke elemen seperti tombol, AppBar, dan ikon.
* Hasilnya, aplikasi memiliki **identitas visual yang kuat dan konsisten**, mencerminkan karakter brand toko.

