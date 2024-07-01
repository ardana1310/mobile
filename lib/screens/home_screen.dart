import 'package:flutter/material.dart';
import '../widgets/note_card.dart';
import '../models/note.dart';
import 'search_screen.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [
    Note(title: 'Quick Note', content: 'orem Ipsum is simply dummy...', color: Colors.pink[100]!),
    Note(title: 'Types Test', content: 'orem Ipsum is...', color: Colors.pink[300]!),
    Note(title: 'not best list', content: 'kirana store list', color: Colors.blue[300]!),
    Note(title: 'Lorem ...', content: 'orem Ipsum is simply dummy...', color: Colors.purple[100]!),
    Note(title: 'donate my..', content: '\$5000', color: Colors.orange[100]!),
  ];

  int _selectedIndex = 0;

 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1: // Categories
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriesScreen()),
        );
        break;
      case 2: // Search
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen(notes: notes)),
        );
        break;
      // Tambahkan case lain jika diperlukan
    }
  }
  void _addNewNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = '';
        String newContent = '';
        return AlertDialog(
          title: const Text('Add New Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Enter title'),
                onChanged: (value) {
                  newTitle = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Enter content'),
                onChanged: (value) {
                  newContent = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  notes.add(Note(
                    title: newTitle,
                    content: newContent,
                    color: Colors.primaries[notes.length % Colors.primaries.length],
                  ));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteCard(
              note: notes[index],
              onDelete: () {
                setState(() {
                  notes.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewNote,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}