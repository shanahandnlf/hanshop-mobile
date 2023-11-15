# hanshop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# PBP Tugas 7

- Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Stateless widget berarti widget yang tidak memiliki state, artinya widget tersebut menggambarkan tampilan yang statis atau tidak berubah-ubah. Stateless widget hanya memiliki satu method yaitu build() yang digunakan untuk mengembalikan widget yang akan ditampilkan.

Stateful widget berarti widget yang memiliki state, artinya widget tersebut menggambarkan tampilan yang dinamis atau berubah-ubah. Stateful widget memiliki dua method yaitu createState() dan build(). Method createState() digunakan untuk membuat state dari widget tersebut, sedangkan method build() digunakan untuk mengembalikan widget yang akan ditampilkan.


- Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

Berdasarkan main.dart dan menu.dart, widget yang digunakan adalah sebagai berikut:
1. Scaffold: Widget yang digunakan untuk membuat kerangka dasar tampilan dengan desain berbasis material sebagai dasar tata letak visual.

2. AppBar: Sebuah kontainer yang terletak di bagian atas tampilan dan digunakan untuk menampilkan konten dan fitur aplikasi.

3. Text: Widget untuk menampilkan teks dalam antarmuka pengguna.

4. Column: Widget yang mengatur tata letak elemen-elemen anak secara vertikal, mengurutkan mereka dari atas ke bawah.

5. SingleChildScrollView: Sebuah wrapper widget yang memungkinkan kontennya dapat di-scroll, baik secara horizontal maupun vertikal.

6. Icon: Widget yang digunakan untuk menampilkan ikon tertentu dalam antarmuka pengguna.

7. Padding: Widget yang digunakan untuk mengatur jarak atau posisi elemen-elemen anak di dalamnya.

8. GridView: Widget yang digunakan untuk menampilkan daftar elemen dalam bentuk grid, baik secara horizontal maupun vertikal.

9. Container: Widget yang digunakan sebagai wadah untuk mengelompokkan beberapa komponen yang memiliki karakteristik serupa.

10. Center: Widget yang digunakan untuk mengatur posisi elemen anaknya di tengah layar.

11. Theme: Widget yang digunakan untuk mengatur tema dan gaya visual aplikasi secara global.


- Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

1. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

    Masuk ke direktori dimana kamu ingin buat program flutter, kemudian ketik "flutter create hanshop" untuk membuat program flutter dalam direktori yang diinginkan

    Kemudian buka folder lib pada direktori hanshop, kemudian tambahkan file menu.dart

    Pindahkan kode MyHomePage dan _MyHomePageState  pada main.dart ke menu.dart. Kemudian ubahlah kode pada line 34 pada main.dart menjadi sebagai berikut:

    ````
    home: MyHomePage(),
    ````
    dan tambahkan import dari menu.dart pada main.dart "import 'package:shopping_list/menu.dart';"

    Kemudian tambahkan kode berikut pada menu.dart untuk membuat sebuah class yang merupakan turunan dari StatelessWidget:

````
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',

        ),
        backgroundColor: Colors.indigo, // added
        foregroundColor: Colors.white,// added
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Han Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final MaterialColor color; // for color
  final IconData icon;


  ShopItem(this.name, this.color, this.icon);
}


final List<ShopItem> items = [
  ShopItem("Lihat Item", Colors.red, Icons.checklist), // add warna buat semua tombol
  ShopItem("Tambah Item", Colors.blue, Icons.add_shopping_cart),
  ShopItem("Logout", Colors.green, Icons.logout),
];



````


Kode ini akan membuat widget yang menampilkan tiga tombol dengan ikon dan teks yang sesuai dan warna tiap tombol yang berbeda



2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:
    - Melihat daftar item (Lihat Item)
    - Menambah item (Tambah Item)
    - Logout (Logout)

Menambahkan kode ini pada menu.dart
````
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final MaterialColor color; // for color
  final IconData icon;


  ShopItem(this.name, this.color, this.icon);
}


