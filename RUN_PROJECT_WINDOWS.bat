@echo off
setlocal
cd /d "%~dp0"
java -cp "dist\Cafe_Management_System.jar;lib\mysql-connector-j-9.5.0.jar;lib\AbsoluteLayout.jar" features.LoginPanel
if errorlevel 1 (
  echo.
  echo The application could not start. Make sure Java 17 or newer is installed and the database is running.
  pause
)
