# Multi-User Authentication System Guide

## Overview

The application now features a complete multi-user authentication system with role-based permissions. Users can register, login, and have personalized experiences with their own playlists while sharing the same music and e-book library.

## User Types

### 1. Admin User (Pre-created)
- **Username**: `dhammajata`
- **Password**: `dhamma1234`
- **Email**: `admin@dhammajata.com`
- **Permissions**:
  - Can add new songs and e-books
  - Can delete songs and e-books
  - Can create, edit, and delete playlists
  - Full access to all features

### 2. Normal Users (Registered)
- **Registration**: Users can register with username, email, and password
- **Permissions**:
  - Can view and play all songs and e-books
  - Can create and manage their own playlists
  - Can download songs and e-books
  - Can mark favorites
  - **Cannot** add or delete songs/e-books (no add/delete buttons visible)

## Features

### User Registration
- **Required Fields**:
  - Username (minimum 3 characters, must be unique)
  - Email (valid email format, must be unique)
  - Password (minimum 6 characters)
  - Confirm Password (must match)
- **Validation**:
  - Username uniqueness check
  - Email format validation
  - Email uniqueness check
  - Password strength requirement
  - Password confirmation match
- **Auto-login**: After successful registration, users are automatically logged in

### User Login
- **Login Method**: Username and password
- **Session Persistence**: Login state is saved using SharedPreferences
- **Auto-redirect**: Logged-in users are automatically redirected to home screen on app launch

### User-Specific Features

#### Playlists
- Each user has their own separate playlists
- Playlists are filtered by user ID
- Users can only see and manage their own playlists
- Playlists can contain both songs and e-books

#### Shared Content
- All users see the same music library
- All users see the same e-book library
- Favorites are user-specific
- Download functionality available to all users

### User Interface

#### Login Screen
- Clean, modern design with gradient background
- Username and password fields
- Password visibility toggle
- "Register" link for new users
- Form validation with error messages

#### Registration Screen
- Username, email, password, and confirm password fields
- Real-time validation
- Helper text for requirements
- Password visibility toggles
- "Login" link for existing users

#### Home Screen
- User profile icon in app bar (shows first letter of username)
- Dropdown menu with:
  - Username and email display
  - Admin badge (if admin user)
  - Logout option
- Logout confirmation dialog

#### Library Screens
- Add/Delete buttons only visible to admin users
- Normal users see "Please login as admin" message when library is empty
- All users can view, play, and download content

## Technical Implementation

### Database Schema

#### Users Table
```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  isAdmin INTEGER NOT NULL DEFAULT 0,
  createdAt TEXT NOT NULL
)
```

#### Playlists Table (Updated)
```sql
CREATE TABLE playlists (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  userId INTEGER NOT NULL,
  createdDate TEXT NOT NULL,
  modifiedDate TEXT NOT NULL,
  FOREIGN KEY (userId) REFERENCES users(id)
)
```

### Authentication Service

#### Key Methods
- `login(username, password)`: Authenticates user and creates session
- `register({username, email, password})`: Creates new user account
- `logout()`: Clears session and user data
- `canPerformAdminAction()`: Checks if current user is admin

#### Properties
- `currentUser`: Currently logged-in user object
- `isLoggedIn`: Boolean indicating login status
- `isAdmin`: Boolean indicating admin status
- `isInitialized`: Boolean indicating service initialization status

### Session Management
- Uses `shared_preferences` package for persistence
- Stores user ID in local storage
- Automatically restores session on app launch
- Session cleared on logout

## User Flow

### First-Time User
1. App launches → Splash screen
2. No session found → Login screen
3. Click "Register" → Registration screen
4. Fill form and submit → Auto-login → Home screen
5. Create playlists, play music, read e-books

### Returning User
1. App launches → Splash screen
2. Session found → Auto-login → Home screen
3. Continue using app with saved preferences

### Admin User
1. Login with admin credentials
2. Access to all features including add/delete
3. Can manage all content in the library
4. Has same playlist functionality as normal users

## Security Notes

### Password Storage
- Passwords are stored in plain text in the local SQLite database
- **Important**: This is suitable for a local desktop application
- For production/server-based apps, implement proper password hashing (bcrypt, argon2, etc.)

### Session Security
- Session data stored locally using SharedPreferences
- User ID is the only session identifier
- No token-based authentication (suitable for local app)

### Data Isolation
- Playlists are strictly filtered by user ID
- Database queries use user ID to ensure data separation
- Songs and e-books are shared across all users

## Migration from Previous Version

### Database Migration (v6 → v7)
The app automatically migrates the database:
1. Creates `users` table
2. Inserts admin user
3. Adds `userId` column to `playlists` table
4. Sets all existing playlists to admin user (userId = 1)

### First Launch After Update
- Existing users will see the login screen
- Must login as admin or register as new user
- Existing playlists will belong to admin user
- All songs and e-books remain intact

## Troubleshooting

### Cannot Login
- Verify username and password are correct
- Check that user account exists
- For admin: username is `dhammajata`, password is `dhamma1234`

### Playlists Not Showing
- Ensure you're logged in
- Playlists are user-specific - each user sees only their own
- Admin user will see playlists created before migration

### Cannot Add Songs/E-books
- Only admin user can add content
- Normal users will not see add buttons
- Login as admin to add content

### Session Not Persisting
- Check that app has permission to write to local storage
- Try logging out and logging in again
- Clear app data if issues persist

## Future Enhancements

Potential improvements for the authentication system:
1. Password reset functionality
2. Email verification
3. User profile editing
4. Password hashing for security
5. Remember me option
6. Multiple admin users
7. User roles and permissions system
8. Activity logging
9. User statistics and analytics
10. Social features (sharing playlists, etc.)