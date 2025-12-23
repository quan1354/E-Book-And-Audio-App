# Spotify-like Music Player App - Setup Instructions

## Overview
A Flutter-based music player application for Windows with Spotify-like features including music upload, playback, playlists, and categories.

## Features
- ✅ Upload and import MP3 files (and other audio formats)
- ✅ Play, pause, skip, and seek through songs
- ✅ Create and manage playlists
- ✅ Organize music by categories
- ✅ Search functionality
- ✅ Shuffle and repeat modes
- ✅ Custom color theme (Light Brown & Light Blue)
- ✅ Persistent storage using SQLite

## Color Theme
- **Light Brown**: #FFF2C6, #FFF8DE
- **Light Blue**: #AAC4F5, #8CA9FF

## Storage Location
All music files are stored in: `C:\Users\cjingquan\Desktop\spotify_storage\music`

## Technical Stack
- **Framework**: Flutter
- **Database**: SQLite with sqflite_common_ffi (Windows support)
- **Audio Player**: assets_audio_player (cross-platform with Windows support)
- **File Picker**: file_picker
- **State Management**: Provider pattern

## Project Structure
```
lib/
├── config/
│   └── app_theme.dart          # Custom color theme
├── models/
│   ├── song.dart               # Song data model
│   ├── playlist.dart           # Playlist data model
│   └── category.dart           # Category data model
├── services/
│   ├── database_service.dart   # SQLite database operations
│   ├── file_storage_service.dart # File import and storage
│   └── audio_player_service.dart # Audio playback control
├── providers/
│   └── music_library_provider.dart # State management
├── screens/
│   ├── home_screen.dart        # Main navigation
│   ├── library_screen.dart     # Music library view
│   ├── player_screen.dart      # Full-screen player
│   ├── playlists_screen.dart   # Playlist management
│   ├── playlist_detail_screen.dart
│   ├── categories_screen.dart  # Category management
│   ├── category_detail_screen.dart
│   └── debug_screen.dart       # Database debugging
├── widgets/
│   └── song_list_tile.dart     # Reusable song list item
└── main.dart                   # App entry point
```

## How to Build

### Prerequisites
- Flutter SDK installed
- Windows development environment set up

### Build Commands

1. **Clean previous builds**:
   ```bash
   flutter clean
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Build for Windows**:
   ```bash
   flutter build windows
   ```

4. **Run in debug mode**:
   ```bash
   flutter run -d windows
   ```

5. **Run in release mode**:
   ```bash
   flutter run -d windows --release
   ```

## Executable Location
After building, the executable will be at:
```
build\windows\x64\runner\Release\spotify.exe
```

## How to Use

### Importing Music
1. Click the **+** button in the app bar (next to search icon)
2. Select one or more MP3 files from your computer
3. Files will be copied to the storage directory and added to the library

### Playing Music
1. Tap on any song in the library to start playback
2. Use the player controls:
   - Play/Pause button
   - Previous/Next buttons
   - Seek bar for position control
   - Shuffle button
   - Repeat button (off/all/one)

### Creating Playlists
1. Go to the Playlists tab
2. Tap the + button to create a new playlist
3. Long-press on songs to add them to playlists

### Searching
1. Click the search icon in the app bar
2. Enter song name, artist, or album
3. Results will filter in real-time

### Debug Mode
- Click the bug icon in the app bar to view database contents
- Useful for troubleshooting import issues

## Dependencies

### Main Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  assets_audio_player: ^3.1.1
  file_picker: ^8.0.0+1
  path_provider: ^2.1.2
  path: ^1.9.0
  provider: ^6.1.1
  sqflite: ^2.3.2
  sqflite_common_ffi: ^2.3.0+4
  permission_handler: ^11.2.0
  audiotagger: ^2.2.1
  flutter_svg: ^2.0.9
```

## Troubleshooting

### Audio Not Playing
- Ensure the app was built with `flutter build windows` after adding `assets_audio_player`
- Check that the MP3 file is valid and not corrupted
- Verify the file path in the debug screen

### Songs Not Importing
- Check file permissions for the storage directory
- Ensure you're selecting audio files (MP3, M4A, WAV, FLAC, etc.)
- Check the debug console for error messages

### Database Issues
- Use the debug screen (bug icon) to view database contents
- Database is stored in: `C:\Users\cjingquan\Documents\music_player.db`
- Delete the database file to reset (will lose all data)

## Known Limitations
- Windows desktop only (can be extended to Android/iOS)
- No online streaming (local files only)
- Basic metadata extraction (filename parsing)
- No album art extraction from MP3 tags

## Future Enhancements
- Extract metadata from MP3 ID3 tags
- Album art display
- Equalizer
- Lyrics display
- Cloud sync
- Mobile platform support

## License
This is a custom-built application for personal use.

## Support
For issues or questions, check the debug screen for database contents and console logs.