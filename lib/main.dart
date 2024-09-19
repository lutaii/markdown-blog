import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_blog/layout/layout.dart';
import 'package:markdown_blog/theme/theme.dart';
import 'package:provider/provider.dart';

final themeModeSwitcher = ValueNotifier(ThemeMode.system);

final lightTheme = createThemeData(
  brightness: Brightness.light,
  palette: lightColorPalette,
  typography: defaultTypography,
);

final darkTheme = createThemeData(
  brightness: Brightness.dark,
  palette: darkColorPalette,
  typography: defaultTypography,
);

void main() {
  runApp(const MarkdownEditorApp());
}

class MarkdownEditorApp extends StatelessWidget {
  const MarkdownEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowSizeScope(
      child: ChangeNotifierProvider(
        create: (context) => MarkdownProvider(),
        child: ValueListenableBuilder(
          valueListenable: themeModeSwitcher,
          builder: (context, themeMode, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              darkTheme: darkTheme,
              theme: lightTheme,
              home: const MarkdownEditorScreen(),
            );
          },
        ),
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
      backgroundColor: Theme.of(context).colorPalette.background,
      appBar: AppBar(
        title: Text(
          'Markdown Editor',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorPalette.primary),
        ),
        backgroundColor: Theme.of(context).colorPalette.background,
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
