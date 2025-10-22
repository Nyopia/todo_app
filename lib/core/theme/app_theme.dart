// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// 1. Renk Paletimizi Tanımlayalım
// Bu sınıfı, uygulama genelinde kullanacağımız renkleri
// tek bir yerden yönetmek için oluşturuyoruz.
class AppColors {
  // Ana Renkler
  static const Color primary = Color(0xFF6A1B9A); // Mor tonu
  static const Color primaryVariant = Color(0xFF4A148C); // Koyu Mor
  static const Color secondary = Color(0xFFFF6F00); // Turuncu tonu

  // Arka Plan Renkleri
  static const Color background = Color(0xFFF5F5F5); // Açık gri
  static const Color onBackground = Color(
    0xFF212121,
  ); // Koyu gri (yazılar için)

  // Yüzey Renkleri (Kartlar, diyaloglar vb.)
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF212121);

  // Hata Rengi
  static const Color error = Color(0xFFB00020);

  // Private constructor so that no one can instantiate this class.
  AppColors._();
}

// 2. Tema Verimizi Oluşturalım
// Bu ThemeData nesnesi, uygulamamızın genel görünümünü belirleyecek.
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  // Renk Şeması
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    primaryContainer: AppColors
        .primaryVariant, // Flutter 3'te primaryVariant yerine kullanılır
    secondary: AppColors.secondary,
    background: AppColors.background,
    surface: AppColors.surface,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: AppColors.onBackground,
    onSurface: AppColors.onSurface,
    onError: Colors.white,
  ),

  // Font Ailesi (İsteğe bağlı, Google Fonts ekleyebiliriz)
  // fontFamily: 'Montserrat',

  // Metin Temaları
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.onBackground,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.onBackground),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ), // Buton metinleri
  ),

  // AppBar Teması
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),

  // FloatingActionButton Teması
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondary,
  ),
);
