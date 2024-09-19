import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MarkdownEditorApp());
}

class MarkdownEditorApp extends StatelessWidget {
  const MarkdownEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MarkdownProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MarkdownEditorScreen(),
      ),
    );
  }
}

class MarkdownEditorScreen extends StatelessWidget {
  const MarkdownEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final markdownProvider = Provider.of<MarkdownProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Markdown Editor'),
      ),
      body: Column(
        children: [
          // Text Input
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) => markdownProvider.updateMarkdown(text),
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your markdown here...',
                ),
              ),
            ),
          ),
          // Markdown Preview
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Markdown(
                  selectable: true,
                  data: markdownProvider.markdownData,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MarkdownProvider extends ChangeNotifier {
  String _markdownData = '';

  String get markdownData => _markdownData;

  void updateMarkdown(String newMarkdown) {
    _markdownData = newMarkdown;
    notifyListeners();
  }
}
