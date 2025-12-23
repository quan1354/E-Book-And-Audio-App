# Admin Lock Feature Guide

## Overview
The DhammaJata Media app includes a simple admin lock feature that protects add/delete operations for songs and e-books.

## How It Works

### Lock Icon
- Located in the app bar, **to the left of the favorites (heart) icon**
- **Locked (🔒)**: Admin features are disabled
- **Unlocked (🔓)**: Admin features are enabled (shown in green)

### Admin Credentials
- **Username:** `dhammajata`
- **Password:** `dhamma1234`

## User Experience

### When Locked (Default State)
1. Lock icon (🔒) appears in Music Library and E-Book Library screens
2. "Add" button is hidden
3. "Delete" option is hidden in song/e-book menus
4. All viewing, playing, and downloading features work normally

### To Unlock Admin Features
1. Click the **lock icon (🔒)**
2. A login dialog appears
3. Enter username: `dhammajata`
4. Enter password: `dhamma1234`
5. Click "Login"
6. Lock icon changes to **unlocked (🔓)** in green
7. "Add" and "Delete" options become visible

### To Lock Again
1. Click the **unlocked icon (🔓)**
2. Confirm logout in the dialog
3. Lock icon changes back to **locked (🔒)**
4. "Add" and "Delete" options are hidden again

## Features Protected

### Music Library
- ✅ **Add Song** button (manual and quick import)
- ✅ **Delete** option in song context menu

### E-Book Library
- ✅ **Add E-Book** button
- ✅ **Delete** option in e-book context menu

### Always Available (No Lock Required)
- ✅ View all songs and e-books
- ✅ Play music
- ✅ Read e-books
- ✅ Add to playlists
- ✅ Download songs and e-books
- ✅ Mark as favorites
- ✅ Search and filter

## Technical Details

### Files Modified
1. **lib/services/auth_service.dart** - Authentication service with hardcoded credentials
2. **lib/screens/library_screen.dart** - Added lock icon and login modal
3. **lib/screens/ebook_library_screen.dart** - Added lock icon and login modal
4. **lib/screens/splash_screen.dart** - Removed login screen routing
5. **lib/screens/home_screen.dart** - Removed app bar
6. **lib/main.dart** - AuthService registered in providers

### Persistence
- Login state is saved using `shared_preferences`
- Remains unlocked even after app restart
- Must manually lock again to disable admin features

## Usage Tips

1. **Quick Access**: The lock icon is always visible in the app bar for easy access
2. **Visual Feedback**: Green unlocked icon clearly shows admin mode is active
3. **No Separate Screen**: Login happens in a modal dialog, no navigation required
4. **Persistent State**: Once unlocked, stays unlocked until you manually lock it

## Security Notes

This is a simple protection mechanism suitable for personal use. For production:
- Consider implementing backend authentication
- Use encrypted storage for credentials
- Add session timeout
- Implement proper user management

## Troubleshooting

**Can't login?**
- Verify credentials: `dhammajata` / `dhamma1234`
- Check for extra spaces
- Ensure caps lock is off

**Lock icon not showing?**
- Make sure you're on Music Library or E-Book Library screen
- Check that AuthService is properly registered in main.dart

**Add/Delete buttons not appearing after unlock?**
- Verify the lock icon shows as unlocked (green)
- Try locking and unlocking again
- Restart the app if needed