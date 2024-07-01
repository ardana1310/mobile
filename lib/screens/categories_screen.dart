import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Work'),
            onTap: () {
              // Implementasi logika ketika kategori dipilih
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Personal'),
            onTap: () {
              // Implementasi logika ketika kategori dipilih
            },
          ),
          // Tambahkan kategori lain sesuai kebutuhan
        ],
      ),
    );
  }
}