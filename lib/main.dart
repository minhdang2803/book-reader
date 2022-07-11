import 'package:book_reader/providers/theme_provider.dart';
import 'package:book_reader/screens/authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeProvider =
      ThemeProvider(isDarkMode: prefs.getBool('isDarkTheme') ?? false);
  runApp(ChangeNotifierProvider(
    create: (context) => themeProvider,
    child: const MyBookReader(),
  ));
}

class MyBookReader extends StatefulWidget {
  const MyBookReader({Key? key}) : super(key: key);

  @override
  State<MyBookReader> createState() => _MyBookReaderState();
}

class _MyBookReaderState extends State<MyBookReader> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: themeProvider.getTheme,
        title: 'Book reader app',
        home: ResetPassword(),
      );
    });
  }
}
