import 'package:flutter/material.dart';
import '../models/note.dart';

class DetailedNoteScreen extends StatefulWidget {
  final Note note;

  const DetailedNoteScreen({super.key, required this.note});

  @override
  _DetailedNoteScreenState createState() => _DetailedNoteScreenState();
}

class _DetailedNoteScreenState extends State<DetailedNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note.title),
        backgroundColor: widget.note.color,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              widget.note.title = _titleController.text;
              widget.note.content = _contentController.text;
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        color: widget.note.color.withOpacity(0.1),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                style: const TextStyle(fontSize: 18),
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note content',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}