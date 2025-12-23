# E-Book Feature Guide

## Overview
The E-Book feature allows users to upload, organize, and read PDF documents within the Music Player app. This feature includes a complete library management system with reading progress tracking.

## Features

### 1. E-Book Library
- **Grid View Display**: Books are displayed in a 3-column grid layout
- **Search Functionality**: Search books by title or author
- **Favorites Filter**: Toggle to show only favorite books
- **Reading Progress**: Visual indicator showing reading progress percentage
- **Book Information**: View detailed metadata for each book

### 2. Add E-Books
Upload PDF files with comprehensive metadata:
- **Title** (required)
- **Author** (required)
- **Publisher** (optional)
- **Category** (optional)
- **Description** (optional)

### 3. PDF Viewer
Full-featured PDF reading experience:
- **Page Navigation**: Previous/Next buttons and direct page jump
- **Reading Progress**: Automatically saves last read page
- **Zoom Controls**: Double-tap to zoom
- **Search**: Search text within PDF
- **Page Counter**: Shows current page and total pages
- **Book Information**: Quick access to book details

### 4. Library Management
- **Add to Favorites**: Mark books as favorites
- **Delete Books**: Remove books from library (with confirmation)
- **Automatic Progress Tracking**: Last read page and date are saved automatically

## File Structure

### Models
- `lib/models/ebook.dart` - EBook data model with all metadata fields

### Providers
- `lib/providers/ebook_library_provider.dart` - State management for ebook library

### Screens
- `lib/screens/ebook_library_screen.dart` - Main library view with grid layout
- `lib/screens/add_ebook_screen.dart` - Form for uploading new ebooks
- `lib/screens/ebook_viewer_screen.dart` - PDF viewer with reading controls

### Services
- `lib/services/database_service.dart` - Database operations for ebooks (v4 schema)
- `lib/services/file_storage_service.dart` - File management for PDF files

## Database Schema

### ebooks Table (Version 4)
```sql
CREATE TABLE ebooks (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  author TEXT NOT NULL,
  filePath TEXT NOT NULL,
  pageCount INTEGER DEFAULT 0,
  description TEXT,
  category TEXT,
  publisher TEXT,
  addedDate TEXT NOT NULL,
  lastReadDate TEXT,
  lastReadPage INTEGER DEFAULT 0,
  isFavorite INTEGER DEFAULT 0
)
```

## Storage Location
PDF files are stored in: `C:\Users\cjingquan\Desktop\spotify_storage\ebooks\`

## Usage Instructions

### Adding an E-Book
1. Navigate to the E-Books tab in the bottom navigation
2. Tap the "+" floating action button
3. Select a PDF file from your device
4. Fill in the book details (title and author are required)
5. Tap "SAVE" to add the book to your library

### Reading an E-Book
1. Tap on any book card in the library
2. The PDF viewer will open at your last read page (or page 1 for new books)
3. Use the navigation buttons at the bottom to move between pages
4. Your reading progress is automatically saved
5. Tap the info icon to view book details
6. Use the search icon to search within the PDF

### Managing E-Books
- **Search**: Use the search bar at the top to find books by title or author
- **Favorites**: Tap the heart icon to filter favorites only
- **Delete**: Long-press a book card and select "Delete" from the menu
- **View Details**: Long-press a book card and select "Details" to see full metadata

## Technical Details

### Dependencies
- `syncfusion_flutter_pdfviewer: ^27.1.58` - PDF rendering and viewing
- `file_picker` - File selection for PDF upload
- `provider` - State management
- `sqflite_common_ffi` - Local database with Windows support

### Key Features Implementation

#### Reading Progress Tracking
- Automatically saves the current page number when navigating
- Updates `lastReadPage` and `lastReadDate` in the database
- Resumes reading from the last saved page

#### PDF Viewer Controls
- **Previous/Next Page**: Navigate sequentially through pages
- **Go to Page**: Jump directly to any page number
- **Page Counter**: Shows "Page X of Y" in the app bar
- **Search**: Built-in text search functionality
- **Zoom**: Double-tap to zoom in/out

#### File Management
- PDF files are copied to the app's storage directory
- Original files remain untouched
- Files are deleted from storage when books are removed from library

## Color Theme
The E-Book feature uses the same color theme as the rest of the app:
- Light Brown: #FFF2C6, #FFF8DE
- Light Blue: #AAC4F5, #8CA9FF

## Future Enhancements (Potential)
- Bookmarks and annotations
- Night mode for reading
- Text-to-speech
- Export reading statistics
- Collections/shelves organization
- Cloud sync for reading progress
- Multiple file format support (EPUB, MOBI)