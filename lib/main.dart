import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'config/app_theme.dart';
import 'providers/music_library_provider.dart';
import 'providers/ebook_library_provider.dart';
import 'services/audio_player_service.dart';
import 'services/auth_service.dart';
import 'screens/splash_screen.dart';

void main() {
  // Initialize sqflite for desktop platforms
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProxyProvider<AuthService, MusicLibraryProvider>(
          create: (context) => MusicLibraryProvider(
            Provider.of<AuthService>(context, listen: false),
          )..initialize(),
          update: (context, authService, previous) =>
              previous ?? MusicLibraryProvider(authService)..initialize(),
        ),
        ChangeNotifierProvider(create: (_) => EBookLibraryProvider()..initialize()),
        ChangeNotifierProvider(create: (_) => AudioPlayerService()),
      ],
      child: MaterialApp(
        title: 'My Library',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