final List<ShopItem> items = [
  ShopItem("Lihat Item", Colors.red, Icons.checklist), // add warna buat semua tombol
  ShopItem("Tambah Item", Colors.blue, Icons.add_shopping_cart),
  ShopItem("Logout", Colors.green, Icons.logout),
];
````




3. Memunculkan Snackbar dengan tulisan:
    - "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
    - "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
    - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
menambahkan kode  pada bagian Widget build pada class ShopCard
````
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },

class ShopItem {
  final String name;
  final MaterialColor color; // for color
  final IconData icon;


  ShopItem(this.name, this.color, this.icon);
}


final List<ShopItem> items = [
  ShopItem("Lihat Item", Colors.red, Icons.checklist), // add warna buat semua tombol
  ShopItem("Tambah Item", Colors.blue, Icons.add_shopping_cart),
  ShopItem("Logout", Colors.green, Icons.logout),
];
````

4. Implementasi bonus, membuat tombold dengan warna berbeda untuk setiap tombolnya.
menambahkan atribut color
````
class ShopItem {
  final String name;
  final MaterialColor color; // for color
  final IconData icon;


  ShopItem(this.name, this.color, this.icon);
}
````

menambahkan color yang diinginkan
````
final List<ShopItem> items = [
  ShopItem("Lihat Item", Colors.red, Icons.checklist), // add warna buat semua tombol
  ShopItem("Tambah Item", Colors.blue, Icons.add_shopping_cart),
  ShopItem("Logout", Colors.green, Icons.logout),
];
````
Pemanggilan warna
````
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      ...
````


# PBP Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Navigator.push() digunakan untuk menambahkan halaman baru ke dalam stack halaman. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna. Cocok jika ingin membiarkan pengguna kembali ke layar sebelumnya dengan menekan tombol back di perangkat

contoh: 

````
 if (item.name == "Tambah Produk") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
````

Navigator.pushReplacement() digunakan untuk mengganti halaman yang sedang ditampilkan dengan halaman baru. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya. Cocok jika ingin mengganti halaman yang sedang ditampilkan dengan halaman baru tanpa membiarkan pengguna kembali ke halaman sebelumnya.

contoh: 
````
onTap: () {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(),
      ));
  },
````

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

- Single-child layout widget

Align: Mengatur posisi child sesuai dengan parameter seperti alignment, width factor, dan height factor.

AspectRatio: Mengukur child dengan aspect ratio yang ditentukan, mempertahankan rasio tersebut saat menyesuaikan ukuran.

Baseline: Menempatkan child pada baseline tertentu, berguna untuk mengatur posisi elemen berdasarkan baseline teks.

Center: Menempatkan child di tengah parent widget.

ConstrainedBox: Memberikan batasan pada ukuran child sesuai dengan parameter yang ditetapkan.

Container: Widget yang berfungsi sebagai kotak dengan kemampuan untuk mengisi dan mengatur properti seperti posisi, ukuran, dan dekorasi.

CustomSingleChildLayout: Widget layout kustom yang memungkinkan penempatan dan pengukuran khusus untuk child widget tunggal.

Expanded: Memperluas child untuk mengisi ruang yang tersedia, biasanya digunakan dalam layout linear seperti row, column, atau flex.

FittedBox: Menyesuaikan child sesuai dengan ruang yang tersedia tanpa mempertahankan rasio aslinya.

Padding: Menambahkan padding di sekitar child widget.

SizedBox: Mengatur ukuran panjang dan lebar dari child widget.

- Multi-child layout widgets

Column: Menata daftar widget child secara vertikal, satu di bawah yang lain.

GridView: Menyusun daftar dalam bentuk grid dengan pola berulang dari sel yang diatur secara vertikal dan horizontal.

ListView: Menyusun daftar widget yang dapat digulir secara linear. Child-widget ditampilkan satu per satu dalam arah gulir, dan pada sumbu silang, child-child ini mengisi ruang ListView.

Row: Menata daftar widget child secara horizontal, satu di samping yang lain.

