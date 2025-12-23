@echo off
echo Resetting database to apply ebooks table migration...
echo.
echo Deleting existing database file...
del /F /Q "C:\Users\cjingquan\Documents\music_player.db" 2>nul
del /F /Q "C:\Users\cjingquan\Documents\music_player.db-shm" 2>nul
del /F /Q "C:\Users\cjingquan\Documents\music_player.db-wal" 2>nul
echo.
echo Database files deleted successfully!
echo.
echo Please restart the Flutter app to create a fresh database with the ebooks table.
echo.
pause