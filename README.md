# Music Player App

A beautiful music player application built with Flutter, featuring a Spotify-like interface with custom color themes.

## Features

### Core Features
- 🎵 **Music Library Management** - Import and organize your MP3 music files
- ▶️ **Audio Playback** - Play, pause, skip, and control your music
- 📝 **Playlists** - Create and manage custom playlists
- 🏷️ **Categories** - Organize music by categories (Favorites, Recently Added, etc.)
- 🔍 **Search** - Search for songs by title, artist, or album
- 🔀 **Shuffle & Repeat** - Shuffle playback and repeat modes (off, one, all)
- 📱 **Beautiful UI** - Custom color theme with light brown and light blue colors

### Music Management
- Upload MP3 files from your device
- Automatic metadata extraction (title, artist, album)
- Delete songs from library
- Add songs to playlists and categories
- View song duration and details

### Playback Controls
- Play/Pause
- Next/Previous track
- Seek to position
- Volume control
- Shuffle mode
- Repeat modes (off, repeat all, repeat one)
- View current playlist

## Color Theme

The app uses a custom color scheme:
- **Light Brown**: #FFF2C6, #FFF8DE
- **Light Blue**: #AAC4F5, #8CA9FF

## Storage

Music files are stored in: `C:\Users\cjingquan\Desktop\spotify_storage`

The storage directory contains:
- `music/` - Imported MP3 files
- `album_art/` - Album artwork images

## Installation

1. Ensure you have Flutter installed on your system
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Connect your device or start an emulator
5. Run `flutter run` to start the app

## Dependencies

- `just_audio` - Audio playback
- `audio_service` - Background audio service
- `file_picker` - File selection for importing music
- `path_provider` - Access to file system paths
- `provider` - State management
- `sqflite` - Local database for music metadata
- `permission_handler` - Handle runtime permissions

## Usage

### Importing Music
1. Tap the **+** button on the Library screen
2. Select MP3 files from your device
3. Files will be copied to the storage directory and added to your library

### Creating Playlists
1. Go to the **Playlists** tab
2. Tap the **+** button
3. Enter playlist name and description
4. Add songs by long-pressing a song and selecting "Add to Playlist"

### Creating Categories
1. Go to the **Categories** tab
2. Tap the **+** button
3. Enter category name and description
4. Add songs by long-pressing a song and selecting "Add to Category"

### Playing Music
1. Tap any song to start playback
2. Use the floating action button to open the full player screen
3. Control playback with play/pause, next/previous buttons
4. Enable shuffle or repeat modes as desired

### Searching
1. Tap the search icon in the Library screen
2. Enter your search query
3. Results will filter by song title, artist, or album

## Project Structure

```
lib/
├── config/
│   └── app_theme.dart          # App theme configuration
├── models/
│   ├── song.dart               # Song data model
│   ├── playlist.dart           # Playlist data model
│   └── category.dart           # Category data model
├── services/
│   ├── database_service.dart   # SQLite database operations
│   ├── audio_player_service.dart # Audio playback service
│   └── file_storage_service.dart # File management
├── providers/
│   └── music_library_provider.dart # State management
├── screens/
│   ├── home_screen.dart        # Main navigation
│   ├── library_screen.dart     # Music library
│   ├── playlists_screen.dart   # Playlists view
│   ├── playlist_detail_screen.dart
│   ├── categories_screen.dart  # Categories view
│   ├── category_detail_screen.dart
│   └── player_screen.dart      # Full player UI
├── widgets/
│   └── song_list_tile.dart     # Reusable song list item
└── main.dart                   # App entry point
```

## Permissions

The app requires the following permissions on Android:
- `READ_EXTERNAL_STORAGE` - Read music files
- `WRITE_EXTERNAL_STORAGE` - Save imported music
- `INTERNET` - For future streaming features
- `WAKE_LOCK` - Keep device awake during playback
- `FOREGROUND_SERVICE` - Background audio playback

## Future Enhancements

Potential features for future versions:
- Equalizer controls
- Lyrics display
- Online music streaming
- Social sharing
- Music recommendations
- Sleep timer
- Crossfade between tracks
- Gapless playback
- Cloud backup/sync
- Dark mode theme

## License

This project is created for educational purposes.

## Support

For issues or questions, please create an issue in the repository.