Stack: Widget yang memposisikan child-childnya relatif terhadap tepi kotak. Berguna ketika Anda ingin menumpuk beberapa child dengan cara yang sederhana, seperti menimpa teks, gambar, gradien, dan tombol di bagian bawah.

- Sliver widgets

SliverAppBar: Menampilkan AppBar yang dapat di-scroll, biasanya digunakan sebagai AppBar pada CustomScrollView.


3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Form: Widget yang digunakan sebagai kontainer untuk widget input field yang telah dibuat

TextFormField: Widget yang digunakan untuk membuat input field dengan label dan validasi

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Clean Architecture dilakukan dengan mengelompokkan proyek menjadi beberapa lapisan utama berdasarkan tanggung jawabnya:

- Data Layer: Berisi kode yang berhubungan dengan data, seperti akses ke database, dan repository.

- Domain Layer: Berisi kode yang berhubungan dengan business logic, entities, dan use cases dari aplikasi

- Presentation Layer: Berisi kode yang berhubungan dengan tampilan aplikasi, seperti widgets dan state management.


5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Pertama membuat folder screens dan widget baru di dalam lib, kemudian memindahkan widget ShopItem pada menu.dart ke file widgets/shop_card.dart

- Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
  - Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
  - Memiliki sebuah tombol Save.
  - Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
    - Setiap elemen input tidak boleh kosong.
    - Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

    
Membuat shoplist_form.dart pada folder screens dan menambahkan kode berikut. ShopFormPage merupakan turunan dari StatefulWidget, sehingga memiliki state yang dapat diubah.


````
import 'package:flutter/material.dart';
import 'package:hanshop/widgets/left_drawer.dart';


class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // TODO: Tambahkan drawer yang sudah dibuat di sini done
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Item",
                        labelText: "Nama Item",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Amount",
                        labelText: "Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // TODO: Tambahkan variabel yang sesuai
                      onChanged: (String? value) {
                        setState(() {
                          _amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Amount tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Amount harus berupa angka!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Deskripsi",
                        labelText: "Deskripsi",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          // TODO: Tambahkan variabel yang sesuai
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Deskripsi tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Harga",
                        labelText: "Harga",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // TODO: Tambahkan variabel yang sesuai
                      onChanged: (String? value) {
                        setState(() {
                          _price = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Harga tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Harga harus berupa angka!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Item berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama: $_name'),
                                        // TODO: Munculkan value-value lainnya done keayaknya
                                        Text('Amount: $_amount' ),
                                        Text('Deskripsi: $_description'),
                                        Text('Harga: $_price' ),

                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            _formKey.currentState!.reset(); // move this
                          }
                          // _formKey.currentState!.reset();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ]
            )
        ),
      ),
    );
  }
}

````



- Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

bukalah shop_card.dart dan tambahkan navigator psuh pada bagian onTap pada class ShopCard

````
 onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShopFormPage()
                ));
          }
        },
````


- Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
menambahkan kode ini pada bagian onpressed pada shoplist_form.dart. showDialog akan memunculkan notifikasi jika item berhasil dibuat
````
onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Item berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama: $_name'),
                                        // TODO: Munculkan value-value lainnya done keayaknya
                                        Text('Amount: $_amount' ),
                                        Text('Deskripsi: $_description'),
                                        Text('Harga: $_price' ),

                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
````

- Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
  - Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
  - Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
  - Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
membuat file left_drawer.dart pada folder widgets dan menambahkan kode berikut

````
import 'package:flutter/material.dart';
import 'package:hanshop/screens/menu.dart';
import 'package:hanshop/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Han Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh keperluan belanjamu di sini!",
                  // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa done
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ShopFormPage di sini, done
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShopFormPage()
                  ));
            },
          ),
        ],
      ),
    );
  }
}
````

Routing ke halaman utama dan halaman form tambah item baru sudah dibuat dengan komponen ListTile.

````
// TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ShopFormPage di sini, done
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShopFormPage()
                  ));
            },
````
