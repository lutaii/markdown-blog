import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markdown_blog/layout/layout.dart';
import 'package:markdown_blog/theme/theme.dart';
import 'package:provider/provider.dart';

import 'presentation/components/tappable_item.dart';

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
      // child: ChangeNotifierProvider(
      // create: (context) => MarkdownProvider(),
      child: ValueListenableBuilder(
        valueListenable: themeModeSwitcher,
        builder: (context, themeMode, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            darkTheme: darkTheme,
            theme: lightTheme,
            home: const MainWidget(),
          );
        },
      ),
      // ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double horizontalPadding = screenWidth * 0.1;

    if (horizontalPadding > 200) {
      horizontalPadding = 200;
    }
    return Container(
      color: Theme.of(context).colorPalette.background,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Articles',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 50,
                ),
                SvgPicture.asset(
                  'svg/feed.svg',
                  width: 25,
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorPalette.muted,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                TappableItem(
                  child: SvgPicture.asset(
                    'svg/create.svg',
                    width: 25,
                    height: 25,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorPalette.muted,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'svg/user.svg',
                  width: 25,
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorPalette.muted,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorPalette.background,
          ),
          backgroundColor: Theme.of(context).colorPalette.background,
        ),
      ),
    );
  }
}


// class MarkdownEditorScreen extends StatelessWidget {
//   const MarkdownEditorScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final markdownProvider = Provider.of<MarkdownProvider>(context);

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorPalette.background,
//       appBar: AppBar(
//         title: Text(
//           'Markdown Editor',
//           style: Theme.of(context)
//               .textTheme
//               .bodyLarge
//               ?.copyWith(color: Theme.of(context).colorPalette.primary),
//         ),
//         backgroundColor: Theme.of(context).colorPalette.background,
//       ),
//       body: Column(
//         children: [
//           // Text Input
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (text) => markdownProvider.updateMarkdown(text),
//                 maxLines: null,
//                 expands: true,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your markdown here...',
//                 ),
//               ),
//             ),
//           ),
//           // Markdown Preview
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 color: Colors.white,
//                 child: Markdown(
//                   selectable: true,
//                   data: markdownProvider.markdownData,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MarkdownProvider extends ChangeNotifier {
//   String _markdownData = '';

//   String get markdownData => _markdownData;

//   void updateMarkdown(String newMarkdown) {
//     _markdownData = newMarkdown;
//     notifyListeners();
//   }
// }
