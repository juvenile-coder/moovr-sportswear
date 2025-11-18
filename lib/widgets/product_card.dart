import 'package:flutter/material.dart';
import 'package:moovr_sportswear/screens/productlist_form.dart';
import 'package:moovr_sportswear/screens/menu.dart';
import 'package:moovr_sportswear/screens/product_entry_list.dart';
import 'package:moovr_sportswear/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  // Fungsi menentukan warna tombol
  Color _getButtonColor() {
    switch (item.name) {
      case "All Products":
        return Colors.blue;
      case "My Products":
        return Colors.green;
      case "Create Products":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: _getButtonColor(),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async{
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu menekan tombol ${item.name}!")),
            );

          if (item.name == "Create Products") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductFormPage()),
            );
          }
          else if (item.name == "See Sports Products") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductEntryListPage()
                  ),
              );
          }
          else if (item.name == "Logout") {
          // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
          // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
          // If you using chrome,  use URL http://localhost:8000
          
          final response = await request.logout(
              "http://localhost:8000/auth/logout/");
          String message = response["message"];
          if (context.mounted) {
              if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message See you again, $uname."),
                  ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
              } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(message),
                      ),
                  );
              }
            }
          }
        },
        child: Container(
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
                const SizedBox(height: 4),
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
