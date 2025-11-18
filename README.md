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

## Tugas Individu 9

### 🔧 1. Pentingnya Model Dart untuk JSON Data

**Mengapa perlu model Dart?**
Membuat model Dart (data class) untuk JSON sangat penting karena:

- **Type Safety**: Memastikan data yang diterima/dikirim memiliki tipe yang tepat
- **Null Safety**: Mencegah runtime error dengan handle nullable fields
- **Maintainability**: Mudah di-maintain dan di-refactor
- **IntelliSense**: Dapat autocomplete field names di IDE
- **Validation**: Dapat menambahkan validasi business logic

**Konsekuensi tanpa model:**
```dart
// ❌ RISKY: Direct Map usage
var response = await http.get(url);
var product = response.data;
print(product['name']); // Runtime error jika 'name' tidak ada
print(product['price'] as int); // Cast error jika bukan int

// ✅ SAFE: Dengan model
Product product = Product.fromJson(response.data);
print(product.name); // Compile-time safety
print(product.price); // Sudah pasti int
```

**Contoh implementasi di Moovr:**
```dart
class Product {
  final int id;
  final String name;
  final int price;
  final String description;
  final String category;
  final String? thumbnail;
  final bool isFeatured;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    this.thumbnail,
    required this.isFeatured,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    price: json['price'],
    description: json['description'],
    category: json['category'],
    thumbnail: json['thumbnail'],
    isFeatured: json['is_featured'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'description': description,
    'category': category,
    'thumbnail': thumbnail,
    'is_featured': isFeatured,
  };
}
```

### 🌐 2. Fungsi Package http vs CookieRequest

**Package http:**
- **Fungsi**: HTTP client dasar untuk REST API calls
- **Fitur**: GET, POST, PUT, DELETE requests
- **Kekurangan**: Tidak handle session cookies secara otomatis
- **Use Case**: Untuk API yang stateless/tidak perlu session

**Package pbp_django_auth & CookieRequest:**
- **Fungsi**: HTTP client dengan Django session support
- **Fitur**: 
  - Otomatis handle session cookies
  - CSRF token management
  - Login/logout state management
- **Use Case**: Untuk aplikasi yang perlu maintain login session

**Perbedaan utama:**
```dart
// Dengan http biasa - manual cookie handling
var client = http.Client();
var response = await client.post(
  Uri.parse('http://localhost:8000/login/'),
  body: {'username': 'user', 'password': 'pass'},
);
// Harus simpan cookie manual untuk request selanjutnya

// Dengan CookieRequest - otomatis
final request = context.read<CookieRequest>();
var response = await request.login(
  'http://localhost:8000/login/',
  {'username': 'user', 'password': 'pass'},
);
// Cookie otomatis disimpan dan digunakan di request selanjutnya
```

### 🔄 3. Alasan CookieRequest Dibagikan ke Semua Komponen

**Mengapa perlu dibagikan?**
- **State Consistency**: Semua komponen menggunakan session yang sama
- **Authentication Sync**: Login/logout state konsisten di seluruh app
- **Avoid Prop Drilling**: Tidak perlu pass CookieRequest melalui constructor
- **Global Access**: Bisa diakses dari mana saja dalam widget tree

**Implementasi dengan Provider:**
```dart
void main() {
  runApp(Provider(
    create: (_) => CookieRequest(),
    child: MyApp(),
  ));
}

// Di komponen manapun bisa akses:
class ProductFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // Gunakan request untuk API calls
  }
}
```

### 🔌 4. Konfigurasi Konektivitas Flutter-Django

**Konfigurasi yang diperlukan:**

1. **ALLOWED_HOSTS = ['10.0.2.2']**
   - **Alasan**: 10.0.2.2 adalah alias localhost dari Android emulator
   - **Tanpa ini**: Django menolak request dengan "Invalid HTTP_HOST header"

2. **Aktifkan CORS (django-cors-headers)**
   - **Alasan**: Browser/Flutter block cross-origin requests
   - **Tanpa ini**: Error "CORS policy blocked"

3. **SameSite=None dan Secure cookies**
   - **Alasan**: Untuk cross-site cookie handling di Flutter
   - **Tanpa ini**: Session cookies tidak tersimpan

4. **Internet permission di Android**
   - **Alasan**: Aplikasi butuh izin akses internet
   - **Tanpa ini**: Network error "SocketException"

