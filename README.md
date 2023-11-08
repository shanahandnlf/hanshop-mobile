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
1. MyApp: merupakan class yang merupakan turunan dari StatelessWidget. Class ini digunakan untuk membuat widget yang merupakan root dari aplikasi Flutter.
2. MyHomePage: merupakan class yang merupakan turunan dari StatefulWidget. Class ini digunakan untuk membuat widget yang merupakan halaman utama dari aplikasi Flutter.
3. ShopCard: merupakan class yang merupakan turunan dari StatelessWidget. Class ini digunakan untuk membuat widget yang merupakan card untuk menampilkan informasi dari sebuah item.
4. ShopItem: merupakan class yang merupakan turunan dari StatelessWidget. Class ini digunakan untuk membuat widget yang merupakan item dari sebuah item.
5. ShopList: merupakan class yang merupakan turunan dari StatelessWidget. Class ini digunakan untuk membuat widget yang merupakan list dari item-item yang ada.


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
