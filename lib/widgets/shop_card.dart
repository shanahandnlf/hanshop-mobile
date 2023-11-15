import 'package:flutter/material.dart';
import 'package:hanshop/screens/item_list.dart';
import 'package:hanshop/screens/shoplist_form.dart';



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
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShopFormPage()
                ));
          }
          if (item.name == "Lihat Item"){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemPage()
                ));
          }
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