**settings.py Django:**
```python
ALLOWED_HOSTS = ['10.0.2.2', 'localhost', '127.0.0.1']

INSTALLED_APPS = [
    'corsheaders',
    # ...
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    # ...
]

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True

CSRF_COOKIE_SAMESITE = 'Lax'
SESSION_COOKIE_SAMESITE = 'Lax'
CSRF_COOKIE_HTTPONLY = False
SESSION_COOKIE_HTTPONLY = False
```

**AndroidManifest.xml Flutter:**
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

### 📤 5. Mekanisme Pengiriman Data Input → Display

**Flow pengiriman data:**

1. **Input Form** (ProductFormPage)
   ```dart
   // User input data
   String _name = "Running Shoes";
   int _price = 250000;
   String _description = "High quality running shoes";
   ```

2. **Validasi & Serialize**
   ```dart
   if (_formKey.currentState!.validate()) {
     // Convert ke JSON
     var productData = {
       "name": _name,
       "price": _price,
       "description": _description,
       "category": _category,
       "thumbnail": _thumbnail,
       "is_featured": _isFeatured,
     };
   }
   ```

3. **HTTP POST ke Django**
   ```dart
   final response = await request.postJson(
     "http://10.0.2.2:8000/create-flutter/",
     jsonEncode(productData),
   );
   ```

4. **Django Process & Save**
   ```python
   @csrf_exempt
   def create_product_flutter(request):
       if request.method == 'POST':
           data = json.loads(request.body)
           # Validasi dan save ke database
           new_product = Product.objects.create(
               name=data['name'],
               price=data['price'],
               # ...
           )
           return JsonResponse({"status": "success"})
   ```

5. **Fetch & Display di Flutter**
   ```dart
   // Di ProductListPage
   Future<List<Product>> fetchProducts() async {
     final response = await request.get('http://10.0.2.2:8000/json/');
     List<Product> products = [];
     for (var item in response) {
       products.add(Product.fromJson(item));
     }
     return products;
   }
   ```

6. **Build UI**
   ```dart
   ListView.builder(
     itemCount: products.length,
     itemBuilder: (context, index) {
       return ListTile(
         title: Text(products[index].name),
         subtitle: Text('Rp ${products[index].price}'),
       );
     },
   )
   ```

### 🔐 6. Mekanisme Autentikasi Login-Register-Logout

**Flow lengkap autentikasi:**

1. **Register**
   ```dart
   // Flutter: RegisterPage
   await request.postJson(
     "http://10.0.2.2:8000/register/",
     jsonEncode({
       'username': _username,
       'password': _password,
     }),
   );
   ```

   ```python
   # Django: register view
   def register(request):
       if request.method == 'POST':
           username = request.POST['username']
           password = request.POST['password']
           User.objects.create_user(username=username, password=password)
           return JsonResponse({"status": "success"})
   ```

2. **Login**
   ```dart
   // Flutter: LoginPage
   final response = await request.login(
     "http://10.0.2.2:8000/login/",
     {
       'username': _username,
       'password': _password,
     },
   );

   if (response['status'] == 'success') {
     Navigator.pushReplacement(context, 
       MaterialPageRoute(builder: (context) => MyHomePage()));
   }
   ```

   ```python
   # Django: login view
   from django.contrib.auth import authenticate, login

   def login_user(request):
       username = request.POST['username']
       password = request.POST['password']
       user = authenticate(username=username, password=password)
       if user is not None:
           login(request, user)
           return JsonResponse({"status": "success"})
       else:
           return JsonResponse({"status": "error"})
   ```

3. **Maintain Session**
   - CookieRequest otomatis menyimpan session cookie
   - Setiap request berikutnya include session ID
   - Django validate session untuk akses data user

4. **Access User-Specific Data**
   ```python
   # Django: get user products
   def get_user_products(request):
       if request.user.is_authenticated:
           products = Product.objects.filter(user=request.user)
           # Return products as JSON
   ```

5. **Logout**
   ```dart
   // Flutter
   await request.logout(
     "http://10.0.2.2:8000/logout/",
   );
   Navigator.pushReplacement(context, 
     MaterialPageRoute(builder: (context) => LoginPage()));
   ```

   ```python
   # Django: logout view
   from django.contrib.auth import logout

   def logout_user(request):
       logout(request)
       return JsonResponse({"status": "success"})
   ```

### 🛠️ 7. Implementasi Checklist Step-by-Step

- Setup Django Backend
- Setup Flutter Dependencies
- Implementasi Authentication Flow
- Buat Data Models
- Implementasi Product CRUD
- Tambahkan Navigation & Drawer

Dengan implementasi ini, aplikasi Moovr Sportswear memiliki autentikasi yang aman, manajemen state yang konsisten, dan integrasi backend-frontend yang memukau.