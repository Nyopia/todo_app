// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// 1. Renk Paletimizi Tanımlayalım
// İsteğiniz üzerine #2F2F2F ve #FAFAFA renklerini temel alan
// minimalist bir palet oluşturuyoruz.
class AppColors {
  // Ana Renkler (Monokrom)
  static const Color primary = Color(0xFF2F2F2F); // Koyu Gri (Ana renk)
  static const Color secondary = Color(0xFF2F2F2F); // Koyu Gri (İkincil renk)
  // Not: Butonlar vb. için farklı bir renk isterseniz,
  // `secondary` rengini ileride değiştirebilirsiniz.

  // Arka Plan ve Yüzey Renkleri
  static const Color background = Color(0xFFFAFAFA); // Açık Beyaz
  static const Color surface = Color(0xFFFAFAFA); // Açık Beyaz (Kartlar vb.)
  // Not: Kartların arka plandan ayrışması için
  // `surface` rengini `Colors.white` (0xFFFFFFFF) olarak da deneyebilirsiniz.

  // "On" Renkleri (Yazı/İkon renkleri)
  // "On" renkleri, geldikleri "ana" rengin üzerindeki metin veya ikon rengidir.
  static const Color onPrimary = Color(
    0xFFFAFAFA,
  ); // Ana renk (koyu) üzerindeki yazı (açık)
  static const Color onSecondary = Color(
    0xFFFAFAFA,
  ); // İkincil renk (koyu) üzerindeki yazı (açık)
  static const Color onBackground = Color(
    0xFF2F2F2F,
  ); // Arka plan (açık) üzerindeki yazı (koyu)
  static const Color onSurface = Color(
    0xFF2F2F2F,
  ); // Yüzey (açık) üzerindeki yazı (koyu)

  // Hata Rengi (Standart Material rengini koruyabiliriz)
  static const Color error = Color(0xFFB00020);
  static const Color onError = Color(0xFFFAFAFA); // Hata üzerindeki yazı

  // Private constructor
  AppColors._();
}

// 2. Tema Verimizi Oluşturalım
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  // Renk Şeması
  // Burada AppColors sınıfında tanımladığımız renkleri
  // Flutter'ın anlayacağı şekilde eşleştiriyoruz.
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    primaryContainer: AppColors.primary, // `primaryVariant` yerine geçer
    secondary: AppColors.secondary,
    background: AppColors.background,
    surface: AppColors.surface,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onBackground: AppColors.onBackground,
    onSurface: AppColors.onSurface,
    onError: AppColors.onError,
  ),

  // Font Ailesi (İsteğe bağlı)
  // fontFamily: 'Inter',

  // Metin Temaları
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.onBackground, // Koyu Gri
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: AppColors.onBackground, // Koyu Gri
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.onPrimary, // Açık Beyaz (Buton metinleri)
    ),
  ),

  // AppBar Teması
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary, // Koyu Gri
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.onPrimary), // Açık Beyaz ikonlar
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.onPrimary, // Açık Beyaz başlık
    ),
  ),

  // FloatingActionButton Teması
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondary, // Koyu Gri
    foregroundColor: AppColors.onSecondary, // Açık Beyaz ikon
  ),

  // --- Buton Temaları (Özelleştirildi) ---

  // 1. ElevatedButton (Yükseltilmiş Buton)
  // Ana eylem butonu. Tema'nın ana rengini alır.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary, // Koyu Gri
      foregroundColor: AppColors.onPrimary, // Açık Beyaz
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Hafif oval kenarlar
      ),
      elevation: 2, // Minimal gölge
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),

  // 2. TextButton (Yazı Butonu)
  // İkincil eylemler. Sadece yazı rengi değişir.
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary, // Koyu Gri
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),

  // 3. OutlinedButton (Dış Hatlı Buton)
  // Alternatif eylem butonu.
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary, // Koyu Gri
      side: const BorderSide(color: AppColors.primary), // Koyu Gri kenarlık
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  // --- BUTON TEMALARI SONU ---
);
