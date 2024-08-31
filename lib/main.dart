import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme
              .onPrimaryContainer, //backgroundColor Xác định màu nền của widget.
          foregroundColor: kColorScheme
              .primaryContainer, //foregroundColor: Xác định màu của các thành phần nội dung bên trong widget, chẳng hạn như văn bản hoặc biểu tượng.
          /*primaryContainer: Thông thường được sử dụng làm màu nền cho các thành phần chính hoặc quan trọng trong giao diện người dùng, như các vùng chứa chính (Container, Button).
          onPrimaryContainer: Là màu được sử dụng trên màu nền primaryContainer, thường dành cho văn bản hoặc biểu tượng, để tạo ra sự tương phản tốt.*/
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
              ),
            ),
      ),
      themeMode: ThemeMode.system, //để thiết lập chế độ chủ đề
      home: const Expenses(),
    ));
  });
}
