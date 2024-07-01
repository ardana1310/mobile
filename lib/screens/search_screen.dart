import 'package:flutter/material.dart';
import '../models/note.dart';

class SearchScreen extends StatelessWidget {
  final List<Note> notes;

  const SearchScreen({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search notes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Implementasi logika pencarian
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].content),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}